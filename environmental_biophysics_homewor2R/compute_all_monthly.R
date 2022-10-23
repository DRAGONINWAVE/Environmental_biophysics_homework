library(readxl)
library(writexl)
library(magrittr)
library(dplyr)
library(beginr)

data0 <- read_excel("D:\\Environmental_biophysics_homework\\DAY.xlsx")
print(data0)
# print(exp(2))
es <- 0.611 * exp((data0["Ta"] * 17.502) / (data0["Ta"] + 240.97)) * 10
ea <- es * data0["RH"] / 100
data0["es"] <- es
data0["ea"] <- ea
VPD <- es - ea
data0["VPD"] <- VPD
qa <- 0.622 * (ea / (data0["P"] - 0.378 * ea)) * 1000
data0["qa"] <- qa
rou_v <- 0.622 * ea * 100 / (287.05 * (data0["Ta"] + 273.15)) * 1000
data0["rou_v"] <- rou_v
Cv <- ea / data0["P"] * 1000000
data0["Cv"] <- round(Cv, digits = 0)
print(data0)
write_xlsx(data0, "D:\\Environmental_biophysics_homework\\environmental_biophysics_homewor2R\\ALL_BY_Date.xlsx")
month_all <- data0 %>%
    mutate(month = format(DAY, "%Y-%m")) %>%
    group_by(month) %>%
    summarize(
        mean_bymon_Ta = mean(Ta),
        mean_bymon_RH = mean(RH),
        mean_bymon_P = mean(P),
        mean_bymon_es = mean(es),
        mean_bymon_ea = mean(ea),
        mean_bymon_VPD = mean(VPD),
        mean_bymon_qa = mean(qa),
        mean_bymon_rou_v = mean(rou_v),
        mean_bymon_Cv = round(mean(Cv), digits = 0)
    )
write_xlsx(month_all, "D:\\Environmental_biophysics_homework\\environmental_biophysics_homewor2R\\month_all.xlsx")
print(month_all)
