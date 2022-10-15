import numpy as np
import pandas as pd
from tqdm import tqdm

df = pd.read_excel(r'C:\\Users\Administrator\Desktop\day_degree.xlsx')
print(df)
baseT = 3
finalT = 900
a = 0
print(df['Tx'][1])
i = 0
for day in tqdm(range(120, 220)):
    if (df['Tx'][i] + df['Tn'][i])/2 >= baseT:
        a = a + ((df['Tx'][i] + df['Tn'][i])/2-3)
    if a >= 900:
        break
    i = i + 1
print(i, a, day)
i1 = 150-119+1
b = 0
k = 0
print(df['Tx'][i1])
for day in tqdm(range(151, 220)):
    if (df['Tx'][i1] + df['Tn'][i1])/2 >= baseT:
        b = b + ((df['Tx'][i1] + df['Tn'][i1])/2-3)
    if b >= finalT:
        # print(k, day)
        break
    i1 = i1 + 1
    k = k + 1
print(i1, k, day, b)
