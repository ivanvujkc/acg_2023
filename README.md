# Intro to Applied Computational Genomics

Note: This Syllabus is subject to change.

## Course Abstract

The goal of this course is to initiate wetlab biologists on the Ph.D. track to some basic skills in bioinformatics and computational genomics, and acquire basic computer literacy needed to perform analyses of next
generation sequencing experiments.
We will attend fundamental concepts in the analysis and interpretation of genomics data with a focus on single-cell and microbiome technologies, and explore the structure of key data types and their associated file formats. Twelve lectures is far to short a course to be considered comprehensive. Nonetheless we strive to empower students with basic skills to advocate for and analyze their own data.

## Course Format

The course takes place over 12 weeks with 1.5 hour lectures on Fridays 10:30 AM - 12:00 PM. Most lectures are accompanied by either readings or some light homework or both. Any assignments must be completed on time for full credit, no exceptions. There is no final exam.

## Expectations: Attendance, Homework & Grading

Late assignments will be given a maximum of 50% of full credit up to one lecture *after* the original due date. When homework is not assigned, points will be given for attendance. Readings are indicated on the syllabus. Each question set is worth 10 points and will be graded based on completeness. Links to lecture slides and readings will be provided in the syllabi below.

**Attendance is required** no exceptions. You may obtain permission ahead of time or with extenuating circumstances after the fact from the graduate school (email to Emma Yates Kassler). Homework assignments are required on time (see schedule below) regardless of attendance or for half credit **one lecture late**. Unexcused absences result in an incomplete grade.

After each lecture, a link will be posted to provide feedback. Attendance will be recorded by the completion of the "5 minute feedback". There will be three questions, with space for brief answers: 

- What was the most important concept or take home message you learned from today's class?
- What concepts or topics from today's class do you not understand well enough?
- What suggestions do you have for improving or enhancing today's class?

Frequently asked questions or topics of confusion will be addressed in the subsequent lecture.

## Lecture & assignment schedule:

---

### May 19th *History of Bioinformatics* (Hazelett)

**Lecture topics:**

-   Introduction
-   Course overview
-   History of bioinformatics
-   Introduction to Unix

**Lecture slides:**

