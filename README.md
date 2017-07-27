## india-nfhs:

**Slack:** #p-india-nfhs

**Project Description:**

This D4D project aims to glean insights from India's National Family
Health Survey datasets.  Perhaps generally around women's empowerment
issues.


**Project Co-Leads / Maintainers:** @lukewolcott / (more needed!)  

<!--
**Data:** [https://data.world/data4democracy/[project-name]](link)   
_Note: Create dataset for project in data.world and link it here._
-->

### Outline:

Getting started | Background | Questions to pursue | First steps

### Getting started:
* We welcome contributions from first timers!
* Browse our help wanted issues. See if there is anything that interests you.
* Core maintainers and project leads are responsible for reviewing and merging all pull requests. Need to practice working with github in a group setting? Checkout [github-playground](https://github.com/Data4Democracy/github-playground)
* Updates to documentation or readme are greatly appreciated and make for a great first PR. They do not need to be discussed in advance and will be merged as soon as possible.


### Background:

The NFHS is conducted about every 10 years.  The 4th one, NFHS-4, was
conducted 2015-2016 and the full datasets will be available "later
this year".  At the moment, state-level and county-level data is
available here:

The NFHS-3, conducted 2005-2006, is available in full from the DHS.
The datasets come from three questionnaires: female, male, and
household [link to question PDFs].  One must register to use this
data, so we can't put it up on a public repo but the team can share it
privately (data.world or Dropbox?).

### Questions to pursue:

* The Hindustan Times created a "Women's Empowerment Index" from
  questions 101--108 in the state-level data [links].  Is this an
  accurate index, or could it be improved?  What trends do we see
  [link to an article]? How does this index correlate with other
  variables [link to alcohol ITR]?

* What other trends and patterns do we see in the state-level NFHS-4
  data?

* The NFHS-3 (from 2005-2006) household questionnaire gathers hundreds
  of variables on 100k households, including some health data.  Can we
  use these household characteristics to predict if the household head
  is male or female?  Or if the household is likely to have clean
  water?  Can we predict if the household is at risk of alcoholism?  

* Within a few months, the full NFHS-4 (from 2015-2016) will become
  available.  Can we generate interesting models and questions, so
  that when it drops we can easily investigate the ten years of
  change?

* Can we connect the NFHS-3 women's and men's health questionnaire
  data with World Bank data?  

* What would you like to know?

### First steps:

* For now, the factsheets folder has the 37 state-level factsheet PDFs
  (and one India.pdf for the country as a whole).  We need to extract
  the tables from these PDFs.  And then explore these with EDA to
  generate new questions.  The eight questions 101--108 are related to
  women's empowerment.

* Luke will put up some of the metadata for the NFHS-3 household
  questionnaire in a folder.  How to share the full dataset?
