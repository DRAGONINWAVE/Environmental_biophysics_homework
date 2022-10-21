
from cmath import nan

import numpy as np
import pandas as pd
from tqdm import tqdm

data1 = pd.read_excel(
    r"D:\\Environmental_biophysics_homework\\家庭作业2—大气湿度的计算\\hw1_data_20211026.xlsx")
# data = data1.replace(nan, '')
print(data1)
daytime = np.arange(0.5, 24.5, 0.5)
print(len(daytime))
k = 1
for i in range(366):
    for j in range(48):
        # print(data1['doy'][k])
        data1['doy'][k] = daytime[j]
        k = k + 1
print(k)
print(data1['doy'])
data = data1.dropna()
data = data.astype(np.float64)
data = data.round(2)
data.to_excel('clear.xlsx', index=False)
data2 = pd.read_excel('clear.xlsx')
print(data2)
