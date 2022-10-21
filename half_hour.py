
import numpy as np
import pandas as pd

data = pd.read_excel("clear.xlsx")
print(data)

Ta1 = []
A1 = []
print(data['doy'].values)
D = pd.DataFrame()
for i in data.doy.values[1:49]:
    k = 0
    B = pd.DataFrame()
    for j in range(366):
        l = 0
        l = i + j
        if l in data['doy'].values:
            # print(l)s
            mask = data['doy'] == l
            pos = np.flatnonzero(mask)
            C = data.iloc[pos]
            # print(C)
            B = pd.concat([B, C])
    k = k + 1
    B = B.groupby(['doy']).mean()
    D = pd.concat([D, B])
print(D)

# x = data.doy.values[1:1000]
# pos = np.flatnonzero(mask)
# print(data.iloc[pos])
