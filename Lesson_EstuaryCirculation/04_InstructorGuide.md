# Estuary Circulation

The learning goals of this lesson are
* students will see how, not-intuitively, smaller tides lead to stronger exchange flow
* students will see that mixing by stronger tides leads to lower stratification which inhibits exchange flow

The technical goals of this lesson are
* students interpret 2D heatmaps in depth and time
* students implement simple plotting commands
* students become familiar with the xarray dataset, commonly used with netcdf files
* students see how averaging (filtering) data can illuminate underlying processes

### Background
As the instructor you will want to preface this lesson with some background on tides, and tidal flow in an estuary. You will also want students to have an understanding of density and how salinity and temperature impact density. The data used in the lesson are from the Salish Sea, an estuary in Washington USA.

### The lesson

First you should become familiar with the two python notebooks, making sure all cells work as intended. Ideally this lesson is given to students in a computer lab with Python pre-installed. I have included my notes on the topic in [03_EstuaryPhysicsNotes.pdf](03_EstuaryPhysicsNotes.pdf), this should be helpful to premise the topic, as well as to follow up after the lesson. I would recommend discussing the Knudsen relation after the lesson.

I recommend that you introduce the region by exploring UW's webpage about their hydrodynamic model, Live Ocean, https://faculty.washington.edu/pmacc/LO/LiveOcean.html. This page is frequently changing and being updated and currently has 3-day forecasts as well as large array of information that would interesting to explore, including videos of model tracers and changes in algae blooms.

Once students are familiar with the region and excited (hopefully) by the model movies, you should introduce the dataset with the first notebook, [01_IntroductionToModelDataset.ipynb](01_IntroductionToModelDataset.ipynb). You will be looking data from the Admiralty Inlet location, however, if students want to explore further data from HoodCanal is also available. Depending on the coding experience of students, this introduction could take anywhere from 10 minutes to an hour. Have students edit some of the code to change variables in plots or locations being loaded into the dataset. This is a good time to break things and help students fix errors.

Once students have an idea what they are looking at and the basics of working with the dataset they should start the activity, [02_ExchangeFlowActivity.ipynb](02_ExchangeFlowActivity.ipynb). Depending on the level of the students this may be taught with significant direction, little direction, or no direction. Note that I've included the answers to coding elements in the notebook cells, these should be removed before providing to students. You may choose to remove more or less of the code depending on the level of the students. For example, if students are experience with python, you should be able to remove almost all the code in the document, provided they have the 01_IntroductionToModelDataset notebook for reference.

### Remarks
* Here, students will use a function butter_lowpass_filter() to average out tidal variations. This could be explained with varying level of detail, or very little detail at all. Its implementation in a loop may also confuse students, if this is the case I recommend explaining that all that is happening is the data is being averaged in time over each tidal cycle, and this happens to each depth layer.
* Students may remark that there is more outflow than inflow. This should be the case since estuary river inflow should require a net outflow. However, the degree to which this is happening is quite strong and likely there are some 2D effects. For example, waters along the edges may be flowing into the estuary more so than in the center, where our observation location is
* Here students are exploring data from a model. I think it is important that students know this is not real data, however, it is not critical make this distinction as the learning would be similar if the data were real. Real data though always has issues
* The connections between tidal range, exchange flow, and stratification are not always completely clear. While it does appear that during period of lower tidal action exchange flow is higher and stratification stronger, sometimes this effect appears to lag or not be present. This is an opportunity to show students that in fact the process is quite complicated and our simple schematic models are not always right.
