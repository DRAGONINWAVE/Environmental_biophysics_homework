import datetime

import numpy as np
import pandas as pd

data = pd.read_excel('clear_finally1.xlsx')
# print(data['DAY'])
data['DAY'] = pd.to_datetime(data['DAY']-1, unit='D', origin='2012')
print(data)
f2 = data.resample("1M", on='DAY').mean()
f2.to_excel('月平均.xlsx')
# print(f2)
# f3 = data.resample("Q", on='DAY').mean()
# f3['DAY'] = ['第一季度', '第二季度', '第三季度', '第四季度']
# f3.to_excel('季度平均.xlsx', index=False)
# # print(f3)
