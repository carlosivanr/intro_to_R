#### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
# Carlos Rodriguez, Ph.D.
# Postdoctoral Fellow, Mind Research Network
# Intro to R Workshop
# February 2022

# Prerequisites:
# 1. Download and install R
# 2. Download and install RStudio
# 3. Working internet connection if required packages are not installed

#### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

# ----------------- Install & load packages -------------
# Only run these lines if you have not installed the packages
# install.packages("tidyverse")
# install.packages("rstatix")
# install.packages("ggpubr")
# install.packages("AMCP")

# Load packages
library(tidyverse)
library(rstatix)
library(ggpubr)
library(AMCP)

# ----------------- Basic R commands -------------
# Assigning variables ----
x <- 10
y <- 20

# Arithmetic ---
# Addition & subtraction
x + y 
y - x

# Multiplication & division
x * 3
y/2

# Exponents
x^2

# Modulo
x %% 3

# ----------------- Functions -----------------
# combine function and print function
num_vec <- c(x, y)
print(num_vec)

# Assign numbers one through ten to a vector
num_vec <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
print(num_vec)

# Shorter hand, read 1 through 10
num_vec <- c(1:10)
print(num_vec)

# Sequence function, similar thing but can add steps
num_vec <- seq(2, 10, by = 2)
print(num_vec)

# Vector Operations
num_vec * 2
num_vec * num_vec

# More functions
mean(num_vec)
sd(num_vec)
var(num_vec)
min(num_vec)
max(num_vec)
prod(num_vec)

# Assign strings/characters to a vector
chr_vec <- c("one", "two", "three", "four", "five")
print(chr_vec)

mean(chr_vec)

# ----------------- Logicals -----------------
# Which values of chr_vec is equal to one?
# two == is for testing equality, also >= or <=
# one = can be use for assignment, like <-, but its 
# behavior is not consistent through out all situations
logicals <- chr_vec == "one"
print(logicals)

# Before running this line code, guess if it will return an error like the 
# mean(chr_vec), explain why?
mean(logicals) 

# Data Types ----
class(num_vec)
class(chr_vec)
class(logicals)

# ----------------- Indexing Vectors -----------------
# Which values of logicals is equal to 10?
logicals <- num_vec == 10
print(logicals)

print(num_vec)

# Indexing with a vector of logicals
num_vec[logicals]

# Index the 5th element
num_vec[5]

# Multiple indexing, index the first and fith element
num_vec[c(1,5)]

# ----------------- Data Frames -----------------
# The data() function lists any built in data frames or data frames with loaded
# libraries. 
# Load the chapter 12 table 1 data from AMCP
data(chapter_12_table_1)

# Create a copy of the data and rename it to something less cumbersome
df <- chapter_12_table_1

# View a data frame
view(df)

# Remove the chapter_12_table_1 data frame. 
# Clearing unused dataframes can save memory
rm(chapter_12_table_1)

# Display the first 3 rows with the head() function
head(df, 3)

# Display the last 3 rows with the tail() function
tail(df, 3)
  # Default for head and tail functions is to display 10 rows
  head(df)
  tail(df)

# Check data types for all columns with the structur colums
str(df)

# Summary data like mean, max, median, quartiles, etc.
summary(df)

# Make a data frame
num_df <- data.frame(num_vec, chr_vec)

# Index an entire data frame column by name, $
  # R is very picky about columns names sometimes indexing column names need to 
  # be encased in `backticks` not to be confused with 'single quotes'.
df$Absent0

# Index an entire data frame column by position, [row, colum]
df[1,1]      #1st row, 1st column
df[1,3]      #1st row, 2nd column
df[10,6]     #10th row, 6th column
df[,5]       #all rows, 5th column

df[1,]       #1st row, all cols, same as df[1,1:6]; first row, cols 1 through 6
df[1:3,]     #rows 1 through 3, same as head(df, 3)

df[1:3, 1:3] #rows 1 through 3, and columns 1 through 3

# ----------------- dplyr verbs -------------
  # The main tidyverse package is dplyr family of fucntions automatically
  # loaded with library(tidyverse). The main dplyr verbs we will cover here are
  # filter, select, group_by, and summarise. The dplyr package also contains the 
  # pipe operator (%>%)

# The select() verb ----
select(df, Absent0)
select(df, Absent0, Present0)           #strings don't need quotes with select()

my_columns <- c("Absent0", "Present0")  #strings need quotes here
select(df, all_of(my_columns))          

# The filter() verb ----
Gender <- c("Male", "Female", "Female", "Male", "Male", 
            "Female", "Male", "Female", "Female", "Male")

# Create a new data frame with the column bind function
df2 <- cbind(df, Gender)

# Print df2 to console
print(df2)

# Filter df2
filter(df2, Gender == "Female")

# Filter gender equals Female OR Present0 greater than or equal to 200
# You could use & for AND instead of OR for other situations
filter(df2, Gender == "Female" | Present0 >= 500)

  # == equal to, != not equal to, > greater than, < less than, 
  # >= greater than or equal to, <= less than or equal to

