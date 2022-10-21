
import numpy as np
import pandas as pd

data = pd.read_excel("clear.xlsx")
print(data)

Ta1 = []
A1 = []
print(data['doy'].values[1:49])
# print(data.loc[['doy', 'Ta']])
D = pd.DataFrame()
k = 0
m = np.arange(0.5, 24.5, 0.5)
print(len(m))
print(data.groupby(['doy']).mean())
data.groupby(['doy']).mean().to_excel('half_hour.xlsx')
