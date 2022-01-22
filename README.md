# Introduction to R
- California State University, Chico
- Author: [Carlos Rodriguez](https://keen-wilson-61a022.netlify.app/)
- Date: TBD

[**Download the workshop materials by clicking here**](https://github.com/carlosivanr/r_talk/).

## Pre-workshop instructions
In this workshop, we will be covering basic commands and statistics in R to get you over the hump and start programming with R.

**Install Software** \
A working installation of both R and RStudio is required. R and RStudio are two completely different things. R is the core programming language and RStudio is an integrated development environment (IDE) that lets you work with.
- [Install R](http://cran.wustl.edu/)
- [Install RStudio](https://www.rstudio.com/products/rstudio/download/#download)

**Install Packages** \
When installing R, you are getting a "base" version. We can add features and functionality to R by installing and then loading packages.

- Open RStudio
- Click on the "Console" tab in the left hand pane of RStudio
- To install packages, use the `install.packages()` function. This function takes the name of the package to be installed encased in single or double quotes as its input argument. The following commands can be copy-pasted and then run in the RStudio Console.
 ```{r}
 install.packages("tidyverse")
 install.packages("rstatix")
 install.packages("ggpubr")
 install.packages("AMCP")
 ```

**Load Packages** \
Once a package is installed, it needs to be loaded into the R Session to become available for use. Packages need to be installed during each session. To load a package, use the `library()` function. Simply pass in the name of the package, with out quotes as its input. The following can be copy pasted into the console.
 ```{r}
 library(tidyverse)
 library(rstatix)
 library(ggpubr)
 library(AMCP)
 ```

