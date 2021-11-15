#!/usr/bin/env python

import pandas as pd
import os


def get_zone_volume(filename):
	df = pd.read_csv(os.getcwd() + "/" + filename)
	#print(df)
	for index, row in df.iterrows():
		vol =row['zone_area']*row['zone_height'] #Vz
		df.loc[index, 'zone_volume'] = vol
		#print(vol)
	#print(df)
	df.to_csv(filename,index=False)
	return vol


def get_thermal_load(filename):
	df = pd.read_csv(os.getcwd() + "/" + filename)
	#print(df)
	for index, row in df.iterrows():
		Q_people = row['heat_gain_occupency']*row['no_occupency']
		Q_equip = row['power_equip']*3.412
		Qz = Q_people + Q_equip
		#print(Qz)
		df.loc[index, 'thermal_load'] = Qz
		df.loc[index, 'kilowatt'] = Qz*0.00029307107
	#print(df)
	df.to_csv(filename,index=False)
	return Qz*0.00029307107

	


def get_sup_air_volume(flag,thermal_load,volume,filename):
	df = pd.read_csv(os.getcwd() + "/" +filename)
	#print(df)
	for index, row in df.iterrows():
		if flag == 0:
			temp = 5.0 # changing 5 degree
		elif (flag == 1 or flag == 2):
			temp = row['delta_time']
		#elif flag == 2:
		#	temp = 5.0 #for ahu # changing 5 degree

		sup_air_vol =(((1.1*volume* temp) + thermal_load)/(1.1*abs((row['Zone Air Temperature'] - row['AHU: Supply Air Temperature']))))/60
		#print(sup_air_vol)
		df.loc[index, 'Supply Air Volume'] = round(sup_air_vol,2)
	#print(df)
	df.to_csv(filename,index=False)

def get_mix_air_temp(filename):
	df = pd.read_csv(os.getcwd() + "/" +filename)
	#print(df)
	for index, row in df.iterrows():
		mix_air =(row['AHU: Outdoor Air Temperature']*row['AHU: Cooling Coil Valve Control Signal']) + (row['AHU: Return Air Temperature']*(1 - row['AHU: Cooling Coil Valve Control Signal']))
		df.loc[index, 'AHU: Mixed Air Temperature'] = mix_air
		#print(mix_air)
	#print(df)
	df.to_csv(filename,index=False)


def get_total_energy(filename):
	df = pd.read_csv(os.getcwd() + "/" +filename)
	for index, row in df.iterrows():
		fan = 1.25*row['Supply Air Volume']
		chill = round((1.005*(abs(row['AHU: Mixed Air Temperature'] - row['AHU: Supply Air Temperature']))*row['Supply Air Volume'])/3.412, 2)
		total = round((fan + chill)/(1000), 3)
		df.loc[index, 'Q_fan'] = fan
		df.loc[index, 'Q_chill'] = chill
		#print(total)
		df.loc[index, 'Q_total'] = total
	#print(df)
	#print("total enregy for 1 minute: ", df['Q_total']/60)
	df.to_csv(filename,index=False)


def get_vav_energy(flag, filename):
	df = pd.read_csv(os.getcwd() + "/" + filename)
	#print(df)

	for index, row in df.iterrows():
		if flag == 0:
			cooling_set_temp = 70
		elif flag == 1:
			cooling_set_temp = row['max_temp']

		vav = (1.005*abs(cooling_set_temp - row['Zone Air Temperature']) * row['Supply Air Volume'])/ 3.412
		df.loc[index, 'Q_vav'] = round(vav/(1000), 5) # watt/minute
	#print("total enregy for 1 minute: ", df['Q_total']/60)
	df.to_csv(filename,index=False)


def main():
   # print("Hello World!")
    filename = 'building-data.csv'
    filename1 = 'MZVAV-2-1_occupancey.csv'#'MZVAV-2-1_5minutes.csv'#'sorted_data.csv'
    filename2 = 'MZVAV-2-1_HVAC_data.csv'#'HVAC_data.csv'

    flag = 2

    volume = get_zone_volume(filename)
    thermalload = get_thermal_load(filename)  
    #print(volume, thermalload)
    if flag == 0: #calculating energy of MZVAV for without planning
    	get_sup_air_volume(flag, thermalload,volume,filename1)
    	get_total_energy(filename1)
    	get_vav_energy(flag,filename1)
    elif flag == 1: #calculating energy of MZVAV with planning( AHU WITH VAV)
    	get_mix_air_temp(filename2)
    	get_sup_air_volume(flag, thermalload,volume,filename2)
    	get_vav_energy(flag,filename2)
    elif flag == 2: #FOR AHU ENERGY only
    	get_mix_air_temp(filename2)
    	get_sup_air_volume(flag, thermalload,volume,filename2)
    	get_total_energy(filename2)



if __name__ == "__main__":
    main()
