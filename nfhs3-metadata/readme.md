## NFHS-3 metadata

The NFHS-3 was conducted in 2005-2006 and the [full dataset](http://www.dhsprogram.com/what-we-do/survey/survey-display-264.cfm) is available.  The survey organization DHS has put out a detailed Final Report, and a summary of that report, which present descriptive statistics.  But no one has built predictive models or generally applied machine learning to the data.

The data can't be posted publicly, but please message [@lwolcott](https://datafordemocracy.slack.com/messages/@lukewolcott/) for access to the projects' data.world site.  Here are some metadata files that describe the variables we have available to work with.



## Files

* `IAHR52FL.txt`: Codebook for the roughly 200 useful variables in the **household** dataset.  The full dataset is 109041 x 3588, and comes in at about 440 MB.  There are so many variables because the questionnaire allows for up to 35 people living in the same household!

* `IAIR52FL.txt`: Codebook for the **women's health** dataset.  This can be connected with the household dataset using unique identifiers (see p.31 of `NFHS3SUP.PDF`).

* `IAMR52FL.txt`: Codebook for the **men's health** dataset.  This can be connected with the household dataset using unique identifiers (see p.31 of `NFHS3SUP.PDF`).

* `NFHS3SUP.PDF`: Useful supplemental documentation provided by DHS, including "notable variables", a description of how the wealth indices are computed, explanation of weights, filename explanations, and unique identifiers connecting the different datasets.

* `Recode5DHS_23August2012.pdf`: More information on survey methodology and variable explanations (the NFHS-3 is an India-specific instance of the international DHS-V survey... thus all the recoding.)

* `FRIND3-Vol1AndVol2.pdf`: Final Report on the NFHS-3, put out by DHS, from [here](http://www.dhsprogram.com/what-we-do/survey/survey-display-264.cfm).  At the end are copies of all the questionnaires (HH, women's, men's) used by the survey folks.

* `SR128_updated_09-22-2015.pdf`: Summary Report on the NFHS-3, put out by DHS, from [here](http://www.dhsprogram.com/what-we-do/survey/survey-display-264.cfm).  Useful for a quick overview of what information is contained in the surveys.

