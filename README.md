# india-nfhs:

**Slack:** #[p-india-nfhs](https://datafordemocracy.slack.com/messages/p-india-nfhs)

**Project Description:** This D4D project aims to glean insights from India's [National Family Health Survey](http://rchiips.org/nfhs/factsheet_NFHS-4.shtml) datasets.  Generally around women's empowerment and wealth index issues.


**Project Co-Leads / Maintainers:** [@lukewolcott](https://datafordemocracy.slack.com/messages/@lukewolcott/)

**Contributors:** (Slack handles) @lukewolcott, @rsibi, @sai, @preet, @vsridhar, @fibinse

**Data:** [https://data.world/data4democracy/india-nfhs](https://data.world/data4democracy/india-nfhs), and in this repo.

## Outline:

Background on the data | Motivating questions | Repo contents | Deliverables

## Background on the data:

The NFHS is conducted about every 10 years.  The 4th one, **NFHS-4**, was conducted 2015-2016 and the full datasets will be available "later this year".  At the moment, state-level and district-level data are [available in PDF factsheets](http://rchiips.org/nfhs/factsheet_NFHS-4.shtml).  [Debarghya Das has written scripts](https://github.com/deedy/india-nfhs4) to scrape the district-level PDFs and pull the data into one place.  This CSV file is available in our repo as `nfhs-district-level.csv`.

The **NFHS-3**, conducted 2005-2006, is [available in full](http://www.dhsprogram.com/what-we-do/survey/survey-display-264.cfm) from the Demographic and Health Surveys (DHS) program.  So are the two earler NFHSs.  The datasets come from three questionnaires: [female](http://rchiips.org/NFHS/NFHS4/schedules/NFHS-4Womans.pdf), [male](http://rchiips.org/NFHS/NFHS4/schedules/NFHS-4Mans.pdf), and [household](http://rchiips.org/NFHS/NFHS4/schedules/NFHS-4Household.pdf).  One must register to use this data, so we can't put it up on a public repo.  Instead, it lives in a private dataset on the [D4D data.world site](https://data.world/data4democracy).  Contact [@lukewolcott](https://datafordemocracy.slack.com/messages/@lukewolcott/) through Slack to get access to this dataset.

## Motivating questions:

* The NFHS includes a "Wealth Index" variable, but this oversimplifies the significant difference between rural and urban Indian households.  Can we use clustering and PCA to construct multiple, more indicative wealth indices?

* The Hindustan Times created a "[Women's Empowerment Index](https://github.com/HindustanTimesLabs/women-empowerment-index)" from questions 101--108 in the state-level data, and has done [some analysis](http://www.hindustantimes.com/interactives/women-empowerment-index/) with it.  Is this an accurate index, or could it be improved?  What trends do we see? How does this index correlate with other variables ([like alcohol consumption](https://lukewolcott.github.io/InTheResistance/Week15/IndiaAlcoholWomenEmpowerment.html))?

* What do the district-level NFHS-4 data indicate about geographic patterns for important variables related to wealth, empowerment, and quality of life?  Can we use this aggregated data to anticipate the individual household-level data?

* The NFHS-3 (from 2005-2006) household questionnaire gathers hundreds of variables on 100k households, including some health data.  Can we use these household characteristics to [predict if the household head is male or female](https://lukewolcott.github.io/InTheResistance/Week20/NFHS-DHS-V-v3.html)?  Or if the household is likely to have clean water?  Can we predict if the household is at risk of alcoholism?  How do household characteristics [cluster the data](https://lukewolcott.github.io/InTheResistance/Week19/NFHS-DHS-V.html)?


## Repo contents:

* The `nfhs3-metadata` folder has some metadata for the NFHS-3 household questionnaire.  To access the data, contact @lukewolcott and he'll send you an invitation to the data.world site.

* The `nfhs3-women-emp-analysis` folder has some initial exploratory plots, a jupyter notebook with some exploratory data analysis, and a notebook of machine learning models (decision trees, random forests) to predict the sex of the household head.

* The `nfhs3-wealth-index-analysis` folder contains files and reports analyzing the 'wealth index' variable, and the difference between rural and urban households.

* Independently Debarghya Das scraped the district-level NFHS-4 data into `nfhs-district-level.csv`.  [He has generated some heatmaps](http://debarghyadas.com/writes/nfhs-4/) with some of the gender-related variables, and this is a good start for generating new questions to ask the data.  Questions 101--108 in the data are related to women's empowerment.

* The `volatile-sex-ratio` folder contains the files and code used to generate @fibinse's Volatile Sex Ratio data story.

* The `nfhs4-chloropleths` folder contains files and reports related to district-level chloropleths of important variables.

## Deliverables:

- [EDA-lukewolcott.ipynb](http://nbviewer.jupyter.org/github/Data4Democracy/india-nfhs/blob/master/nfhs3-women-emp-analysis/EDA-lukewolcott.ipynb): a notebook with initial exploratory data analysis and plots for NFHS-3. (@lukewolcott)

- [Predicting-HV219.ipynb](http://nbviewer.jupyter.org/github/Data4Democracy/india-nfhs/blob/master/nfhs3-women-emp-analysis/Predicting-HV219.ipynb): using decision trees, random forests to predict sex of household head. (@lukewolcott, @vsridhar)

- [Wealth_Index_Initial_Report.html](https://data4democracy.github.io/india-nfhs/nfhs3-wealth-index-analysis/Wealth_Index_Initial_Report.html): analyzing the components of the wealth index, as they differ between geographic regions (rural, urban, large or small city, etc). (@sai, @preet)

- [Volatile Sex Ratio](http://stories.visualist.in/): a nice web report looking at change in each Indian state's sex ratio between NFHS-3 and NFHS-4. (@fibinse)

- [NFHS-4 Chloropleth maps](https://github.com/Data4Democracy/india-nfhs/tree/master/nfhs4-chloropleths/): district-level chloropleth maps of several important variables from the NFHS-4. (@preet)