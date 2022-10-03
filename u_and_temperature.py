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
data['ln(z-d)/zH'] = data1b
H = (38-data['mean_air_temperature'])*(0.4*1200*0.2)/data1b
data['H'] = H
print(data)
res = ss.linregress(data['ln(z-d)/zH'], data['mean_air_temperature'])
print(res)
sns.set_theme(style="darkgrid")
sns.lineplot(x='height',
             y='mean_air_temperature',
             data=data)

plt.savefig("1a.png")
plt.close()

sns.set_theme(style="darkgrid")
sns.regplot(y='mean_air_temperature',
            x='ln(z-d)/zH',
            ci=None,
            label=f' r\u00b2 = {res.rvalue**2:.2f} \n intercept = {res.intercept:.2f}',
            data=data)
plt.legend(loc='upper right')
plt.savefig("1b.png")
plt.close()

print(data['H'].mean())
