rm(list = ls())

library(ggplot2)
library(lubridate)
library(dplyr)
library(dygraphs)
library(xts)

source("fun.R",encoding = "UTF-8")

filename <<- "test.csv"
super_maestro (filename)

filename <<- "train.csv"
super_maestro (filename)
