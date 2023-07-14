###
### Download Data file from https://cloud.coetzee.me/index.php/s/Jd7HWQpZwkEMP5p
### and open 'single_cell_rnaseq.Rproj' in Rstudio.

# BiocManager::install("glmGamPoi")
# BiocManager::install("harmony")
# Load libraries
library(SingleCellExperiment)
library(Seurat)
library(tidyverse)
library(Matrix)
library(scales)
library(cowplot)
library(RCurl)
library(viridisLite)

# How to read in 10X data for a single sample (output is a sparse matrix)
ctrl_counts <- Read10X(data.dir = "data/ctrl_raw_feature_bc_matrix")

# Turn count matrix into a Seurat object (output is a Seurat object)
ctrl <- CreateSeuratObject(counts = ctrl_counts,
                           min.features = 100)

# Explore the metadata
head(ctrl@meta.data)

# Create a Seurat object for each sample
for (file in c("ctrl_raw_feature_bc_matrix", "stim_raw_feature_bc_matrix")){
  seurat_data <- Read10X(data.dir = paste0("data/", file))
  seurat_obj <- CreateSeuratObject(counts = seurat_data, 
                                   min.features = 100, 
                                   project = file)
  assign(file, seurat_obj)
}


# Check the metadata in the new Seurat objects
head(ctrl_raw_feature_bc_matrix@meta.data)
head(stim_raw_feature_bc_matrix@meta.data)

# Create a merged Seurat object
merged_seurat <- merge(x = ctrl_raw_feature_bc_matrix, 
                       y = stim_raw_feature_bc_matrix, 
                       add.cell.id = c("ctrl", "stim"))

# Check that the merged object has the appropriate sample-specific prefixes
head(merged_seurat@meta.data)
tail(merged_seurat@meta.data)

# Explore merged metadata
View(merged_seurat@meta.data)

# Add number of genes per UMI for each cell to metadata
merged_seurat$log10GenesPerUMI <- log10(merged_seurat$nFeature_RNA) / log10(merged_seurat$nCount_RNA)

# Compute percent mito ratio
merged_seurat$mitoRatio <- PercentageFeatureSet(object = merged_seurat, pattern = "^MT-")
merged_seurat$mitoRatio <- merged_seurat@meta.data$mitoRatio / 100

# Create metadata dataframe
metadata <- merged_seurat@meta.data

# Add cell IDs to metadata
metadata$cells <- rownames(metadata)

# Create sample column
metadata$sample <- NA
metadata$sample[which(str_detect(metadata$cells, "^ctrl_"))] <- "ctrl"
metadata$sample[which(str_detect(metadata$cells, "^stim_"))] <- "stim"

# Rename columns
metadata <- metadata %>%
  dplyr::rename(seq_folder = orig.ident,
                nUMI = nCount_RNA,
                nGene = nFeature_RNA)

# Add metadata back to Seurat object
merged_seurat@meta.data <- metadata

# Create .RData object to load at any time
save(merged_seurat, file="data/merged_filtered_seurat.RData")

### --------------------- ###
# Visualize the number of cell counts per sample
metadata %>% 
  ggplot(aes(x=sample, fill=sample)) + 
  geom_bar() +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1)) +
  theme(plot.title = element_text(hjust=0.5, face="bold")) +
  ggtitle("NCells")

# Visualize the number UMIs/transcripts per cell
metadata %>% 
  ggplot(aes(color=sample, x=nUMI, fill= sample)) + 
  geom_density(alpha = 0.2) + 
  scale_x_log10() + 
  theme_classic() +
  ylab("Cell density") +
  geom_vline(xintercept = 500)


# Visualize the distribution of genes detected per cell via histogram
metadata %>% 
  ggplot(aes(color=sample, x=nGene, fill= sample)) + 
  geom_density(alpha = 0.2) + 
  theme_classic() +
  scale_x_log10() + 
  geom_vline(xintercept = 300)

