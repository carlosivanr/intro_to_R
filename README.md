# Introduction to R
- Workshop for R CSU Chico
- Author: [Carlos Rodriguez](https://keen-wilson-61a022.netlify.app/)
- Date: TBD

[**Download the workshop materials by clicking here**](https://github.com/carlosivanr/r_talk/).

## Pre-workshop instructions
Since we will be covering X, Y, and Z in R. First we will need to have a working setup of R and RStudio on your computer.

**Install Software** \
For this workshop, a working installation of both R and RStudio is needed. If you are new to R, you can think of R as the core programming language and functions to perform statistical analyses. RStudio, on the other hand, is an integrated development environment (IDE). This means that writing code, viewing objects, and plots are all in one convenient software environment. While RStudio is not necessary to work with R, R is most definitely needed for RStudio to work properly. As a side note, RStudio also supports Python, so it's possible to use RStudio and integrate the best of the both R and Python in your research projects.
- [Install R](http://cran.wustl.edu/)
- [Install RStudio](https://www.rstudio.com/products/rstudio/download/#download)

**Install Packages** \
One of the cool things about R is that you can modify its functionality to streamline some of the tasks that can be tedious or to gain functionality. This is accomplished by installing packages.

- Open RStudio
- Click on the "Console" tab in the left hand pane of RStudio
- To install packages, use the `install.packages()` function. This function takes the name of the package to be installed encased in single or double quotes as its input argument. The following commands can be copy-pasted into an RStudio Console
 ```{r}
 install.packages("tidyverse")
 install.packages("rstatix")
 install.packages("ggpubr")
 install.packages("AMCP")
 ```

**Load Packages** \
Once a package is installed, it needs to be loaded into the R Session to become available for use. This has to be done during each session. To load a package, use the `library()` function. Simple pass in the name of the package, with out quotes as its input.
 ```{r}
 library(tidyverse)
 library(rstatix)
 library(ggpubr)
 library(AMCP)
 ```

