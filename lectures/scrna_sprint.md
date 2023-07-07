<style>
.small-code pre code {
  font-size: 1 em;
}
.reveal small {
  position: absolute;
  bottom: 0;
  font-size: 50%;
}
.reveal .slides{
    width: 90% !important;  
    height: 90% !important;
}
.reveal p{
  line-height: 1.5 !important;
}
.reveal code{
  background-color: #F8F8F8;
  color: #1E90FF;
}
.reveal code.bad {
  color: #B73239;
  background-color: #F4F4F4;
}
.reveal pre code {
  white-space: pre;
  overflow: auto;
  color: #00008B;
}
</style>

Lecture 8: A Sprint Through Single Cell RNA-Seq
========================================================
author: Simon Coetzee
date: 07/07/2023
width: 1920
height: 1080
transition: fade


<small>" A Sprint Through Single Cell RNA-Seq" is licensed under [CC BY](https://creativecommons.org/licenses/by/4.0/) by Simon Coetzee.</small>



Before we start
========================================================
type: alert
# Download Data file from 
# https://cloud.coetzee.me/s/msE6PM5sRPcmFfS/download/single_cell_rnaseq.zip
# to your rstudio session.
# and open 'single_cell_rnaseq.Rproj' in Rstudio.

Before we start
========================================================
type: alert
## install some software:

```r
BiocManager::install(c("cowplot", "RCurl", "Seurat", "SingleCellExperiment"))
```
These steps might take a little while

Why?
========================================================

- Across and within tissues there is a great diversity of cell types, states, and interactions.

Why?
========================================================

- Across and within tissues there is a great diversity of cell types, states, and interactions.
- Single Cell RNA-seq offers a glimpse of what genes are being expressed at the level of individual cells.

Why?
========================================================

- Across and within tissues there is a great diversity of cell types, states, and interactions.
- Single Cell RNA-seq offers a glimpse of what genes are being expressed at the level of individual cells.


What can we use it to do?
========================================================

- Explore which cell types are present in a tissue.
- Identify unknown/rare cell types or states.
- Examine the changes in gene expression during differentiation processes, or across time, or across states.
- Identify genes that are differentially expressed in particular cell types between conditions (treatment, disease, etc.)
- Explore these changes while incorporating spatial, regulatory, or protien information.


What can we use it to do?
========================================================

![](sc_analyses.png)

Compared to Bulk RNA-seq
========================================================

  - compares averages of cellular expression.
  - is a good choice for quantifying expression signatures for disease studies.
  - potential for the discovery of disease biomarkers if you're *not expecting or concerned about cellular heterogeneity*.
  
<center>
![](sc_vs_bulk_cells.png)
</center>
<small>Trapnell, C. Defining cell types and states with single-cell genomics, Genome Research 2015 (doi: https://dx.doi.org/10.1101/gr.190595.115)</small>

A sprint:
========================================================
<center>
![](single_cell_process.png)
</center>

A sprint:
========================================================
<center>
![](sc_reads.png)
</center>

A quick detour - Single Cell or Single Nucleus:
========================================================
It is also possible to only sequence the nuclei of the cells.
- Single-cell profiling does not always provide an unbiased view on cell types for specific tissues or organs, such as, for example, the brain (or skeletal muscle or adipose).
  - during tissue dissociation, some cell-types are more vulnerable and more difficult to capture.
  - non-neuronal cells survive dissociation better than neurons and are over represented in single-cell.
  
- Single-cell requires fresh tissue.
  - nuclei are more resistant to mechanical force, and can be safely isolated from frozen tissue.

## Resulting biases from these two methods are not fully known. However it has been shown that nuclei accurately reflect all transcriptional patterns of cells

<small>Ding, J., Adiconis, X., Simmons, S.K. et al. Systematic comparison of single-cell and single-nucleus RNA-sequencing methods. Nat Biotechnol 38, 737–746 (2020). https://doi.org/10.1038/s41587-020-0465-8</small>


A sprint:
========================================================

<center>
<img src = "preprocessing.png" height = "800" />
</center>
<small>Luecken, MD and Theis, FJ. Current best practices in single‐cell RNA‐seq
analysis: a tutorial, Mol Syst Biol 2019 
(doi: https://doi.org/10.15252/msb.20188746)</small>

A sprint:
========================================================

## In order to get count matrices we need to quanitfy gene expression.
- 10x sequencing, as we saw biases strongly to the 3' end of the gene.
- cost of not (necessarily) covering the full gene length, making it difficult to unambiguously align reads to a transcript and distinguishing between different isoforms

- However, we can then use unique molecular identifiers - UMIs to resolve biases in amplification.
- The usage of UMIs further allows for normalization of gene counts to be performed without a loss of accuracy.
<center>
<img src = "gem.png" height = "400" />
</center>

A sprint:
========================================================
<center>
<img src = "overview_raw_data_processing.jpg" height = "800" />
</center>

A sprint - quantification:
========================================================
Before having a complete count matrix, two particular quality control steps must be performed:
- Empty droplet detection
- Doublet detection

A sprint - quantification:
========================================================
Before having a complete count matrix, two particular quality control steps must be performed:
- Empty droplet detection
<center>
<img src = "alevinQC.png" height = "700" />
</center>

A sprint - quantification:
========================================================
Before having a complete count matrix, two particular quality control steps must be performed:
- Doublet detection
<center>
<img src = "doublet.png" height = "700" />
</center>


A sprint:
========================================================

<center>
<img src = "qc_and_norm.png" height = "800" />
</center>
<small>Luecken, MD and Theis, FJ. Current best practices in single‐cell RNA‐seq
analysis: a tutorial, Mol Syst Biol 2019 
(doi: https://doi.org/10.15252/msb.20188746)</small>

A sprint:
========================================================

<center>
<img src = "data_correction_feature_selection.png" height = "800" />
</center>
<small>Luecken, MD and Theis, FJ. Current best practices in single‐cell RNA‐seq
analysis: a tutorial, Mol Syst Biol 2019 
(doi: https://doi.org/10.15252/msb.20188746)</small>

A sprint:
========================================================

<center>
<img src = "cluster_feature_anno.png" height = "800" />
</center>
<small>Luecken, MD and Theis, FJ. Current best practices in single‐cell RNA‐seq
analysis: a tutorial, Mol Syst Biol 2019 
(doi: https://doi.org/10.15252/msb.20188746)</small>

A sprint:
========================================================

<center>
<img src = "downstream.png" height = "800" />
</center>
<small>Luecken, MD and Theis, FJ. Current best practices in single‐cell RNA‐seq
analysis: a tutorial, Mol Syst Biol 2019 
(doi: https://doi.org/10.15252/msb.20188746)</small>

A sprint:
========================================================

The steps of the workflow are:

- Generation of the count matrix (method-specific steps): formating reads, demultiplexing samples, mapping and quantification
- Quality control of the raw counts: filtering of poor quality cells
- Clustering of filtered counts: clustering cells based on similarities in transcriptional activity (cell types = different clusters)
- Marker identification and cluster annotation: identifying gene markers for each cluster and annotating known cell type clusters
- Optional downstream steps

Regardless of the analysis being done, conclusions about a population based on a single sample per condition are not trustworthy. ***BIOLOGICAL REPLICATES ARE STILL NEEDED!*** That is, if you want to make conclusions that correspond to the population and not just the single sample.

scRNA-seq challenges
========================================================

scRNA-seq is able to capture expression at the cellular level, however

- sample generation and library prep is more expensive.
- the analysis is much more complicated and more difficult to interpret.

The data complexity involves:
- Large volumes of data
- Low depth of sequencing per cell
- Technical variability across cells/samples
- Biological variability across cells/samples

Large volumes of data.
========================================================

Expression data from scRNA-seq represents tens or hundres of thousands of reads 
for thousands of cells.

This output is much larger than normal bulk RNA-seq, and requires higher amounts
of memory to analyze, larger storage requirements, and more time to run the 
analysis.

Low depth of sequencing per cell
========================================================

For the droplet-based methods of scRNA-seq, the depth of sequencing is shallow, often detecting only 10-50% of the transcriptome per cell.

This results in cells showing zero counts for many of the genes. However, in a particular cell, a zero count for a gene could either mean that the gene was not being expressed or the transcripts were just not detected.
___

![](zero_inflate.png)

<small>
Jiang, R., Sun, T., Song, D. et al. Statistics or biology: the zero-inflation controversy about scRNA-seq data. Genome Biol 23, 31 (2022). https://doi.org/10.1186/s13059-022-02601-5
</small>


Low depth of sequencing per cell
========================================================
### Droplet (10x) data is not zero inflated
![](mean_var.png)
___
![](mean_dropout.png)

<small>
Svensson, V. Droplet scRNA-seq is not zero-inflated. Nat Biotechnol 38, 147–150 (2020). https://doi.org/10.1038/s41587-019-0379-5
</small>

Low depth of sequencing per cell
========================================================
![](imputation.png)
![](imputation_conclusion.png)

Biological variability across cells/samples
========================================================

Uninteresting sources of biological variation can result in gene expression between cells being more similar/different than the actual biological cell types/states, which can obscure the cell type identities. Uninteresting sources of biological variation (unless part of the experiment’s study) include:

- Transcriptional bursting: Gene transcription is not turned on all of the time for all genes. Time of harvest will determine whether gene is on or off in each cell.
- Varying rates of RNA processing: Different RNAs are processed at different rates.
- Continuous or discrete cell identities (e.g. the pro-inflammatory potential of each individual T cell): Continuous phenotypes are by definition variable in gene expression, and separating the continuous from the discrete can sometimes be difficult.
- Environmental stimuli: The local environment of the cell can influence the gene expression depending on spatial position, signaling molecules, etc.
- Temporal changes: Fundamental fluctuating cellular processes, such as cell cycle, can affect the gene expression profiles of individual cells.

Biological variability across cells/samples
========================================================
<center>
<img src = "sc_biol_variability.png" height = "800" />
</center>


Technical variability across cells/samples
========================================================

Technical sources of variation can result in gene expression between cells being more similar/different based on technical sources instead of biological cell types/states, which can obscure the cell type identities. Technical sources of variation include:

- Cell-specific capture efficiency: Different cells will have differing numbers of transcripts captured resulting in differences in sequencing depth (e.g. 10-50% of transcriptome).
- Library quality: Degraded RNA, low viability/dying cells, lots of free floating RNA, poorly dissociated cells, and inaccurate quantification of cells can result in low quality metrics
- Amplification bias: During the amplification step of library preparation, not all transcripts are amplified to the same level.
- Batch effects: Batch effects are a significant issue for scRNA-Seq analyses, since you can see significant differences in expression due solely to the batch effect.


Batch Effects
========================================================

<center>
<img src = "batch_effects.png" height = "800" />
</center>
<small>
Stephanie C Hicks, F William Townes, Mingxiang Teng, Rafael A Irizarry, Missing data and technical variability in single-cell RNA-sequencing experiments, Biostatistics, Volume 19, Issue 4, October 2018, Pages 562–578, https://doi.org/10.1093/biostatistics/kxx053
</small>

Batch Effects
========================================================

How to know whether you have batches?

- Were all RNA isolations performed on the same day?
- Were all library preparations performed on the same day?
- Did the same person perform the RNA isolation/library preparation for all samples?
- Did you use the same reagents for all samples?
- Did you perform the RNA isolation/library preparation in the same location?

Any of these indicate that your data contains batch effects.

___

How to not have them:

- Design the experiment in a way to avoid batches, if possible.
- If unable to avoid batches:
  - Do NOT confound your experiment by batch
  - DO split replicates of the different sample groups across batches. The more replicates the better (definitely more than 2), if doing DE across conditions or making conclusions at the population level.
  - DO include batch information in your experimental metadata. During the analysis, we can regress out variation due to batch or integrate across batches, so it doesn’t affect our results if we have that information.
  
Single Cell Quality Control
========================================================
### Goals
- To filter the data to only include true cells that are of high quality, so that when we cluster our cells it is easier to identify distinct cell type populations.

- To identify any failed samples and either try to salvage the data or remove from analysis, in addition to, trying to understand why the sample failed

### Challenges
- Delineating cells that are poor quality from less complex cells

- Choosing appropriate thresholds for filtering, so as to keep high quality cells without removing biologically relevant cell types


Single Cell Quality Control
========================================================
### There are three columns of information:
- orig.ident: this column will contain the sample identity if known. It will default to the value we provided for the project argument when loading in the data
- nCount_RNA: this column represents the number of UMIs per cell
- nFeature_RNA: this column represents the number of genes detected per cell

### In order to create the appropriate plots for the quality control analysis, we need to calculate some additional metrics. These include:

- number of genes detected per UMI: this metric with give us an idea of the complexity of our dataset (more genes detected per UMI, more complex our data)
- mitochondrial ratio: this metric will give us a percentage of cell reads originating from the mitochondrial genes


Single Cell Quality Control
========================================================

Now that we have generated the various metrics to assess, we can explore them with visualizations. We will assess various metrics and then decide on which cells are low quality and should be removed from the analysis:

- Cell counts
- UMI counts per cell
- Genes detected per cell
- UMIs vs. genes detected
- Mitochondrial counts ratio
- Novelty

Cell Counts
========================================================

The cell counts are determined by the number of unique cellular bar codes detected. For this experiment, between 12,000 -13,000 cells are expected.

In an ideal world, you would expect the number of unique cellular bar codes to correspond to the number of cells you loaded. However, this is not the case as capture rates of cells are only a proportion of what is loaded. 

10X capture efficiency is between 50-60%.

Occasionally a hydrogel can have more than one cellular barcode. Similarly, with the 10X protocol there is a chance of obtaining only a barcoded bead in the emulsion droplet (GEM) and no actual cell. Both of these, in addition to the presence of dying cells can lead to a higher number of cellular barcodes than cells.

UMI counts (transcripts) per cell
========================================================
The UMI counts per cell should generally be above 500, that is the low end of what we expect. If UMI counts are between 500-1000 counts, it is usable but the cells probably should have been sequenced more deeply.

Genes detected per cell
========================================================
For high quality data, the proportional histogram should contain a single large peak that represents cells that were encapsulated.

There can be a small shoulder to the left of the major peak (not present in our data), or a bimodal distribution of the cells.
  - some cells that failed?
  - biologically different types of cells
    - quiescent cell populations
    - less complex cells
    - cells that are much smaller
 
UMIs vs. genes detected
========================================================
Two metrics that are often evaluated together are the number of UMIs and the number of genes detected per cell.

Cells that are poor quality are likely to have low genes and UMIs per cell.

Mitochondrial read fractions are only high in particularly low count cells with few detected genes (darker colored data points). This could be indicative of damaged/dying cells whose cytoplasmic mRNA has leaked out through a broken membrane, and thus, only mRNA located in the mitochondria is still conserved.

Mitochondrial counts ratio
========================================================
This metric can identify whether there is a large amount of mitochondrial contamination from dead or dying cells. We define poor quality samples for mitochondrial counts as cells which surpass the 0.2 mitochondrial ratio mark, unless of course you are expecting this in your sample.

Can't count on this absolutely - kidney cells often have high mitochrondrial RNA levels - the tissue is associated with mitochondrial function.

Complexity
========================================================

Novelty score is computed by taking the ratio of nGenes over nUMI. 

If there are many captured transcripts (high nUMI) and a low number of genes detected in a cell, this likely means that you only captured a low number of genes and simply sequenced transcripts from those lower number of genes over and over again. 

These low complexity (low novelty) cells could represent a specific cell type (i.e. red blood cells which lack a typical transcriptome), or could be due to some other strange artifact or contamination.

Generally, we expect the novelty score to be above 0.80 for good quality cells.

Filtering
========================================================

Consider the joint effects of these metrics when setting thresholds and set them to be as permissive as possible to avoid filtering out viable cell populations unintentionally.

Often the recommendations are a rough guideline, and the specific experiment needs to inform the exact thresholds chosen. We will use the following thresholds:

- nUMI > 500
- nGene > 250
- log10GenesPerUMI > 0.8
- mitoRatio < 0.2
 
***
A more general recommendation from recent literature is to be quite liberal with allowing cells through to exclude poor-quality cells while avoiding bias against some subpopulations by excluding cells that are outliers according to at least two of the following thresholds: 
- nUMI >2.5 MADs or <5 MADs
- nGene >2.5 MADs or <5 MADs, 
- pct_counts_in_top_20_features > or <5 MADs, 
- featcount_dist (distance to expected ratio of log10 counts and features) > or <5 MADs,
- pct_counts_Mt >2.5 MADs and >0.08.

<small>Germain, PL., Sonrel, A. & Robinson, M.D. pipeComp, a general framework for the evaluation of computational pipelines, reveals performant single cell RNA-seq preprocessing tools. Genome Biol 21, 227 (2020). https://doi.org/10.1186/s13059-020-02136-7</small>


Normalization
========================================================
### Goals:
- To accurately normalize and scale the gene expression values to account for differences in sequencing depth and overdispersed count values.
- To identify the most variant genes likely to be indicative of the different cell types present.

### Challenges:
- Checking and removing unwanted variation so that we do not have cells clustering by artifacts downstream

### Recommend:
Regress out number of UMIs (default using sctransform), mitochondrial content, and cell cycle, if needed and appropriate for experiment, so not to drive clustering downstream.

Explore sources of unwanted variation
========================================================

Correction for biological covariates serves to single out particular biological signals of interest, while correcting for technical covariates may be crucial to uncovering the underlying biological signal. 

The most common biological data correction is to remove the effects of the cell cycle on the transcriptome.

The raw counts are not comparable between cells and we can’t use them as is for our exploratory analysis.

Evaluating effects of cell cycle
========================================================

To assign each cell a score based on its expression of G2/M and S phase markers, we can use the Seuart function `CellCycleScoring()`. This function calculates cell cycle phase scores based on canonical markers that required as input.

After scoring the cells for cell cycle, we would like to determine whether cell cycle is a major source of variation in our dataset using PCA. To perform PCA, we need to first choose the most variable features, then scale the data.

Scaling data is requred so that our "highly variable genes" don't just reflect high expression.

- adjusting the expression of each gene to give a mean expression across cells to be 0
- scaling expression of each gene to give a variance across cells to be 1

Integration
========================================================
### Goals:

To align same cell types across conditions.

### Challenges:

Aligning cells of similar cell types so that we do not have clustering downstream due to differences between samples, conditions, modalities, or batches

### Recommendations:

Go through the analysis without integration first to determine whether integration is necessary

Integration
========================================================
<center>
<img src = "integration_sac.png" height = "750" />
</center>
<small>
http://bioconductor.org/books/3.14/OSCA.multisample/differential-abundance.html#sacrificing-differences
</small>