# Visualize the distribution of genes detected per cell via boxplot
metadata %>% 
  ggplot(aes(x=sample, y=log10(nGene), fill=sample)) + 
  geom_boxplot() + 
  theme_classic() +
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1)) +
  theme(plot.title = element_text(hjust=0.5, face="bold")) +
  ggtitle("NCells vs NGenes")

# Visualize the correlation between genes detected and number of UMIs and determine whether strong presence of cells with low numbers of genes/UMIs
metadata %>% 
  ggplot(aes(x=nUMI, y=nGene, color=mitoRatio)) + 
  geom_point() + 
  scale_colour_gradient(low = "gray90", high = "black") +
  stat_smooth(method=lm) +
  scale_x_log10() + 
  scale_y_log10() + 
  theme_classic() +
  geom_vline(xintercept = 500) +
  geom_hline(yintercept = 250) +
  facet_wrap(~sample)

# Visualize the distribution of mitochondrial gene expression detected per cell
metadata %>% 
  ggplot(aes(color=sample, x=mitoRatio, fill=sample)) + 
  geom_density(alpha = 0.2) + 
  scale_x_log10() + 
  theme_classic() +
  geom_vline(xintercept = 0.2)

# Visualize the overall complexity of the gene expression by visualizing the genes detected per UMI
metadata %>%
  ggplot(aes(x=log10GenesPerUMI, color = sample, fill=sample)) +
  geom_density(alpha = 0.2) +
  theme_classic() +
  geom_vline(xintercept = 0.8)

# Normalize the counts
seurat_qc <- NormalizeData(merged_seurat)

# Identify the most variable genes
seurat_qc <- FindVariableFeatures(seurat_qc, 
                                  selection.method = "vst",
                                  nfeatures = 2000, 
                                  verbose = FALSE)

# Scale the counts
seurat_qc <- ScaleData(seurat_qc)

# Perform PCA
seurat_qc <- RunPCA(seurat_qc)

# Plot the PCA colored by sample phase
DimPlot(seurat_qc,
        reduction = "pca",
        group.by= "sample",
        split.by = "sample")
# Run UMAP
seurat_qc <- RunUMAP(seurat_qc, 
                     dims = 1:40,
                     reduction = "pca")
# Plot samples on UMAP
DimPlot(seurat_qc,
        reduction = "umap",
        group.by= "sample",
        split.by = "sample")

# Create Variable that marks all cells to be removed
seurat_qc$remove <- with(seurat_qc@meta.data, (nUMI >= 500) & 
                           (nGene >= 250) & 
                           (log10GenesPerUMI > 0.80) & 
                           (mitoRatio < 0.20))
seurat_qc$remove <- !seurat_qc$remove

# Observe QC features on UMAP
FeaturePlot(seurat_qc,
            features = c("nUMI",
                         "nGene",
                         "log10GenesPerUMI",
                         "mitoRatio",
                         "remove"),
            split.by = "sample",
            order = TRUE,
            keep.scale = NULL,
            col = cividis(n = 1000))


# Quick filter on our thresholds
after.filtering <- subset(x = seurat_qc, 
                          subset= (nUMI >= 500) & 
                            (nGene >= 250) & 
                            (log10GenesPerUMI > 0.80) & 
                            (mitoRatio < 0.20))

# Observe removed samples
FeaturePlot(after.filtering,
            features = c("nUMI",
                         "nGene",
                         "log10GenesPerUMI",
                         "mitoRatio"),
            split.by = "sample",
            order = TRUE,
            col = cividis(n = 1000))

### --------------------- ###
# Filter out low quality cells using selected thresholds - these will change with experiment
filtered_seurat <- subset(x = merged_seurat, 
                          subset= (nUMI >= 500) & 
                            (nGene >= 250) & 
                            (log10GenesPerUMI > 0.80) & 
                            (mitoRatio < 0.20))

# Extract counts
counts <- GetAssayData(object = filtered_seurat, slot = "counts")

# Output a logical matrix specifying for each gene on whether or not there are more than zero counts per cell
nonzero <- counts > 0

