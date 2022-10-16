
from cmath import nan

import numpy as np
import pandas as pd
from tqdm import tqdm

data1 = pd.read_excel(
    r"D:\\Environmental_biophysics_homework\\家庭作业2—大气湿度的计算\\hw1_data_20211026.xlsx")
data = data1.replace(nan, '')
data.to_excel('clear.xlsx', index=False)
data2 = pd.read_excel('clear.xlsx')
