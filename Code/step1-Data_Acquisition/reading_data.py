#!/usr/bin/env python

import pandas as pd
import os

def read_with_occupancy(filename,filename1):
	df = pd.read_csv(os.getcwd() + "/" +filename) 
	data = []
	count = 0
	for index, row in df.iterrows():
		count = count + 1
		print(count)
		if row['Occupancy Mode Indicator'] == 1:
			data.append([row['Datetime'], row['AHU: Supply Air Temperature'], row['AHU: Supply Air Temperature Set Point'], row['AHU: Outdoor Air Temperature'], row['AHU: Mixed Air Temperature'], row['AHU: Return Air Temperature'], row['AHU: Cooling Coil Valve Control Signal'],row['Occupancy Mode Indicator']])
			df1 = pd.DataFrame(data, columns = ['Datetime', 'AHU: Supply Air Temperature', 'AHU: Supply Air Temperature Set Point', 'AHU: Outdoor Air Temperature', 'AHU: Mixed Air Temperature', 'AHU: Return Air Temperature', 'AHU: Cooling Coil Valve Control Signal','Occupancy Mode Indicator' ])
	df1.to_csv(filename1,index=False)


filename = 'MZVAV-2-1.csv' #'building-data.csv' 
filename1 = 'MZVAV-2-1_occupancey.csv' #'building-data.csv' 
read_datetime(filename,filename1) 

