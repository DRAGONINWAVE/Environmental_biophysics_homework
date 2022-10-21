import datetime

import numpy as np
import pandas as pd

data = pd.read_excel('clear_finally1.xlsx')
# print(data['DAY'])
data['DAY'] = pd.to_datetime(data['DAY']-1, unit='D', origin='2012')
print(data)
f2 = data.resample("1M", on='DAY').mean()
f2.to_excel('月平均.xlsx')
