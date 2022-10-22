library(readxl)
library(writexl)
# library(beginr)

data <- read_excel("D:\\Environmental_biophysics_homework\\删去缺值和第一行值.xlsx", 1)
print(dim(data))
print(data[1:2, 1:2])
print(16730)
Ta1 <- list()
RH1 <- list()
P1 <- list()
DAY <- list()
for (i in seq(1, 366, 1))
{
    Ta <- 0
    RH <- 0
    P <- 0
    k <- 0
    for (j in seq(1, 16730)) {
        if (i < data[j, 1] && data[j, 1] <= i + 1) {
            Ta <- Ta + data[j, 2]
            RH <- RH + data[j, 3]
            P <- P + data[j, 4]
            k <- k + 1
        }
    }
    # print(i)
    if (k != 0) {
        Ta1 <- append(Ta1, Ta / k)
        RH1 <- append(RH1, RH / k)
        P1 <- append(P1, P / k)
        DAY <- append(DAY, i)
        # Ta1[i] <- (Ta / k)
        # RH1[i] <- (RH / k)
        # P1[i] <- (P / k)
        # DAY[i] <- i
    }
    print(length(Ta1))
}
table <- cbind(
    DAY = DAY,
    Ta = Ta1,
    RH = RH1,
    P = P1
)
print(length(DAY))
write_xlsx(table, "DAY.xlsx")
