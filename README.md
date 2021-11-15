# HVAC-Scheduling-Model
The simulated HVAC dataset from Pacific Northwest National Laboratory (PNNL) is used for experimenting HVAC scheduling domain model. The dataset contains data for both occupied and unoccupied time periods of the zone. Step 1 acquires data from occupied time periods by using python script reading_data.py.
 
Step 2 determines the range of thermally comfortable temperature using PPD-PMV index. PPD-PMV index for air temperature is determined with python script pythermalcomfort.py. 
It takes six inputs air temperature, mean radiant temperature (MRT), relative air velocity, humidity activity level/ metabolic rate and clothing thermal resistance. 

Step 3 calculates thermal loads of the zone and energy consumption of the HVAC system.

Step 4 is involve in generating plan. Here LPG-TD planner is used as planning engine. hsdm.pddl is the HVAC scheduling domain modelled with PDDL 2.1 and 2.2. Problem file are named as instance1.pddl.   
