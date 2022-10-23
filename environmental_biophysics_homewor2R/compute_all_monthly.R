library(readxl)
library(writexl)
library(magrittr)
library(dplyr)
library(beginr)
# 读取数据
data0 <- read_excel("D:\\Environmental_biophysics_homework\\DAY.xlsx")
# 查看数据
print(data0[1:2, ])
# 开始计算各项所需数据
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
# 保存计算出来的各项数据
write_xlsx(data0, "D:\\Environmental_biophysics_homework\\environmental_biophysics_homewor2R\\ALL_BY_Date.xlsx")
# 计算月平均，将dat0的数据进行一个处理之后给month_all
month_all <- data0 %>%
    # 生成一个月的序列
    mutate(month = format(DAY, "%Y-%m")) %>%
    # 按照月来计算月平均
    group_by(month) %>%
    summarize(
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
# 保存数据
write_xlsx(month_all, "D:\\Environmental_biophysics_homework\\environmental_biophysics_homewor2R\\month_all.xlsx")
print(month_all)
