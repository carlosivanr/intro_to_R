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
#### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