# Sums all TRUE values and returns TRUE if more than 10 TRUE values per gene
keep_genes <- Matrix::rowSums(nonzero) >= 10

# Only keeping those genes expressed in more than 10 cells
filtered_counts <- counts[keep_genes, ]

# Reassign to filtered Seurat object
filtered_seurat <- CreateSeuratObject(filtered_counts, meta.data = filtered_seurat@meta.data)

# Create .RData object to load at any time
save(filtered_seurat, file="data/seurat_filtered.RData")


### --------------------- ###
# Normalize the counts
seurat_phase <- NormalizeData(filtered_seurat)
# Load cell cycle markers
load("data/cycle.rda")

# Score cells for cell cycle
seurat_phase <- CellCycleScoring(seurat_phase, 
                                 g2m.features = g2m_genes, 
                                 s.features = s_genes)

# View cell cycle scores and phases assigned to cells                                 
View(seurat_phase@meta.data)                                

# Identify the most variable genes
seurat_phase <- FindVariableFeatures(seurat_phase, 
                                     selection.method = "vst",
                                     nfeatures = 2000, 
                                     verbose = FALSE)

# Scale the counts
seurat_phase <- ScaleData(seurat_phase)

# Perform PCA
seurat_phase <- RunPCA(seurat_phase)

# Plot the PCA colored by cell cycle phase
DimPlot(seurat_phase,
        reduction = "pca",
        group.by= "Phase",
        split.by = "Phase")

# Examine mitochondrial expression, by quartiles
quantile(seurat_phase@meta.data$mitoRatio)

# Create mitoFr categorical variables
seurat_phase@meta.data$mitoFr <- cut(seurat_phase@meta.data$mitoRatio, 
                                     breaks=c(-Inf, 0.0144, 0.0199, 0.0267, Inf), 
                                     labels=c("Low","Medium","Medium high", "High"))

# Plot the PCA colored by mitochondrial fraction
DimPlot(seurat_phase,
        reduction = "pca",
        group.by= "mitoFr",
        split.by = "mitoFr")

# Split seurat object by condition to perform cell cycle scoring and SCT on all samples
split_seurat <- SplitObject(seurat_phase, split.by = "sample")

split_seurat <- split_seurat[c("ctrl", "stim")]

# We run the following loop to perform the sctransform on all samples
for (i in 1:length(split_seurat)) {
  split_seurat[[i]] <- SCTransform(split_seurat[[i]], vars.to.regress = c("mitoRatio"), vst.flavor = "v2")
}
## slow ^^
save(split_seurat, file="data/split_seurat.RData")
seurat_phase <- RunUMAP(seurat_phase, 
                        dims = 1:40,
                        reduction = "pca")
DimPlot(seurat_phase,
        reduction = "umap")

integ_features <- SelectIntegrationFeatures(object.list = split_seurat, 
                                            nfeatures = 3000)
marker_genes <- c("CD14", "LYZ", "FCGR3A", "MS4A7", "FCER1A", "CST3", "IL3RA", "GZMB",
                  "SERPINF1", "ITM2C", "CD79A", "MS4A1", "CD3D", "CD3D", "IL7R",
                  "CCR7", "CD3D", "CD8A", "GNLY", "NKG7", "PPBP", "HBB", "HBA2", "MARCO", 
                  "ITGAM", "ADGRE1", "HSPH1", "HSPE1", "DNAJB1")
integ_features_and_marker_genes <- unique(c(integ_features, marker_genes))
split_seurat <- PrepSCTIntegration(object.list = split_seurat, 
                                   anchor.features = integ_features)
integ_anchors <- FindIntegrationAnchors(object.list = split_seurat, 
                                        normalization.method = "SCT", 
                                        anchor.features = integ_features)
## slow ^^
seurat_integrated <- IntegrateData(anchorset = integ_anchors, 
                                   features.to.integrate = integ_features_and_marker_genes,
                                   normalization.method = "SCT")
seurat_integrated <- RunPCA(object = seurat_integrated)

