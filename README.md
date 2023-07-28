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

**Lecture slides:**

[Lecture 3](https://docs.google.com/presentation/d/1jjw_-y3PoopOCNpL0YQni-dr2HZGe41jyghCX3gb64U/edit?usp=sharing)

**Readings:**

-   "A Quick Introduction to Version Control with Git and GitHub" [Blischak et al., PLOS COMPBIO 2016](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1004668)
-   "FAIRshake: Toolkit to Evaluate the FAIRness of Research Digital Resources" [Clarke et al., Cell Systems 2020](https://www.sciencedirect.com/science/article/pii/S240547121930345X?via%3Dihub)
-   "A Beginner's Guide to Conducting Reproducible Research" [Alston & Rick, Bulletin of the ESA 2021](https://esajournals.onlinelibrary.wiley.com/doi/full/10.1002/bes2.1801)
-   "A Manifesto for Reproducible Science" [Munafo et al., Nature Human Behavior, 2017](https://www.nature.com/articles/s41562-016-0021) -Optional-

**Resources:**

[Coursera](https://www.coursera.org/search?query=Git&specialization=google-it-automation&utm_medium=sem&utm_source=gg&utm_campaign=B2C_NAMER_google-it-automation_google_FTCOF_professional-certificates_country-US&campaignid=8986236679&adgroupid=119480419197&device=c&keyword=&matchtype=&network=g&devicemodel=&adposition=&creativeid=506915205324&hide_mobile_promo=&gclid=CjwKCAjw-IWkBhBTEiwA2exyO92zcdUCSPVtEK_fHhtoibddhUZJRSpxi03ov08qeLIIX1_lkuFeFBoCw2wQAvD_BwE&index=prod_all_launched_products_term_optimization)

**feedback:**

[5 minute feedback](https://docs.google.com/forms/d/e/1FAIpQLScVwtQgUVg00DfJrFIqdcfs74uFbBYCPoEik1xmD8wZKikhyA/viewform?usp=sf_link)

**Homework Assignment 2:**

[Due June 9th](https://junkdnalab.github.io/acg_2023/assignments/hw2)


---

### June 9th *Principle components analysis, heatmaps and clusterProfiler* (Hazelett)

**Lecture topics:**

- What is PCA?
- Overview of hierarchical clustering and its pitfalls

**Lecture slides:**

[Lecture 4](https://docs.google.com/presentation/d/1ZA0VhlVPAvz5KYq-zK6THmbNRIXdOww1PWVjyTlL1jI/edit?usp=sharing)

**Readings:**

[Principal components analysis primer (2022)](https://www.nature.com/articles/s43586-022-00184-w)

[the dendsort paper](https://f1000research.com/articles/3-177)

**Resources:**

[PCA explained](https://www.youtube.com/watch?v=_UVHneBUBW0)

[Step-by-step PCA (same author)](https://www.youtube.com/watch?v=FgakZw6K1QQ)

[UMAP explained](https://www.youtube.com/watch?v=eN0wFzBA4Sc)

**feedback:**

[5 min feedback](https://docs.google.com/forms/d/e/1FAIpQLSd7Tuu5mMIOZr2gphQjMFEwnqU__4H9DSt7zvzyHDMjE3Fv3Q/viewform?usp=sf_link)

**Homework Assignment 3:**

[Due June 16th](https://junkdnalab.github.io/acg_2023/assignments/hw3.Rmd)

---

### June 16th *Genomics File Formats* (Coetzee)

**Lecture topics:**

-   Understanding NGS file formats
-   Understanding NGS quality assessment

**Lecture slides:**

[Lecture 04](https://junkdnalab.github.io/acg_2023/lectures/file_formats.html)

**feedback:**

[5 min feedback](https://docs.google.com/forms/d/e/1FAIpQLSc_hkByl9eAGl1DN2h7MqDUSRJfBbw-s4SzCROwW0cy7iVnEQ/viewform?usp=sf_link)

**Homework Assignment 4:**

[Due June 23rd](https://junkdnalab.github.io/acg_2023/assignments/hw4.Rmd)

---

### June 23rd *Working with data: Searching NGS File Formats and Using Genome Arithmetic* (Coetzee)

**Lecture topics:**

-   Search for characters or patterns in a text file using the grep
    command
-   Learn to use bedtools to accomplish genome arithmetic.

**Lecture slides:**

[Lecture 05](https://junkdnalab.github.io/acg_2023/lectures/file_searching.html)

[Lecture 05 markdown](https://junkdnalab.github.io/acg_2023/lectures/file_searching.md)

**feedback**

[5 min feedback](https://docs.google.com/forms/d/e/1FAIpQLScBYa_ks2TrPGc9iAil4vlRFfPVn6ytJJCQ5xTwIUt6pJY_Yw/viewform?usp=sf_link)

**Homework Assignment 5:**

[Due June 30th](https://junkdnalab.github.io/acg_2023/assignments/hw5.Rmd)

---

### June 30th *Basics of Alignment and Quality Control* (Coetzee)

**Lecture topics:**

-   Understanding computational context of RNA-Seq.
-   Learning to judge data for quality metrics of RNA-Seq.
-   Quick differential expression analysis.

**Lecture slides:**

[Lecture 06](https://junkdnalab.github.io/acg_2023/lectures/quality_control.html)

[Lecture 06 markdown](https://junkdnalab.github.io/acg_2023/lectures/quality_control.md)

**feedback**

[5 min feedback](https://docs.google.com/forms/d/e/1FAIpQLSc7p6Lxwhb5PqRQ-PxkvHQSVN914Q23L1YoWNedXOe8QbC2Aw/viewform?usp=sf_link)

**Additional files**

[Differential Expression Page](https://junkdnalab.github.io/acg_2023/assignments/ExampleDE.html)

[Differential Expression Rmd](https://junkdnalab.github.io/acg_2023/assignments/ExampleDE.Rmd)

[MultiQC Report](https://junkdnalab.github.io/acg_2023/assignments/post_alignment.html)

**Homework Assignment 6:**

[Due July 7th](https://junkdnalab.github.io/acg_2023/assignments/Homework_6.Rmd)


---

### July 7th *scRNA-seq I: analysis of a single sample* (Coetzee)

**Lecture topics:**

-  Single cell analysis workflow
-  Challenges of analysis
-  Quality control

**Lecture slides:**

[Lecture 08](https://junkdnalab.github.io/acg_2023/lectures/scrna_sprint.html)

[Lecture 08 markdown](https://junkdnalab.github.io/acg_2023/lectures/scrna_sprint.md)

**feedback**

[5 min feedback](https://docs.google.com/forms/d/e/1FAIpQLSdfnhlWU3uuT_6k8a311B8Jrax8UI2OW8evssaDzDp31nw_Ag/viewform?usp=sf_link)

**Readings and websites:**

- [Orchestrating Single-Cell Analysis with Bioconductor (OSCA)](http://bioconductor.org/books/3.14/OSCA/book-contents.html)
- [Seurat](https://satijalab.org/seurat/)
- [Scanpy - single cell analysis with python](https://scanpy.readthedocs.io/en/stable/)
- [scTransform](https://genomebiology.biomedcentral.com/articles/10.1186/s13059-019-1874-1)
- [Pearson Residuals for Normalization](https://genomebiology.biomedcentral.com/articles/10.1186/s13059-021-02451-7)

---

### July 14th *scRNA-seq II: analysis of a patient cohort* (Coetzee)

**Lecture topics:**

-  Data integration methods
-  Cell type annotation
-  Differential Expression

**Lecture Slides:**

[Lecture 09](https://junkdnalab.github.io/acg_2023/lectures/scrna_sprint_continued.html)

[Lecture 09 markdown](https://junkdnalab.github.io/acg_2023/lectures/scrna_sprint_continued.Rpres)

**feedback**

[5 min feedback](https://docs.google.com/forms/d/e/1FAIpQLSdZKAUamE_B8Enm6JEF8Sa2zna71fMds_8uZy-u_Si7zGG-iQ/viewform?usp=sf_link)

**Readings and websites:**

- [Analysis File](https://junkdnalab.github.io/acg_2023/assignments/analysis_withde.r)

- [GPU - probabilistic models for single-cell omics](https://scvi-tools.org/)

**Homework Assignment 7:**

[Due July 28th](https://junkdnalab.github.io/acg_2023/assignments/Homework7.Rmd)

---

### July 21st *BREAK*

---

### July 28th *Analysis of the Microbiome* (Vujkovic-Cvijin)

**Lecture topics:**

16S rRNA sequence data processing and analysis

**Homework Assignment 9:** Follow and complete the tutorial for
[dada2](https://benjjneb.github.io/dada2/tutorial.html) prior to July
28th. Please also install the following R packages: vegan, phyloseq, lmerTest, lme4, ggplot2, dplyr, ape, reshape2

[Download data/code here](https://www.dropbox.com/scl/fo/eepu0rvg25n4ycml7livv/h?rlkey=yedzeixm8192u9wn9zgks3fux&dl=0)

---

### August 4th *Visualization and Color Palettes* (Coetzee)

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

### August 11th *Biological enrichment* (Hazelett)

**Lecture Slides**

TBD 

<!---
[Lecture 11](https://docs.google.com/presentation/d/1_cATSNGzHAaphTXfKcsJ8SzNST4WQMtsqcbsxTg5VGw/edit?usp=sharing)
--->

---


### Schedule and Due Dates:

| day | date  | lecturer        | topic                                                             | due   |
|:----------|:----------|:----------|:---------------------------|:----------|
| Friday | 05/19 | HAZELETT | History of Bioinformatics | |
| Friday | 05/26 | HAZELETT | Basic Unix Skills | | 
| Friday | 06/02 | HAZELETT | Version Control & Git | [Assignment 1](https://junkdnalab.github.io/acg_2023/assignments/hw1) |
| Friday | 06/09 | HAZELETT | PCA, heatmaps, clusterProfiler | [Assignment 2](https://junkdnalab.github.io/acg_2023/assignments/hw2) | 
| Friday | 06/16 | COETZEE | NGS File Formats | [Assignment 3](https://junkdnalab.github.io/acg_2023/assignments/hw3.Rmd) |
| Friday | 06/23 | COETZEE | Searching in files & Genome Arithmetic | [Assignment 4](https://junkdnalab.github.io/acg_2023/assignments/hw4.Rmd) |
| Friday | 06/30 | COETZEE | Advanced Search | [Assignment 5](https://junkdnalab.github.io/acg_2023/assignments/hw5.Rmd) |
| Friday | 07/07 | COETZEE | scRNA-seq I (single sample) | [Assignment 6](https://junknalab.github.io/acg_2023/assignments/Homework_6.Rmd) |
| Friday | 07/14 | COETZEE | scRNA-seq II (patient cohort) | |
| Friday | 07/21 | BREAK | | Assignment 8 |
| Friday | 07/28 | VUJKOVIC-CVIJIN | Microbiome | [Assignment 7](https://junkdnalab.github.io/acg_2023/assignments/Homework7.Rmd) |
| Friday | 08/04 | HAZELETT | Biological Enrichment | Assignmnet 9 |
| Friday | 08/11 | COETZEE | Visualization & Color | Assignment 10 |
