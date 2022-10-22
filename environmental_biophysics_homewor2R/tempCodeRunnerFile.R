for (i in seq(366))
# {
#     for (j in v)
#     {
#         data[k, 1] <- j
#         k <- k + 1
#     }
# }
# print(k)
# print(data[1:2, ])
# data[data == "NaN"] <- NA
# newdata <- na.omit(data) # nolint
# # newdata <- as.numeric(unlist(newdata))
# print(dim(newdata))
# by_doy <- newdata %>% group_by(doy)
# print(by_doy)
# print(by_doy %>% summarize(Ta = mean(Ta), RH = mean(RH), P = mean(P)))
# # print(data %>% group_by(doy) %>% summarize(Ta = mean(Ta)))