# Plot PCA
PCAPlot(seurat_integrated,
        split.by = "sample")  
seurat_integrated <- RunUMAP(seurat_integrated, 
                             dims = 1:40,
                             reduction = "pca")

# Plot UMAP                             
DimPlot(seurat_integrated)
DimPlot(seurat_phase)

# # Perform log-normalization and feature selection, as well as SCT normalization on global object
# harmonized_seurat <- filtered_seurat %>%
#   NormalizeData() %>%
#   FindVariableFeatures(selection.method = "vst", nfeatures = 2000) %>% 
#   ScaleData() %>%
#   SCTransform(vars.to.regress = c("mitoRatio"), vst.flavor = "v2")
# 
# # Calculate PCs using variable features determined by SCTransform (3000 by default)
# harmonized_seurat <- RunPCA(harmonized_seurat, assay = "SCT", npcs = 50)
# 
# library("harmony")
# harmonized_seurat <- RunHarmony(harmonized_seurat, 
#                                 group.by.vars = c("seq_folder"), 
#                                 reduction = "pca", assay.use = "SCT", reduction.save = "harmony")
# harmonized_seurat <- RunUMAP(harmonized_seurat, reduction = "harmony", assay = "SCT", dims = 1:40)
# DimPlot(harmonized_seurat, split.by = "sample")

# Determine the K-nearest neighbor graph
seurat_integrated <- FindNeighbors(object = seurat_integrated, 
                                   dims = 1:40)
# Determine the clusters for various resolutions                                
seurat_integrated <- FindClusters(object = seurat_integrated,
                                  resolution = c(0.4, 0.6, 0.8, 1.0, 1.4, 2.0))
# Explore resolutions
seurat_integrated@meta.data %>% View()

# Assign identity of clusters
Idents(object = seurat_integrated) <- "integrated_snn_res.0.8"
# Plot the UMAP
DimPlot(seurat_integrated,
        reduction = "umap",
        label = TRUE,
        label.size = 6)

# Assign identity of clusters
Idents(object = seurat_integrated) <- "integrated_snn_res.0.4"
# Plot the UMAP
DimPlot(seurat_integrated,
        reduction = "umap",
        label = TRUE,
        label.size = 6)

# harmonized_seurat <- FindNeighbors(object = harmonized_seurat, 
#                                    reduction = "harmony")
# harmonized_seurat <- FindClusters(harmonized_seurat, resolution = c(0.2, 0.4, 0.6, 0.8, 1.0, 1.2))
# Idents(object = harmonized_seurat) <- "SCT_snn_res.0.8"
# DimPlot(harmonized_seurat,
#         reduction = "umap",
#         label = TRUE,
#         label.size = 6)

Idents(object = seurat_integrated) <- "integrated_snn_res.0.8"

n_cells <- FetchData(seurat_integrated, 
                     vars = c("ident", "orig.ident")) %>%
  dplyr::count(ident, orig.ident) %>%
  tidyr::spread(ident, n)

# View table
View(n_cells)

# Explore whether clusters segregate by cell cycle phase
DimPlot(seurat_integrated,
        label = TRUE, 
        split.by = "Phase")  + NoLegend()

# Determine metrics to plot present in seurat_integrated@meta.data
metrics <-  c("nUMI", "nGene", "S.Score", "G2M.Score", "mitoRatio")

FeaturePlot(seurat_integrated, 
            reduction = "umap", 
            features = metrics,
            pt.size = 0.4, 
            order = TRUE,
            min.cutoff = 'q10',
            label = TRUE)

# Defining the information in the seurat object of interest
columns <- c(paste0("PC_", 1:16),
             "ident",
             "UMAP_1", "UMAP_2")

## Exploration of the PCs driving the different clusters
# Extracting this data from the seurat object
pc_data <- FetchData(seurat_integrated, 
                     vars = columns)
