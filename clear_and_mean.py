import numpy as np
import pandas as pd
from tqdm import tqdm

data1 = pd.read_excel(
    r"clear.xlsx")
print(data1.shape)
# data = pd.read_excel("clear.xlsx").dropna()
print(data1.columns)
print(data1.shape)
Tal = []
RHl = []
Pl = []
DAY = []
for i in tqdm(range(1, 367)):
    Ta = 0
    RH = 0
    P = 0
    k = 0
    for j in range(len(data1)):
        if i < data1.doy.values[j] <= i + 1:
            Ta += data1.Ta.values[j]
            RH += data1.RH.values[j]
            P += data1.P.values[j]
            k = k + 1
    if k != 0:
        Tal.append(Ta/k)
        RHl.append(RH/k)
        Pl.append(P/k)
        DAY.append(i)
d = {'DAY': DAY, 'Tal': Tal, 'RHl': RHl, 'Pl': Pl, }
df = pd.DataFrame(data=d)
df = df.dropna()
df.to_excel('clear_finally1.xlsx', index=False)
