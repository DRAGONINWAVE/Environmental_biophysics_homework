library("xlsx")
# print(1)
# myString <- "Hello, World!"

# print(myString)
# var.1 <- c(0, 1, 2, 3)
# print(var.1)

# # 使用左箭头 <-赋值
# var.2 <- c("learn", "R")
# print(var.2)

# # 使用右箭头 -> 赋值
# c(TRUE, 1) -> var.3
# print(var.3)
data <- read.xlsx2("D:\\Environmental_biophysics_homework\\家庭作业2—大气湿度的计算\\hw1_data_20211026.xlsx", 1)
print(dim(data))
