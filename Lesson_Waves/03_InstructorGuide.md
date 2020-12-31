# Waves

The learning goal of this lesson is
* students will discover the difference between locally-generated wind waves and remotely-generated swell

The technical goals of this lesson are
* students will gain experience wrangling data in an imperfect form
* students will use pandas dataframe
* students will explore correlation with scatter plots

### Background

As the instructor you will want to preface this lesson with some basics about waves, including their properties such as wave height, period, and direction. You should hold off on talking about wind-wave generation, allowing for students to explore that concept in the data. Students will see local wind-wave generation at Hein bank, a sheltered buoy location, while at Neah Bay they will not see a strong relationship between winds and waves, that should lead them to the conclusion that waves may be generated elsewhere and travel. After the lesson, it can be nice to share the historic study, Waves Across the Pacific, where scientists observed waves propagating from Antartica to Alaska. A video about the study is [here](https://www.youtube.com/watch?v=MX5cKoOm6Pk&ab_channel=GeodynamicsLiberation-Front).

### The lesson

First you should become familiar with the two python notebooks, making sure all cells work as intended. Ideally this lesson is given to students in a computer lab with Python pre-installed. This lesson uses a non-standard python package NDBC, that you will want to guide students through the installation of. In python notebooks you can install the package with

    !pip install NDBC

Or in a terminal or command window use

    pip install NDBC

With this package and scripts in the notebook students may download data from any number of NDBC buoys, and I recommend introducing the agency briefly and looking through the map of buoy sites. At this time it would be good to zoom in on the Salish Sea and Washington coast where the students will examine data at two locations.

Once students are familiar with the region you should introduce the first notebook where you can lead students through the data downloading, wrangling, and plotting [01_Introduction.ipynb](01_Introduction.ipynb). Depending on the coding experience of students, this introduction could take anywhere from 10 minutes to an hour. Have students edit some of the code to change variables in plots or locations being loaded into the dataset. This is a good time to break things and help students fix errors and gain some confidence manipulating the data and changing plotting commands.

Once students have an idea what they are looking at and the basics of working with the dataset they should start the activity, [02_WaveActivity.ipynb](02_WaveActivity.ipynb). Depending on the level of the students this may be taught with significant direction, little direction, or no direction. Note that I've included the answers to coding elements in the notebook cells, these should be removed before providing to students. You may choose to remove more or less of the code depending on the level of the students.

### Remarks
* Students will download data from 2011 ad 2012. Note that this can be changed, but not all years have buoy data available, so it is worth checking beforehand before asking students to examine different time periods
* There is a bug in the NDBC package that displays "Month not available" when occasionally it is, have students ignore this message
* Students may struggle with the question: Is the relationship linear or non-linear depending on their prior experience. This is not critical, but is worth exploring if possible since the force by the wind does scale as the square with the speed, so that the force of 20 mph winds is 4x greater than the force of 10 mph winds. Similarly the energy in a wave also goes as the square of wave height, something ocean goers should keep in mind!
* Students can struggle interpreting the meaning of wave period (APD in the dataset). I suggest that students are allowed to struggle with what this might mean, and keep those questions saved for a coming lecture in class. You can follow up on this the next day by explaining how larger storms over greater fetches produce bigger, longer waves that may travel across the globe. Note as well that as waves propagate non-linear interactions play a role in transferring energy to lower frequencies, however, this can be a detail difficult to explain.