# Adding cluster label to center of cluster on UMAP
umap_label <- FetchData(seurat_integrated, 
                        vars = c("ident", "UMAP_1", "UMAP_2"))  %>%
  group_by(ident) %>%
  summarise(x=mean(UMAP_1), y=mean(UMAP_2))

# Plotting a UMAP plot for each of the PCs
map(paste0("PC_", 1:16), function(pc){
  ggplot(pc_data, 
         aes(UMAP_1, UMAP_2)) +
    geom_point(aes_string(color=pc), 
               alpha = 0.7) +
    scale_color_viridis_c(guide = FALSE, option = "E", direction = -1)  +
    geom_text(data=umap_label, 
              aes(label=ident, x, y)) +
    ggtitle(pc)
}) %>% 
  plot_grid(plotlist = .)

## genes driving PC_2 exhibit higher expression in clusters 8 and 12.

# Examine PCA results 
print(seurat_integrated[["pca"]], dims = 1:5, nfeatures = 5)

## GNLY and NKG7 genes as positive markers of PC_2,
## we can hypothesize that clusters 8 and 12 correspond to NK cells

# CD14+ monocyte markers
FeaturePlot(seurat_integrated, 
            reduction = "umap", 
            features = c("CD14", "LYZ"), 
            order = TRUE,
            min.cutoff = 'q10',
            keep.scale = "all",
            label = TRUE)

# FCGR3A+ monocyte markers
FeaturePlot(seurat_integrated, 
            reduction = "umap", 
            features = c("FCGR3A", "MS4A7"), 
            order = TRUE,
            min.cutoff = 'q10',
            label = TRUE)

# Macrophages
FeaturePlot(seurat_integrated, 
            reduction = "umap", 
            features = c("MARCO", "ITGAM", "ADGRE1"), 
            order = TRUE,
            min.cutoff = 'q10', 
            label = TRUE)

# Conventional dendritic cell markers
FeaturePlot(seurat_integrated, 
            reduction = "umap", 
            features = c("FCER1A", "CST3"), 
            order = TRUE,
            min.cutoff = 'q10', 
            label = TRUE)

# Plasmacytoid dendritic cell markers
FeaturePlot(seurat_integrated, 
            reduction = "umap", 
            features = c("IL3RA", "GZMB", "SERPINF1", "ITM2C"), 
            order = TRUE,
            min.cutoff = 'q10', 
            label = TRUE)

# CD4+ T cells (4,0,6,2)
FeaturePlot(seurat_integrated, 
            reduction = "umap", 
            features = c("CD3D", "IL7R", "CCR7"), 
            order = TRUE,
            min.cutoff = 'q10', 
            label = TRUE)

## DO NOT RUN ##
# FindConservedMarkers(seurat_integrated,
#                      ident.1 = cluster,
#                      grouping.var = "sample",
#                      only.pos = TRUE,
#                      min.diff.pct = 0.25,
#                      min.pct = 0.25,
#                      logfc.threshold = 0.25)

# Test on one cluster
cluster0_conserved_markers <- FindConservedMarkers(seurat_integrated,
                                                   ident.1 = 0,
                                                   grouping.var = "sample",
                                                   only.pos = TRUE,
                                                   logfc.threshold = 0.25)
View(cluster0_conserved_markers)

# Create function to get conserved markers for any given cluster
### Run the FindConservedMarkers() function
### Transfer row names to a column using rownames_to_column() function
### Merge in annotations
### Create the column of cluster IDs using the cbind() function
get_conserved <- function(cluster){
  FindConservedMarkers(seurat_integrated,
                       ident.1 = cluster,
                       grouping.var = "sample",
                       only.pos = TRUE) %>%
    rownames_to_column(var = "gene") %>%
    left_join(y = unique(annotations[, c("gene_name", "description")]),
              by = c("gene" = "gene_name")) %>%
    cbind(cluster_id = cluster, .)
}
# Iterate function across desired clusters
conserved_markers <- map_dfr(c(4,0,6,2), get_conserved)