[Lecture 01](https://docs.google.com/presentation/d/1M494y7PrMkPkoFUtxQZinA-U2dSLoc_Thxt8xJsIHlI/edit?usp=sharing)

**readings:**

-   [Hagen NRG 2000](https://www.nature.com/articles/35042090)
-   [Gauthier *et al.*,
    2018](https://academic.oup.com/bib/article/20/6/1981/5066445)

**feedback:**

[5 minute feedback](https://docs.google.com/forms/d/e/1FAIpQLSeVMFk3mUwnUiz5t0AKx-rgEY1RgRl7pOOLrtMsJMvTp2-H0g/viewform?usp=sf_link)

---

### May 26th *Basic Unix Skills* (Hazelett)

**Lecture topics:**

- More basic unix and tour the unix file system

**Lecture slides:**

[Lecture 02 - starts slide 36](https://docs.google.com/presentation/d/1M494y7PrMkPkoFUtxQZinA-U2dSLoc_Thxt8xJsIHlI/edit?usp=sharing)

**feedback:**

[5 minute feedback](https://docs.google.com/forms/d/e/1FAIpQLSd_iIINjhiSFfOFJTpStJXdI-kt5kzMuA1viaBLCVRGPFpsAQ/viewform?usp=sf_link)

**Homework Assignment 1:**

[Due June 2nd](https://github.com/Junkdnalab/acg_2023/blob/main/assignments/hw1.md)

---

### June 2nd *Version control with Git* (Hazelett)

**Lecture topics:**

- What is reproducible science?
- Git Basics; creating and cloning a repo
- Adding, committing, and pull requests
- Reproducible science: the compileable manuscript (Guest Peter Nguyen)

**Readings:**

-   "A Quick Introduction to Version Control with Git and GitHub" [Blischak et al., PLOS COMPBIO 2016](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1004668)
-   "FAIRshake: Toolkit to Evaluate the FAIRness of Research Digital Resources" [Clarke et al., Cell Systems 2020](https://www.sciencedirect.com/science/article/pii/S240547121930345X?via%3Dihub)
-   "A Beginner's Guide to Conducting Reproducible Research" [Alston & Rick, Bulletin of the ESA 2021](https://esajournals.onlinelibrary.wiley.com/doi/full/10.1002/bes2.1801)
-   "A Manifesto for Reproducible Science" [Munafo et al., Nature Human Behavior, 2017](https://www.nature.com/articles/s41562-016-0021) -Optional-

**feedback:**

[5 minute feedback](https://docs.google.com/forms/d/e/1FAIpQLScVwtQgUVg00DfJrFIqdcfs74uFbBYCPoEik1xmD8wZKikhyA/viewform?usp=sf_link)

**Homework Assignment 2:**

[Due June 9th](https://junkdnalab.github.io/acg_2023/assignments/hw2)


---

### June 9th *Principle components analysis, heatmaps and clusterProfiler* (Hazelett)

**Lecture topics:**

- What is PCA?
- Overview of hierarchical clustering and its pitfalls
- You don't really understand heatmaps
- complexHeatmap
- clusterProfiler

**Lecture slides:**

TBD

**Homework Assignment 3:**

TBD

---

### June 16th *Genomics File Formats* (Coetzee)

**Lecture topics:**

-   Understanding NGS file formats
-   Understanding NGS quality assessment

**Lecture slides:**

TBD
<!---
[Lecture
03](https://junkdnalab.github.io/hgg_2022/lecture%203/file_formats.html)
-->

**Homework Assignment 4:**

TBD
<!---
[Due March
31st](https://junkdnalab.github.io/hgg_2022/homework/hw2.html)
--->

---

### June 23rd *Working with data on the command line: Searching NGS File Formats* (Coetzee)

**Lecture topics:**

-   Search for characters or patterns in a text file using the grep
    command
-   Write to and append a file using output redirection
-   Use the pipe `|` character to chain together commands

**Lecture slides:**

TBD
<!---
[Lecture
06](https://junkdnalab.github.io/hgg_2022/lecture%204/file_searching.html)
--->

**Homework Assignment 5:**

TBD

---

### June 30th *Working with data on the command line: awk & bedtools - **MORE** Searching NGS File Formats* (Coetzee)

**Lecture topics:**

-   Search for characters or patterns in a column specific manner using
    awk.
-   Learn to use bedtools to accomplish genome arithmetic.

**Lecture slides:**

TBD

<!---
[Lecture
07](https://junkdnalab.github.io/hgg_2022/lecture%205/more_file_searching.html)
--->

**Homework Assignment 6:**
TBD
<!---
[Due July 7th](https://junkdnalab.github.io/hgg_2022/homework/hw3.html)
--->

---

### July 7th *scRNA-seq I: analysis of a single sample* (Coetzee)

**Lecture topics:**

-  Single cell analysis workflow
-  Challenges of analysis
-  Quality control

**Lecture slides:**

TBD
<!---
[Lecture 08](https://junkdnalab.github.io/hgg_2022/lecture%208/scrna_sprint.html)
--->

**Readings and websites:**

- [Orchestrating Single-Cell Analysis with Bioconductor (OSCA)](http://bioconductor.org/books/3.14/OSCA/book-contents.html)
- [Seurat](https://satijalab.org/seurat/)
- [Scanpy - single cell analysis with python](https://scanpy.readthedocs.io/en/stable/)
- [scTransform](https://genomebiology.biomedcentral.com/articles/10.1186/s13059-019-1874-1)
- [Pearson Residuals for Normalization](https://genomebiology.biomedcentral.com/articles/10.1186/s13059-021-02451-7)

**Homework Assignment 7:**
TBD

---

### July 14th *scRNA-seq II: analysis of a patient cohort* (Coetzee)

**Lecture topics:**

-  Data integration methods
-  Cell type annotation
-  Velocity and Pseudotime

**Lecture Slides:**

TBD

**Readings and websites:**

- [GPU - probabilistic models for single-cell omics](https://scvi-tools.org/)

**Homework Assignment 8:**

TBD

---

### July 21st *BREAK*

---

### July 28th *Analysis of the Microbiome* (Vujkovic-Cvijin)

**Lecture topics:**

16S rRNA sequence data processing and analysis

**Homework Assignment 9:** Follow and complete the tutorial for
[dada2](https://benjjneb.github.io/dada2/tutorial.html) prior to April
14. Please also install the following R packages: vegan, phyloseq, lmerTest, lme4, ggplot2, dplyr, ape, reshape2

---

### August 4th *Biological enrichment* (Hazelett)

**Lecture Slides**

TBD 

<!---
[Lecture 11](https://docs.google.com/presentation/d/1_cATSNGzHAaphTXfKcsJ8SzNST4WQMtsqcbsxTg5VGw/edit?usp=sharing)
--->

**Homework Assignment 10:**

Due April 26: Create a private git repo and populate with all prior homework assignments. See lecture slides.

---

### August 11th *Visualization and Color Palettes* (Coetzee)

**Lecture topics:**

-  Color Perception
-  Visual Accessibility
-  Visualization of Data

**Lecture slides:**

TBD

<!---
[Lecture 12](https://docs.google.com/presentation/d/1y4UKosh58zD5C02yFsKFTTLPtOYLNLEaBm69y_srinw/edit?usp=sharing)
--->

**Helpful Books on the Subject:**

- [THE VISUAL DISPLAY OF QUANTITATIVE INFORMATION](https://www.edwardtufte.com/tufte/books_vdqi)
- [Data Visualization: A Practical Introduction](https://kieranhealy.org/publications/dataviz/)

---

### Schedule and Due Dates:

| day | date  | lecturer        | topic                                                             | due   |
|:----------|:----------|:----------|:---------------------------|:----------|
| Friday | 05/19 | HAZELETT | History of Bioinformatics | |
| Friday | 05/26 | HAZELETT | Basic Unix Skills | | 
| Friday | 06/02 | HAZELETT | Version Control & Git | [Assignment 1](https://junkdnalab.github.io/acg_2023/assignments/hw1) |
| Friday | 06/09 | HAZELETT | PCA, heatmaps, clusterProfiler | [Assignment 2](https://junkdnalab.github.io/acg_2023/assignments/hw2) | 
| Friday | 06/16 | COETZEE | NGS File Formats | Assignment 3 |
| Friday | 06/23 | COETZEE | Bedtools & Awk | Assignment 4 |
| Friday | 06/30 | COETZEE | Advanced Search | Assignment 5 |
| Friday | 07/07 | COETZEE | scRNA-seq I (single sample) | Assignment 6 |
| Friday | 07/14 | COETZEE | scRNA-seq II (patient cohort) | Assignment 7 |
| Friday | 07/21 | BREAK | | Assignment 8 |
| Friday | 07/28 | VUJKOVIC-CVIJIN | Microbiome | |
| Friday | 08/04 | HAZELETT | Biological Enrichment | Assignmnet 9 |
| Friday | 08/11 | COETZEE | Visualization & Color | Assignment 10 |
