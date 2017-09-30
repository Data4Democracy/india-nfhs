import pandas as pd
import numpy as np
import seaborn as sb 
from sklearn.cross_validation import train_test_split
from sklearn import preprocessing
from sklearn import metrics
from sklearn.ensemble import RandomForestClassifier
import matplotlib.pyplot as plt
import warnings
warnings.filterwarnings('ignore') #Supress unnecessary warnings for readability


df = pd.read_csv('household_truncated.csv', na_values='NaN', low_memory=False)

interesting = ['HV009','HV025', 'HV026', 'HV201', 'HV202', 'HV205', 'HV206', 'HV208', 'HV212', 'HV213',\
              'HV214', 'HV215', 'HV216', 'HV217', 'HV219', 'HV220', 'HV221', 'HV226', 'HV227',\
              'HV243A', 'HV244', 'HV246', 'HV247', 'HV270', 'SH44', 'SH46', 'SH47N', 'SH58', \
              'SH62A', 'SH62F', 'SHSLI', 'SHSTRUC']


df = df[interesting]

q_dict = {'HV009':'Number of listed household members' , \
          'HV025': 'Type of place of residence', 'HV026' : 'Place of residence',\
          'HV201' : 'Source of drinking water', 'HV202':'Source of non-drinking water', \
          'HV205':'Type of toilet facility', 'HV206':'Has electricity', \
          'HV208':'Has television', 'HV212':'Has car', 'HV213':'Main floor material',\
          'HV214':'Main wall [exterior] material', 'HV215':'Main roof material',\
          'HV216':'Rooms used for sleeping', 'HV217':'Relationship structure',\
          'HV219': 'Sex of head of household', 'HV220':'Age of head of household',\
          'HV221':'Has telephone (non-mobile)', \
          'HV226':'Type of cooking fuel', 'HV227':'Have bednet for sleeping',\
          'HV243A': 'Has mobile telephone',\
          'HV244':'Owns land usable for agriculture', 'HV246':'Livestock, herds or farm animals',\
          'HV247':'Owns a bank account or post office account', 'HV270':'Wealth Index',\
          'SH44':'Household head\'s religion', 'SH46':'Type of caste or tribe of the HH head',\
          'SH47N':'Has computer', 'SH58':'Owns this or any other house',\
          'SH62A':'Has cows/bulls/buffalo', 'SH62F':'Has chickens',\
          'SHSLI':'Standard of Living Index', 'SHSTRUC':'Household structure'}

# for simplicity, restrict to these few columns from earlier EDA
#cols = ['HV009', 'HV025', 'HV217', 'HV220', 'HV270', 'HV219']
#df = df2[cols]

df_all_features = df.drop(['HV219'], axis=1)
df_all_labels = preprocessing.LabelBinarizer().fit_transform(df['HV219'])
#df_all_features = pd.get_dummies(df_all_features)

# add in imputer for categorical vars based on 
# https://stackoverflow.com/questions/25239958/impute-categorical-missing-values-in-scikit-learn
from sklearn.base import TransformerMixin

class DataFrameImputer(TransformerMixin):

    def __init__(self):
        """Impute missing values.

        Columns of dtype object are imputed with the most frequent value 
        in column.

        Columns of other types are imputed with mean of column.

        """
    def fit(self, X, y=None):

        self.fill = pd.Series([X[c].value_counts().index[0]
            if X[c].dtype == np.dtype('O') else X[c].mean() for c in X],
            index=X.columns)

        return self

    def transform(self, X, y=None):
        return X.fillna(self.fill)


df_all_features = DataFrameImputer().fit_transform(df_all_features)
df_all_features = pd.get_dummies(df_all_features)
feature_names = df_all_features.columns

X_train, X_test, y_train, y_test = train_test_split(df_all_features, \
        df_all_labels, train_size=0.75, random_state=1)
num_trees = 20
clf = RandomForestClassifier(n_estimators=num_trees, random_state=0)
clf.fit(X_train, y_train)
y_pred = clf.predict(X_test)
print "Accuracy with %s trees: %s \nPrecision: %s \nRecall: %s \nF1: %s" % (num_trees, \
        metrics.accuracy_score(y_test, y_pred), metrics.precision_score(y_test, y_pred), \
        metrics.recall_score(y_test, y_pred), metrics.f1_score(y_test, y_pred))

zipped = zip(clf.feature_importances_, feature_names)				
zipped.sort(key = lambda t: t[0], reverse=True)

print("\nMOST IMPORTANT FEATURES:")
for (weight, word) in zipped[:len(interesting) // 5]:
    print("{}\t{:.6f}".format(word, weight))
