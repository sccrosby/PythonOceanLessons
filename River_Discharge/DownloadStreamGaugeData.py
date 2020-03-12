# -*- coding: utf-8 -*-
"""
Created on Fri Jan 25 20:01:58 2019

The goal of this script is to download USGS daily streamgage data and save it
to a text file.

Written by Allison Pfieffer
Editing by Sean C. Crosby
"""

# %% Load the necessary packages
import requests
import pandas as pd
import numpy as np
import os

# %% First, download gage data from NWIS and save those data as a textfile

# Enter your site number as a string, for example Ferndale is "12213100"
sitenum = "12213100"

# Now enter the start and stop times in the format below
startdate = "2018-10-01"
enddate = "2019-10-01"

# This creates the URL we are going to request
url = ('https://waterdata.usgs.gov/nwis/dv?cb_00060=on&cb_00065=on&format=rdb&site_no='
       + sitenum
       + '&referred_module=sw&period=&begin_date='
       + startdate
       + '&end_date='
       + enddate
       )

# Here we ask the URL for data
response = requests.get(url)
data = response.text

# To see the data uncomment below
#print(data)

# Second, we're going to save as a textfile
filename = sitenum + '_Daily.txt'

# We want to save the text files into the same directory as this .py script, so
path=os.path.join( os.getcwd(), filename) #gets current directory to put file in
file = open(path,'w') #open file
file.write(data) #everything we found at that url
file.close() #close the file
