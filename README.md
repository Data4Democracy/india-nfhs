# india-nfhs:

**Slack:** #[p-india-nfhs](https://datafordemocracy.slack.com/messages/p-india-nfhs)

**Project Description:** This D4D project aims to glean insights from India's [National Family Health Survey](http://rchiips.org/nfhs/factsheet_NFHS-4.shtml) datasets.  Generally around women's empowerment issues.


**Project Co-Leads / Maintainers:** [@lukewolcott](https://datafordemocracy.slack.com/messages/@lukewolcott/) / (more needed!)

**Data:** [https://data.world/data4democracy/india-nfhs](https://data.world/data4democracy/india-nfhs), and in this repo.

## Outline:

Getting started | Background | Questions to pursue | First steps

## Getting started:

* We welcome contributions from first timers!

* Browse our "help wanted" Issues or **First Steps** below. See if there is anything that interests you.

* Core maintainers and project leads are responsible for reviewing and merging all pull requests. Need to practice working with github in a group setting? Checkout [github-playground](https://github.com/Data4Democracy/github-playground).

* Updates to documentation or readme are greatly appreciated and make for a great first PR.


## Background on the data:

The NFHS is conducted about every 10 years.  The 4th one, **NFHS-4**, was conducted 2015-2016 and the full datasets will be available "later this year".  At the moment, state-level and district-level data are [available in PDF factsheets](http://rchiips.org/nfhs/factsheet_NFHS-4.shtml).  [Debarghya Das has written scripts](https://github.com/deedy/india-nfhs4) to scrape the district-level PDFs and pull the data into one place.  This CSV file is available in our repo as `nfhs-district-level.csv`.

The **NFHS-3**, conducted 2005-2006, is [available in full](http://www.dhsprogram.com/what-we-do/survey/survey-display-264.cfm) from the Demographic and Health Surveys (DHS) program.  So are the two earler NFHSs.  The datasets come from three questionnaires: [female](http://rchiips.org/NFHS/NFHS4/schedules/NFHS-4Womans.pdf), [male](http://rchiips.org/NFHS/NFHS4/schedules/NFHS-4Mans.pdf), and [household](http://rchiips.org/NFHS/NFHS4/schedules/NFHS-4Household.pdf).  One must register to use this data, so we can't put it up on a public repo.  Instead, it lives in a private dataset on the [D4D data.world site](https://data.world/data4democracy).  You are encouraged to contact [@lukewolcott](https://datafordemocracy.slack.com/messages/@lukewolcott/) through Slack to get access to this dataset.

## Possible questions to pursue:

* The NFHS includes a "Wealth Index" variable, but this oversimplifies the significant difference between rural and urban Indian households.  Can we use clustering and PCA to construct two separate, more indicative wealth indices?

* The Hindustan Times created a "[Women's Empowerment Index](https://github.com/HindustanTimesLabs/women-empowerment-index)" from questions 101--108 in the state-level data, and has done [some analysis](http://www.hindustantimes.com/interactives/women-empowerment-index/) with it.  Is this an accurate index, or could it be improved?  What trends do we see? How does this index correlate with other variables ([like alcohol consumption](https://lukewolcott.github.io/InTheResistance/Week15/IndiaAlcoholWomenEmpowerment.html))?

* What other trends and patterns do we see in the state-level or district-level NFHS-4 data?

* The NFHS-3 (from 2005-2006) household questionnaire gathers hundreds of variables on 100k households, including some health data.  Can we use these household characteristics to [predict if the household head is male or female](https://lukewolcott.github.io/InTheResistance/Week20/NFHS-DHS-V-v3.html)?  Or if the household is likely to have clean water?  Can we predict if the household is at risk of alcoholism?  How do household characteristics [cluster the data](https://lukewolcott.github.io/InTheResistance/Week19/NFHS-DHS-V.html)?

* Within a few months, the full NFHS-4 (from 2015-2016) will become available.  Can we generate interesting models and questions, so that when it drops we can easily investigate the ten years of change?

* Can we connect the NFHS-3 women's and men's health questionnaire data with World Bank data?

* What would you like to know?

* (Peruse the Slack channel for other suggestions, too...)

## First steps:

* Download Debarghya Das's scrape of the district-level data, `nfhs-district-level.csv`, and dive in!  [He has generated some heatmaps](http://debarghyadas.com/writes/nfhs-4/) with some of the gender-related variables, and this is a good start for generating new questions to ask the data.  Questions 101--108 in the data are related to women's empowerment.

* The `nfhs3-metadata` folder has some metadata for the NFHS-3 household questionnaire.  To access the data, contact @lukewolcott and he'll send you an invitation to the data.world site.

* The `nfhs3-analysis` folder has some initial exploratory plots, a jupyter notebook with some exploratory data analysis, and a notebook of machine learning models (decision trees, random forests) to predict the sex of the household head.

* The `nfhs3-wealth-index-analysis` folder contains files and reports analyzing the 'wealth index' variable, and the difference between rural and urban households.