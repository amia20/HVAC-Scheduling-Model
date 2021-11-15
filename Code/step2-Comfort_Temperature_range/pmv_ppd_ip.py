#!/usr/bin/env python
from pythermalcomfort.models import pmv_ppd
from pythermalcomfort.psychrometrics import v_relative
from pythermalcomfort.utilities import met_typical_tasks
from pythermalcomfort.utilities import clo_individual_garments

import pandas as pd
import os
#from energy_calc import *

def my_pmv_ppd():
	#df = pd.read_csv(os.getcwd() + "/template-SI.csv")
	df = pd.read_csv(os.getcwd() + "/template-IP.csv")
	#print(df)
	df['PMV'] = None
	df['PPD'] = None
	for index, row in df.iterrows():
		#vr = v_relative(v=row['v'], met=row['met'])
		results = pmv_ppd(tdb=row['tdb'], tr=row['tr'], vr=0.4, rh=row['rh'], met=row['met'], clo=row['clo'], units="IP")
		#results = pmv_ppd(tdb=77, tr=77, vr=0.4, rh=50, met=1.2, clo=0.5, units="IP")
		df.loc[index, 'PMV'] = results['pmv']
		df.loc[index, 'PPD'] = results['ppd']
	
	#print(df)
	df.to_csv('results.csv',index=False)


def get_min_max_limit():
	item = 0
	temperature = []
	pmv = []
	ppd = []
#	my_pmv_ppd()
	df = pd.read_csv(os.getcwd() + "/results.csv")
	for index, row in df.iterrows():
		#print(row['PMV'], row['PPD'])
		if (row['PMV'] <= 0.5) and (row['PMV'] >= -0.5) :
			if (row['PPD'] < 10.0):
				temperature.append(row['tdb'])
				pmv.append(row['PMV'])
				ppd.append(row['PPD'])
				#print(row['tdb'], row['PMV'], row['PPD'])
				item+=1

	temp_data = {"temperature": temperature,
				 "PMV": pmv,
				 "PPD": ppd 
				 }	
	#print(item)
	df1 = pd.DataFrame(temp_data)
	upper_limit = df1.temperature.max()
	lower_limit = df1.temperature.min()
	return([upper_limit,lower_limit])
	
	


def main():
	my_pmv_ppd()
	temp_range = get_min_max_limit()
	print(temp_range)

	#get_zone_volume()


if __name__ == "__main__":
    main()