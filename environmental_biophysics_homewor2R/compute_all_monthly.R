library(readxl)
library(writexl)
library(magrittr)
library(dplyr)

data0 <- read_excel("D:\\Environmental_biophysics_homework\\DAY.xlsx")
print(data0)
es <- data0["Ta"]
print(es)
