
<!-- README.md is generated from README.Rmd. Please edit that file -->

![Last-changedate](https://img.shields.io/badge/last%20change-2022--02--05-brightgreen.svg)
[![minimal R
version](https://img.shields.io/badge/R%3E%3D-4.0.1-6666ff.svg)](https://cran.r-project.org/)
[![ORCiD](https://img.shields.io/badge/ORCiD-0000--0002--3993--1182-green.svg)](http://orcid.org/0000-0002-3993-1182)

# redoxpeat

### Compendium URL

<https://github.com/henningte/redoxpeat> or
<https://doi.org/10.5281/zenodo.5792970>

### Authors

Henning Teickner (<henning.teickner@uni-muenster.de>), Chuanyu Gao,
Klaus-Holger Knorr

### Contents

This repository contains the data and code for our paper (Teickner, Gao,
and Knorr 2022):

> Henning Teickner, Chuanyu Gao, Klaus-Holger Knorr (2022).
> *Electrochemical Properties of Peat Particulate Organic Matter on a
> Global Scale: Relation to Peat Chemistry and Degree of Decomposition*.
> Global Biochemical Cycles. DOI:
> [10.1029/2021GB007160](https://www.doi.org/10.1029/2021GB007160).

### How to download or install

You can download the compendium as a zip from from this URL:
<https://doi.org/10.5281/zenodo.5792970>

Or you can install this compendium as an R package, redoxpeat, from
GitHub with:

``` r
remotes::install_github("henningte/redoxpeat")
```

### How to use

#### Reproduce the analyses

To reproduce the analyses for the paper, open the Rstudio project
included in this research compendium and run the Rmarkdown script in
`analysis/paper/001-paper-main.rmd`. To also get the final reference
list, run `analysis/paper/007-latex.Rmd` afterwards.

Running the whole script takes about two hours and occupies additional
disk space of \~11 Gb.

Alternatively, the [Dockerfile](Dockerfile) can be used to build a
Docker image from which all analyses can be reproduced. The Dockerfile
ensures that all required dependencies are installed (e.g.┬áspecific R
packages; this is managed using the R package
[renv](https://rstudio.github.io/renv/articles/renv.html)).

The [Dockerfile](Dockerfile) provides instructions how to build a Docker
image from the Dockerfile and how to run the image in a Docker
container. It occupies disk space of \~7 Gb.

When the Docker image runs in a container, go to `localhost:8787` in
your Browser. You will find an RStudio interface where you can log in
with username `rstudio` and password `redoxpeat`. Here you can find the
Rmarkdown scripts (`redoxpeat/analysis/paper/001-paper-main.rmd` and
`analysis/paper/007-latex.Rmd`) as described above.

#### Access to the R scripts

All R scripts used to produce the results for the analyses are in folder
[analysis/paper](analysis/paper).

#### Access to the data

The compendium contains all data used during the analyses of the paper:

1.  General information on peat samples: `d`  
2.  General information on sites: `d_sites`  
3.  Peat electron accepting capacity (EAC) and electron donating
    capacity (EDC) of suspensions of freeze dried peat: `el_t0`  
4.  Peat iron content and speciation (from acid extraction): `fe_t0`  
5.  Peat elemental contents (C, N) and isotope signatures
    (\(\delta^{13}\)C, \(\delta^{15}\)N): `d_irms`  
6.  Peat elemental contents from wavelength-dispersive X-ray
    fluorescence: `d_xrf`  
7.  Peat mid infrared spectra (not preprocessed): `d_mir`  
8.  EAC/EDC data extracted from Aeschbacher et al. (2012):
    `aeschbacher2012`  
9.  EAC/EDC data extracted from Tan et al. (2017): `tan2017`  
10. EAC/EDC data extracted from Walpen et al. (2018): `walpen2018`

There is a full documentation available for each dataset. For example,
to read the documentation for `el_t0`, type:

``` r
library(redoxpeat)
?el_t0
```

#### Access to models for predicting the EAC/EDC from mid infrared spectra

Functions to get predictions from the fitted models to predict the
EAC/EDC from id infrared spectra are available via the R package
[irpeat](https://github.com/henningte/irpeat/) (Teickner and Hodgkins
2021).

#### Detailed overview on the files contained in the compendium

  - `README.md`/`README.Rmd`: Readme for the compendium.
  - `DESCRIPTION`: The R package DESCRIPTION file for the compendium.
  - `NAMESPACE`: The R package NAMESPACE file for the compendium.
  - `LICENSE.md`: Details on the license for the code in the compendium.
  - `CONTRIBUTING.md` and `CONDUCT.md`: Files with information on how to
    contribute to the compendium.
  - `Dockerfile`: Dockerfile to build a Docker image for the compendium.
  - `.Rbuildignore`, `.gitignore`, `.dockerignore`: Files to ignore
    during R package building, to ignore by Git, and to ignore while
    bulding a Docker image, respectively.
  - `configure`/`configure.win`: Files created with rstantools in order
    to integrate Stan models into the R package.
  - `renv.lock`: renv lock file (Lists all R package dependencies and
    versions and can be used to restore the R package library using
    renv). `renv.lock` was created by running `renv::snapshot()` in the
    R package directory and it uses the information included in the
    `DESCRIPTION` file.
  - `.Rprofile`: Code to run upon project start.
  - `R`, `man`, `inst`, `data-raw`, `data`, `src`: Default folders for
    making the R package and integration with Stan via rstatools run.
  - `analysis`:
      - `data`: Folder with the input data included in the R package
        (see scripts in `data-raw`).
      - `scripts`:
          - `figures`: Folder with figures for the manuscript not
            derived from data (conceptual figures, etc.).
          - `templates`: Folder with LaTeX and Rmarkdown templates for
            the manuscript.
          - `paper`: Folder with template files and scripts to create
            the manuscript.
              - `000-preamble.tex`: LaTeX setup for the manuscript.
              - `001-paper-main.Rmd`: Main Rmarkdown file that
                represents the body of code and text of the manuscript.
                Run this to reproduce the manuscript.
              - `002-paper-sites.Rmd`: Child Rmarkdown file of
                `001-paper-main.Rmd` to process general information on
                the sampling sites.
              - `003-regression-elco.Rmd`: Child Rmarkdown file of
                `001-paper-main.Rmd` to compute the element ratio-based
                regression models to predict the EAC<sub>POM</sub> and
                EDC<sub>POM</sub>.
              - `004-regression-mirs.Rmd`: Child Rmarkdown file of
                `001-paper-main.Rmd` to compute the mid infrared
                spectra-based regression models to predict the
                EAC<sub>POM</sub> and EDC<sub>POM</sub>.
              - `005-paper-abstract-graphical.Rmd`: Rmarkdown document
                used to create parts of the figures for the graphical
                abstract.
              - `006-paper-supplementary.Rmd`: Rmarkdown file to be run
                from within `001-paper-main.Rmd`. This script contains
                code and text for the supporting information.
              - `007-latex.Rmd`: Rmarkdown file to be run after
                `001-paper-main.Rmd` to generate the full reference
                lists in the rendered pdf file and clean up
                `006-paper-supplementary.tex`.
              - `references.bib`: Literature references for the
                manuscript.
              - `references_or.bib`: Original Literature references for
                the manuscript. `references.bib` is created from
                `references_or.bib` by `007-latex.Rmd`.
              - `agujournal2018.cls`: The Agu Journal class derived from
                the rticles package.
              - `trackchanges.sty`: The trackchanges TeX package needed
                to run the LaTeX template from rticles.
              - `si.aux`: Auxiliary file containing the definitions for
                the supplementary references in `001-paper-main.tex`.
                This file is generated from `007-latex.Rmd`.
              - `001-paper-main.tex`/`001-paper-main.pdf`: The LaTeX/PDF
                document resulting from rendering `001-paper-main.Rmd`.
              - `006-paper-supplementary.tex`/`006-paper-supplementary.pdf`:
                The LaTeX/PDF document resulting from rendering
                `006-paper-supplementary.Rmd`.

### Acknowledgements

For their support during sample collection/provision, we would like to
thank Svenja Agethen (DE), Werner Borken (SKY I-1, SKY I-6), Tanja
Broder (PBR, SKY II, LT, MK), Mariusz Ga┼éka (LT, MK), Liam Heffernan
(LP, LB), Norbert H├Âlzel (KR, ISH), Annkathrain H├Âmberg (TX, DT), Tim
Moore (MB), Sindy Wagner (BB), Tim-Martin Wertebach (KR, ISH), and
Zhi-Guo Yu (TX, DT).  
Analyses of this study were carried out in the laboratory of the
Institute of Landscape Ecology. Svenja Agethen and Michael Sander
provided analytical support. The assistance of Ulrike Berning-Mader,
Madeleine Supper, Victoria Ratachin, and numerous student assistants is
greatly acknowledged. We thank Dr.┬áHendrik Wetzel, Fraunhofer Institute
for Applied Polymer Research, Dept. Starch Modification/Molecular
Properties, Potsdam, Germany, for analysis of O and H. The workflow was
reproduced by the Reproducible Research Support Service of the
University of M├╝nster. We thank two anonymous reviewers whose comments
helped to improve the manuscript.  
This Study was funded by the Deutsche Forschungsgemeinschaft (DFG,
German Research Foundation) grant no. KN 929/12-1 to Klaus-Holger Knorr;
Chuanyu Gao was supported by the Youth Innovation Promotion Association
CAS (No.┬á2020235).

### How to cite

Please cite this compendium as:

> Henning Teickner, Chuanyu Gao, Klaus-Holger Knorr, (2022).
> *Reproducible research compendium with R code and data for:
> ÔÇśElectrochemical Properties of Peat Particulate Organic Matter on a
> Global Scale: Relation to Peat Chemistry and Degree of
> DecompositionÔÇÖ*. Accessed 05 Feb 2022. Online at
> <https://doi.org/10.5281/zenodo.5792970>

### Licenses

**Text and figures:** [CC
BY 4.0](https://creativecommons.org/licenses/by/4.0/)

**Code:** See the [DESCRIPTION](DESCRIPTION) file

**Data:** [CC-0](http://creativecommons.org/publicdomain/zero/1.0/)
attribution requested in reuse

**LaTeX templates:** The LaTeX templates are derived from the rticles R
package.

### Contributions

We welcome contributions from everyone. Before you get started, please
see our [contributor guidelines](CONTRIBUTING.md). Please note that this
project is released with a [Contributor Code of Conduct](CONDUCT.md). By
participating in this project you agree to abide by its terms.

### References/Sources

The format of this research compendium is inspired by Marwick (2017).
The Rmarkdown template for the main article is from the rticles package
(Allaire et al. 2020).

<div id="refs" class="references">

<div id="ref-Aeschbacher.2012">

Aeschbacher, Michael, Cornelia Graf, Ren├ę P. Schwarzenbach, and Michael
Sander. 2012. ÔÇťAntioxidant properties of humic substances.ÔÇŁ
*Environmental science & technology* 46 (9): 4916ÔÇô25.
<https://doi.org/10.1021/es300039h>.

</div>

<div id="ref-Allaire.2020">

Allaire, J. J., Yihui Xie, R. Foundation, Hadley Wickham, Journal of
Statistical Software, Ramnath Vaidyanathan, Association for Computing
Machinery, et al. 2020. ÔÇťrticles: Article Formats for R Markdown.ÔÇŁ
<https://github.com/rstudio/rticles>.

</div>

<div id="ref-Marwick.2017">

Marwick, Ben. 2017. ÔÇťResearch compendium for the 1989 excavations at
Madjedbebe rockshelter, NT, Australia.ÔÇŁ figshare.
<https://doi.org/10.6084/m9.figshare.1297059>.

</div>

<div id="ref-Tan.2017">

Tan, Wenbing, Beidou Xi, Guoan Wang, Jie Jiang, Xiaosong He, Xuhui Mao,
Rutai Gao, et al. 2017. ÔÇťIncreased Electron-Accepting and Decreased
Electron-Donating Capacities of Soil Humic Substances in Response to
Increasing Temperature.ÔÇŁ *Environmental science & technology* 51 (6):
3176ÔÇô86. <https://doi.org/10.1021/acs.est.6b04131>.

</div>

<div id="ref-Teickner.2022">

Teickner, Henning, Chuanyu Gao, and Klaus-Holger Knorr. 2022.
ÔÇťElectrochemical Properties of Peat Particulate Organic Matter on a
Global Scale: Relation to Peat Chemistry and Degree of Decomposition.ÔÇŁ
*Global Biogeochemical Cycles*, February.
<https://doi.org/10.1029/2021GB007160>.

</div>

<div id="ref-Teickner.2021">

Teickner, Henning, and Suzanne B. Hodgkins. 2021. ÔÇťIrpeat: Simple
Functions to Analyze Mid Infrared Spectra of Peat Samples.ÔÇŁ Zenodo.
<https://doi.org/10.5281/ZENODO.5792919>.

</div>

<div id="ref-Walpen.2018">

Walpen, Nicolas, Gordon J. Getzinger, Martin H. Schroth, and Michael
Sander. 2018. ÔÇťElectron-Donating Phenolic and Electron-Accepting Quinone
Moieties in Peat Dissolved Organic Matter: Quantities and Redox
Transformations in the Context of Peat Biogeochemistry.ÔÇŁ *Environmental
science & technology* 52 (9): 5236ÔÇô45.
<https://doi.org/10.1021/acs.est.8b00594>.

</div>

</div>