# The pipe (%>%) operator ----
  # Takes the output of one function and pipes it into another
  # Takes df2 and pipes it into the filter() function
  # the . acts as a place holder for the input data
  # First function filters out "Female"
  # Second function pulls the data from Present0,
  # the output gets piped to the mean() function
  # Notice that pull is used here instead of select
  # pull outputs to a numeric vector whereas
  # select outputs to a dataframe. Notice that help(mean)
  # specifies that mean() works on numeric or logical vectors
df2 %>% 
  filter(., Gender == "Female" ) %>%
  pull(., Present0) %>% mean()
  
# The group_by() and summarise() verbs -----
  # This verb will come in handy when plotting means for bar charts
df2 %>%
  group_by(Gender) %>% 
  summarise(mean = mean(Present0))

df2 %>%
  group_by(Gender) %>% 
  summarise(mean.P0 = mean(Present0), sd.P0 = sd(Present0), 
            mean.P4 = mean(Present4), sd.P4 = sd(Present4)) 

# Other handy tricks with dplyr ----
# Create vector of the animal number
Num <- c(48, 52, 6, 65, 89, 73, 21, 56, 17, 32)

# create a new dataframe
df3 <- cbind(df2, Num)

# List of animal numbers with good data
qc_num <- c(48, 52, 89, 65, 73, 21, 17, 32)

# Filter the data by the values in qc_num
df3 %>%
  filter(Num %in% qc_num)

# Suppose we wanted to exclude values in qc_num, add ! before the column name
df3 %>%
  filter(!Num %in% qc_num)
            
# Convert wide data to long ----
library(reshape)
long.data <- melt(df3, id=c("Num", "Gender"))

# Separate condition and angle into separate columns
long.data <- long.data %>% separate(col = variable,
                       into = c("Condition", "Angle"),
                       sep = -1)

# Check the first few rows
head(long.data)

# Check the structure of long.data
  # Notice that Gender, Condition and Angle are characters
  # When performing statistical analyses it's wise to set these to factors
str(long.data)

# Change variables to factor
long.data$Gender <- as.factor(long.data$Gender)
long.data$Condition <- as.factor(long.data$Condition)
long.data$Angle <- as.factor(long.data$Angle)

str(long.data)

# ----------------- Plotting with ggpubr -----------------
# ggpubr is a wrapper for ggplot2. ggplot2 is one of the main plotting packages
# in R. While ggplot can make some stunning data visualizations, it can be a
# bit challenging to master the syntax. ggpubr uses ggplot2 functions underneath
# the hood, but makes the syntax a simpler at the los off some of the flexibility
# and customization of gpplot2.

# Boxplot two group conditions
ggboxplot(long.data,            # The input data
          "Condition",          # the x variable
          "value")              # the y variable

# Boxplot condition by reaction time, but with separate genders
ggboxplot(long.data, 
          "Condition", 
          "value",
          color = "Gender",     # Colors the boxplots by Gender
          palette = "jco")      # sets the color palette

# Boxplots angle by reaction time, separated by condition, faceted by Gender
ggboxplot(long.data, 
          "Angle", 
          "value", 
          color = "Condition",
          palette = "jco",
          facet.by = "Gender")  # Creates two panels for each Gender

# Line plots faceted by gender
ggline(long.data,
       "Condition",
       "value",
       color = "Angle",
       add = "mean_se",         # Adds the mean and standard error
       palette = "jco",
       facet.by = "Gender")

# Stats with rstatix ----
# rstatix is another wrapper for many of the built-in stats functions in R. It
# simplifies the syntax, works with the dplyr pipe operator, and integrates well
# with ggpubr. Together, rstatix and ggpubr alleviate soften the learning 
# curve with R.

# Formula notation: y ~ x1 + x2 + x3

# n.b. - The t-test and 1-way ANOVA function are for demonstrative purposes only
# since they wouldn't be appropriate for these chapter 12 AMCP data.


# Independent samples t-test
t_test(long.data,                 # input data
       value ~ Condition)         # formula read as predict value by cond.

# Using the Anova framework for independent samples t-test
# recall that t-value squared == F statistic
anova_test(long.data,             
           value ~ Condition,   
           type = 3,              # which sums of squares?, SPSS defaults to 3
           effect.size = "pes")   # SPSS defaults to partial eta squared (pes)

# Including an interaction term
anova_test(long.data,                
           value ~ Condition * Gender,         
           type = 3,              
           effect.size = "pes")

# Alternate form of writing the above
anova_test(long.data,
           dv = value,
           between = c(Condition, Gender),
           type = 3,
           effect.size = "pes")

# Repeated measures ANOVA, add within and wid arguments
anova_test(long.data,
           dv = value,
           within = c(Condition, Angle),
           wid = Num,
           type = 3,
           effect.size = "pes")

# How to get help ----
# Use the help function with the name of the function
help(anova_test)

# Download the manual from CRAN
# https://cran.r-project.org/web/packages/rstatix/index.html


# Loading your own data  Pt 1.----
# Use the Environment pane to import a data file

# Loading your own data  Pt 2.----
# Where are you in your directory structure?
getwd()

# Navigate to where you downloaded the github repository using the Files pane
# Click on gear icon (More), select set as working directory

# Load your data
my_data <- read_csv("ch12_tbl1.csv")

#### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###