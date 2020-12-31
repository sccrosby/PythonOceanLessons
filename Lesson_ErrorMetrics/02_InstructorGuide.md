# Error Metrics

The learning goal of this lesson is
* students will learn several types of error metrics and gain an intuition for what they mean, and what a "good" model might actually look like

The technical goals of this lesson are
* students will practice basic python scripting
* students will use a custom function
* students will use scatter and time series plots to examine model skill

### Background

This lesson works well when the class is exploring model results in the literature. This could be hydrodynamic models, wave models, hydrology models, or models in other fields. Though not all skill scores are used here, I do include the Willmott Skill Score, the Nash-Sutcliffe Efficiency, and basic correlations and squared errors such as RMSE. I find that these come up often in hydrodynamic and bio-geo-chemical-models that I have students read about in coastal oceanography.

### The lesson

This lesson does not require and special datasets or Python packages and should work easily on a local machine or Google Colabs. In this lesson we create a synthetic dataset with "model" and "obs" from which students will estimate skill scores and make plots. This lesson is best implemented with the class following along, using the questions posed for group-breakouts. I would suggest having model results from the literature as a reference, something the students are already familiar with, and might be curious to see if the authors might be hiding poor results behind their statistics.

The notebook, [01_ErrorMetrics.ipynb](01_ErrorMetrics.ipynb), contains several coding activities that students in groups, or the instructor may work through in class, depending on the coding experience of the students. If the students are proficient coders the instructor may first remove some of the coding, allowing a greater challenge.

### Remarks
* High correlation is often used as descriptor of a good model, however, if the magnitude of the signal is not captured correlation my still be high, but results quite poor. It might be necessary to walk students through this carefully in Activity 2.
* Often correlation (rho) and R^2 are confused, and you may need to double check results in literature students are using
