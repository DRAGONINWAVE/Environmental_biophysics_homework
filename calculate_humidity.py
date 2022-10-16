import numpy as np
import pandas as pd

data = pd.read_excel("clear.xlsx").dropna()
print(data.shape)
