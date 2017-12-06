### First steps

To see the story live in your browser, please follow the steps below:
1. Extract the `data.7z` file into a directory called `data`.
   This command should suffice:
    7za x data.7z

2. Once done, verify that you can see the following structure within the data
  folder -
  ```
  data
    ├── india.json
    ├── NFHS                              (<--- NFHS4 data folder)
    │   ├── census_sex_ratio.csv
    │   ├── eda.ipynb                     (<--- analysis notebook)
    │   ├── nfhs_district-wise.csv        
    │   ├── nfhs_indicator_lookup.csv
    │   └── nfhs_state-wise.csv
    ├── nfhs4_change_in_sex_ratio.json
    ├── nfhs4_sex_ratio.json
    ├── sex_ratio_change.csv
    └── yoy_sex_ratio.json
   ```

3. If required, `data/NFHS/eda.ipynb` can be used to regenerate files which are important to create the visuals in the story.
4. Now, you may take one step out of the data folder, and start a HTTP server.
   Python3 provides a nifty command to do this. (Feel free to use a P/L of your    
   choosing.)
    
    `python -m http.server`
    
  As a result, you'll see a line of text below the command:
    
    `Serving HTTP on 0.0.0.0 port 8000 (http://0.0.0.0:8000/) ...`
  
    This means, that you can access the visual, by pasting `http://0.0.0.0:8000/` in     your favourite browser!
    


### Help ? 
I'm available at @fibinse (on datafordemocracy.slack.com) / `fibinse.xavier at gmail.com`, if you may have any doubts or questions regarding this/Python/machine-learning/data-visualization. Or if you just want to say Hi! :)

