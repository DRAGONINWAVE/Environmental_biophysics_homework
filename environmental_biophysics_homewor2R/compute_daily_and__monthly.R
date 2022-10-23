library(readxl)
library(writexl)
# 读取处理之后的数据
data <- read_excel("D:\\Environmental_biophysics_homework\\删去缺值和第一行值.xlsx", 1)
# 查看第一二行的数据
print(data[1:2, ])
# 创建按照标date格式的列表，为下一步做提前打算
A <- seq(as.Date("2012/1/1"), by = "day", length = 366)
Ta1 <- c()
RH1 <- c()
P1 <- c()
DAY <- c()
n <- 0
# n和i值不一样按照n来赋值
for (i in seq(1, 366, 1))
{
    Ta2 <- 0
    RH2 <- 0
    P2 <- 0
    k <- 0
    for (j in seq(1, 16730)) {
        if (i < data[j, 1] && data[j, 1] <= i + 1) {
            Ta2 <- Ta2 + data[j, 2]
            RH2 <- RH2 + data[j, 3]
            P2 <- P2 + data[j, 4]
            k <- k + 1
        }
    }
    if (k != 0) {
        n <- n + 1
        Ta1[n] <- Ta2 / k
        RH1[n] <- RH2 / k
        P1[n] <- P2 / k
        DAY[n] <- A[i]
    }
    print(i)
}
# 将DAY的值从距1970-1-1的天数转化为标准的日期格式
DAY <- as.Date(DAY, origin = "1970-1-1")
print(DAY)
Ta <- unlist(Ta1)
print(Ta)
RH <- unlist(RH1)
P <- unlist(P1)
table <- data.frame(DAY, Ta, RH, P)
print(table)
# 输出excel
write_xlsx(table, "DAY.xlsx")
