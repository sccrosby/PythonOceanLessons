# Coastal Transport

The learning goals of this lesson are
* students will explore how offshore winds, through the process of upwelling and downwelling, change the stratification and temperature along the coast
* students will discuss the impacts that these changes to the coastal waters may have on mixing and nutrient concentrations
* students will observe that in reality these concepts are not displayed as cleanly as expected, providing some context for idea that these systems are dynamic and rarely in equilibrium

The technical goals of this lesson are
* students interpret 2D heatmaps in depth and time
* students implement simple plotting commands
* students become familiar with the xarray dataset, commonly used with netcdf files


### Background

As the instructor you will want to preface this lesson with some background Ekman transport, providing students with some ideas to think about where surface waters may be headed under different wind directions. Student should also already be familiar with the concept of density and stratification, knowing colder waters tend to lie below warmer waters.

### The lesson

First you should become familiar with the python notebook,  [01_CoastalTransport.ipynb](01_CoastalTransport.ipynb), making sure all cells work as intended and there are no issues with paths to the data. Ideally this lesson is given to students in a computer lab with Python pre-installed. I have included all the code needed to make the plots and unless you require students to complete the Going Further section, you will want to remove some parts of the code for students to work through. Some aspects of the coding, especially employing the quiver() plotting command with the xarray dataset can be tricky, and you will want to be careful how much code you want students to reproduce. If the students are relatively new to coding, the notebook can be left as is, while asking students to adjust plots slightly, changing date ranges, or colorscales.

As part of the introduction I recommend showing students some of the OOI Oregon installation video, linked in the notebook, to provide an idea what these instruments really look like. If students have not seen Ekman transport there is a very brief recap at the beginning, however, I recommend that students have had a thorough introduction to Ekman transport prior.

In Datasets/ I have included a few different years of data for the wa_inshore and wa_shelf  moorings. I found that the 2016 inshore data had the cleanest upwelling/downwelling signal, however, you may ask students to examine the other datasets to in part teach them that the dynamic ocean doesn't always behave as our schematized version does. The datasets were downloaded from the OOI portal and then post-processed with Matlab into daily-averaged, depth-averaged matrices, and re-output as the netcdf files in this repository. Wind direction observations can be difficult to post-process from OOI and so, in full disclosure, I have downloaded NDBC buoy observed winds from 46041 to accompany the OOI observations. This station is relatively close to the WA endurance array. I've included the Matlab script used in the post-processing, and happy to share any additional files. Just email me.

### Remarks
* Here, students should work in pairs or small groups. To encourage collaboration and motivate I suggest, if possible, having students work on whiteboards in the lab/classroom where their diagrams, reasoning, and though process are easy to share with the class. It may be a stretch at times for students to visualize what is happening in this 3D process.
* Students may not realize that the quiver() plot arrows are associated with the time-stamp that the arrow tail lies on. Because the arrows are off-angle, this could be confusing and should be a point made in class so that they do not mistakenly relate the incorrect winds with upwelling/downwelling patterns.
* Students may not be able to relate to m/s. It can be helpful to point out that 1 m/s is equal to 2.2 mph. Note also that these are daily averaged winds and that likely peak daily wind speeds were much higher.
* You should see a tidal signal in the missing data, and this is a good question to ask students. The more time spent really interpreting these plots the better.
