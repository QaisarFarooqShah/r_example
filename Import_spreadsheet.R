## Step No 1: Startup and Import the data in the Rstudio.

rm(list = ls())
require(readxl) # to read excel file
require(data.table) # to split the date column  
require(ggplot2)  # to plot

setwd("D:/")

## Read Data 
data <- read_xlsx("skill_eval.xlsx",skip = 1)
