import pandas as pd
import numpy as np
# p,Ta,RH,ea,qa,rou_v,Cv,VPD
data = pd.read_excel(
    "D:\Environmental_biophysics_homework\enviromental_biophysics_homework2\月平均.xlsx")
print(data)
data['Pl'] = data['Pl']*10
es = 0.611*np.exp((data.Tal*17.502)/(data.Tal+240.97))*10
ea = es * data.RHl/100
data['ea'] = ea
VPD = es - ea
data['VPD'] = VPD
qa = 0.622*(ea/(data['Pl']-0.378*ea))*1000
data['qa'] = qa
rou_v = 0.622*ea*100/(287.05*(data.Tal+273.15))*1000
data['rou_v'] = rou_v
Cv = ea/data.Pl*1000000
data['Cv'] = Cv.round(0)
data.to_excel('monthly_finally.xlsx', index=False)
# print(es)
# print(ea)
# print(data)
data1 = pd.read_excel(
    "D:\Environmental_biophysics_homework\enviromental_biophysics_homework2\clear_finally1.xlsx")
data1['P'] = data1['Pl']*10
es = 0.611*np.exp((data1.Tal*17.502)/(data1.Tal+240.97))*10
ea = es * data1.RHl/100
data1['ea'] = ea
VPD = es - ea
data1['VPD'] = VPD
qa = 0.622*(ea/(data1['Pl']-0.378*ea))*1000
data1['qa'] = qa
rou_v = 0.622*ea*100/(287.05*(data1.Tal+273.15))*1000
data1['rou_v'] = rou_v
Cv = ea/data1.Pl*1000000
data1['Cv'] = Cv.round(0)
data1.to_excel('daily_finally.xlsx', index=False)
data2 = pd.read_excel(
    "D:\Environmental_biophysics_homework\enviromental_biophysics_homework2\half_hour.xlsx")
data2['P'] = data2['P']*10
es = 0.611*np.exp((data2.Ta*17.502)/(data2.Ta+240.97))*10
ea = es * data2.RH/100
data2['ea'] = ea
VPD = es - ea
data2['VPD'] = VPD
qa = 0.622*(ea/(data2['P']-0.378*ea))*1000
data2['qa'] = qa
rou_v = 0.622*ea*100/(287.05*(data2.Ta+273.15))*1000
data2['rou_v'] = rou_v
Cv = ea/data2.P*1000000
data2['Cv'] = Cv.round(0)
data2.to_excel('half_hour_finally.xlsx', index=False)
