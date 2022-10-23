# library(xlsx)
library(readxl)
library(magrittr)
library(dplyr)
library(writexl)

data0 <- read_excel("D:\\Environmental_biophysics_homework\\家庭作业2—大气湿度的计算\\hw1_data_20211026.xlsx", 1)
print(dim(data0))
print(data0[1:2, ])
data0[data0 == "NaN"] <- NA
data0 <- data0[-1, ]
newdata <- na.omit(data0) # nolint
write_xlsx(newdata, "删去缺值和第一行值.xlsx")
v <- seq(0.5, 24, 0.5)
k <- 2
print(v)
data <- read_excel("D:\\Environmental_biophysics_homework\\家庭作业2—大气湿度的计算\\hw1_data_20211026.xlsx", 1)
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
data <- data[-1, ]
data <- na.omit(data) # nolint
print(dim(data))
es <- 0.611 * exp((data["Ta"] * 17.502) / (data["Ta"] + 240.97)) * 10
ea <- es * data["RH"] / 100
data["es"] <- es
data["ea"] <- ea
VPD <- es - ea
data["VPD"] <- VPD
qa <- 0.622 * (ea / (data["P"] - 0.378 * ea)) * 1000
data["qa"] <- qa
rou_v <- 0.622 * ea * 100 / (287.05 * (data["Ta"] + 273.15)) * 1000
data["rou_v"] <- rou_v
Cv <- ea / data["P"] * 1000000
data["Cv"] <- round(Cv, digits = 0)
by_doy <- data %>% group_by(doy)
print(by_doy)
daily48 <- by_doy %>% summarize(
    Ta = mean(Ta),
    RH = mean(RH),
    P = mean(P),
    es = mean(es),
    ea = mean(ea),
    VPD = mean(VPD),
    qa = mean(qa),
    rou_v = mean(rou_v),
    Cv = round(mean(Cv), digits = 0)
)
print(daily48)
# print(data %>% group_by(doy) %>% summarize(Ta = mean(Ta)))
write_xlsx(daily48, "每日48时刻均值2.xlsx")
