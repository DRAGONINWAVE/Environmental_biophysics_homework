library(readxl)
library(writexl)
# library(beginr)

data <- read_excel("D:\\Environmental_biophysics_homework\\删去缺值和第一行值.xlsx", 1)
print(dim(data))
print(data[1:2, 1:2])
# print(length(data["Ta"]))
Ta1 <- c()
RH1 <- c()
P1 <- c()
DAY1 <- c()
n <- 0
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
    # print(i)
    if (k != 0) {
        # Ta1 <- append(Ta1, Ta2 / k)
        # RH1 <- append(RH1, RH2 / k)
        # P1 <- append(P1, P2 / k)
        # DAY <- append(DAY, i)
        n <- n + 1
        Ta1[n] <- Ta2 / k
        RH1[n] <- RH2 / k
        P1[n] <- P2 / k
        DAY1[n] <- i
        # print(n)
    }
    # print(length(Ta1))
}

# print(Ta1)
DAY <- unlist(DAY1)
print(DAY)
Ta <- unlist(Ta1)
print(Ta)
RH <- unlist(RH1)
P <- unlist(P1)
table <- data.frame(DAY, Ta, RH, P)
print(table)
write_xlsx(table, "DAY.xlsx")
