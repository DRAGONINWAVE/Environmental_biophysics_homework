import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
import scipy.stats as ss

data = pd.read_excel(
    r'C:\\Users\Administrator\Desktop\\u_and_temperature.xlsx')
print(data.columns)
h = 0.15
data1b = np.log((data['height']-h*0.6)/(h*0.02))
print(data1b)
data['mean_temperature'] = data1b
H = (8-data['mean_air_temperature'])*(0.4*1200*0.2)/data1b
data['H'] = H
print(data)

sns.set_theme(style="darkgrid")
sns.regplot(x='height',
            y='mean_air_temperature',
            data=data)

plt.savefig("1a.png")
plt.close()

sns.set_theme(style="darkgrid")
sns.regplot(x='height',
            y='mean_temperature',
            data=data)
plt.savefig("1b.png")
plt.close()

sns.set_theme(style="darkgrid")
sns.lineplot(x='height',
             y='H',
             data=data)
plt.savefig("1d.png")
plt.close()
