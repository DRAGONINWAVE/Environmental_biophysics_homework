# library(xlsx)
library(readxl)
library(magrittr)
library(dplyr)
library(writexl)

data <- read_excel("D:\\Environmental_biophysics_homework\\家庭作业2—大气湿度的计算\\hw1_data_20211026.xlsx", 1)
print(dim(data))
print(data[1:2, ])
v <- seq(0.5, 24, 0.5)
k <- 2
print(v)
# print(data[c("doy", "Ta")])
print(data[1:2, 1])
for (i in seq(366))
{
    for (j in v)
    {
        data[k, 1] <- j
        k <- k + 1
    }
}
print(k)
data <- data[-1, ]
print(data[1:2, ])
data[data == "NaN"] <- NA
newdata <- na.omit(data) # nolint
# newdata <- as.numeric(unlist(newdata))
print(dim(newdata))
by_doy <- newdata %>% group_by(doy)
print(by_doy)
daily48 <- by_doy %>% summarize(Ta = mean(Ta), RH = mean(RH), P = mean(P))
print(daily48)
# print(data %>% group_by(doy) %>% summarize(Ta = mean(Ta)))
write_xlsx(daily48, "每日48时刻均值.xlsx")
