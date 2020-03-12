# -*- coding: utf-8 -*-
"""
Created on Thu May 16 07:12:07 2019

The goal of this code is to load USGS daily discharge records for a particular
gage site and to calculate a predicted time series of bedload transport rates 
for the site. 

@author: pfeif
"""

# %% 

import pandas as pd
import numpy as np
import os

sitenum = "11460000"
D_50 = 0.01 #D50 sed value
S = 0.0001 #slope

# load the textfile data

filename = sitenum + '_Daily.txt' #file name from Download daily NWIS from web code
path=os.path.join( os.getcwd(), filename)
  
dateparse = lambda x: pd.datetime.strptime(x, '%Y-%m-%d') 


#pd is pandas (library), sep is the seperator (delimiter) \t is tab, comment is #, one headerline, use the columns 2 and 3 (first column is 0).
data = pd.read_csv(path,
                   sep= '\t', 
                   comment = '#',
                   header = 1,
                   engine = 'python',
                   usecols = [2,3],
                   names = ('date','discharge'),
                   parse_dates = ['date'], 
                   date_parser = dateparse
                   )

t = data['date'].values
Q = data['discharge'].values

from matplotlib import pyplot as plt

# to view in separate window, Tools → Preferences → Ipython Console → Graphics → Graphics Backend → Backend: “automatic”
# may need to restart spyder 

plt.plot(t,Q)
plt.xlabel('time')
plt.ylabel('Discharge (cfs)')
# %% Write sediment transport code out here