# Extract top 10 markers per cluster
top10 <- conserved_markers %>% 
  mutate(avg_fc = (ctrl_avg_log2FC + stim_avg_log2FC) /2) %>% 
  group_by(cluster_id) %>% 
  top_n(n = 10, 
        wt = avg_fc)

# Visualize top 10 markers per cluster
View(top10)

# Plot interesting marker gene expression for cluster 4
FeaturePlot(object = seurat_integrated, 
            features = c("HSPH1", "HSPE1", "DNAJB1"),
            order = TRUE,
            min.cutoff = 'q10', 
            label = TRUE,
            repel = TRUE)

VlnPlot(object = seurat_integrated, 
        features = c("HSPH1", "HSPE1", "DNAJB1"))

## Differential Expression
# The SingleCellExperiment object conveniently provides the patient id (ind), treatment status (stim) and cell type (cell):
sce <- muscData::Kang18_8vs8()
colData(sce)

## For demonstration purpose, we will work on a subset of the genes and cells:
set.seed(1)
# Take highly expressed genes and proper cells:
sce_subset <- sce[rowSums(counts(sce)) > 100, 
                  sample(which(sce$multiplets == "singlet" & 
                                 ! is.na(sce$cell) &
                                 sce$cell %in% c("CD4 T cells", "B cells", "NK cells")), 
                         1000)]
# Convert counts to dense matrix
counts(sce_subset) <- as.matrix(counts(sce_subset))
# Remove empty levels because glm_gp() will complain otherwise
sce_subset$cell <- droplevels(sce_subset$cell)

# This ensures that we get reliable p-value by treating each patient as a replicate and not each cell
sce_reduced <- pseudobulk(sce_subset, group_by = vars(ind, stim, cell))

# We will identify which genes in CD4 positive T-cells are changed most by the treatment.
# We will fit a full model including the interaction term stim:cell. 
# The interaction term will help us identify cell type specific responses to the treatment:

fit <- glm_gp(sce_reduced, design = ~ cell + stim +  stim:cell - 1,
              reference_level = "NK cells")
summary(fit)

# looking at the cooeficients of our model:
colnames(fit$Beta)

# The contrast argument specifies what we want to compare
# We test the expression difference of stimulated and control T-cells
de_res <- test_de(fit, contrast = cond(cell = "CD4 T cells", stim = "ctrl") - cond(cell = "CD4 T cells", stim = "stim")) 

# Most different genes
head(de_res[order(de_res$pval), ])

ggplot(de_res, aes(x = lfc, y = -log10(pval))) +
  geom_point(size = 0.6, aes(color = adj_pval < 0.1)) +
  ggtitle("Volcano Plot", "Genes that change most through interferon-beta treatment in T cells")

# We can still do marker genes with this framework too:
fit_full <- glm_gp(sce_subset, design = ~ cell + stim +  stim:cell - 1,
                   reference_level = "NK cells")
marker_genes <- test_de(fit_full, `cellCD4 T cells` - `cellB cells`, sort_by = pval)
head(marker_genes)

# If we want find genes that differ in the stimulated condition, we just include 
# the additional coefficients in the contrast:
  
marker_genes2 <- test_de(fit_full, (`cellCD4 T cells` + `cellCD4 T cells:stimstim`) - 
                             (`cellB cells` + `cellB cells:stimstim`), 
                           sort_by = pval)

head(marker_genes2)

# We identify many genes related to the human leukocyte antigen (HLA) system that
# is important for antigen presenting cells like B-cells, but are not expressed
# by T helper cells. The plot below shows the expression differences

tmp <- data.frame(gene = rep(marker_genes$name[1:6], times = ncol(sce_subset)),
                  expression = c(counts(sce_subset)[marker_genes$name[1:6], ]),
                  celltype = rep(sce_subset$cell, each = 6))

ggplot(tmp, aes(x = celltype, y = expression)) +
  geom_jitter(height = 0.1) +
  stat_summary(geom = "crossbar", fun = "mean", color = "red") +
  facet_wrap(~ gene, scales = "free_y") +
  ggtitle("Marker genes of B vs. T cells")
