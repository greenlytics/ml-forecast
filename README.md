# power-forecast

## Preparing the GEFCom2014 data

### Download data
Download the [GEFCom2014 data](https://drive.google.com/file/d/1gKSe-OMVICQ5ZcBD_jvtAPRuamTFwFqI/view?usp=sharing) and place the file `1-s2.0-S0169207016000133-mmc1.zip`in the `data` folder. 

### Extract data
Extract the data by running: 

```
python preprocess/extract_gefcom2014_wind_solar_load.py
```

the raw data files will be saved to: 

```
Wind track data saved to: ./data/raw/gefcom2014-wind-raw.csv
Solar track data saved to: ./data/raw/gefcom2014-solar-raw.csv
Load track data saved to: ./data/raw/gefcom2014-load-raw.csv
```

## Preprocessing the GEFCom2014 data
## Preprocessing the GEFCom2014 data
Next step is to preprocess the data with feature extraction relavent for the task at hand. This repo includes examples of feature extraction for the different GEFCom2014 tracks: 

```
preprocess/preprocess_gefcom2014_wind_example.py
preprocess/preprocess_gefcom2014_solar_example.py
preprocess/preprocess_gefcom2014_load_example.py
```

These preprocessing scripts takes input from the parameter files. As an example, run the preprocessing script for the wind track as: 

```
python preprocess/preprocess_gefcom2014_wind_example.py params/params_competition_gefcom2014_wind_example.json
```

the processed data file will be saved to: 

```
Wind track preprocessed data saved to: ./data/gefcom2014/preprocessed/gefcom2014-wind-preprocessed.csv
```

## Tuning GBDT models
Quick start receipt for training GBDT models:
##### 1) Set number of trees to something as high as possible (e.g. 3000)
##### 2) Run a grid search or random search
##### 3) Finally set number of trees even higher and tune learning rate

The maximum depth of the tree controls the degree of feature interaction that you can model. Usually it is fair to assume that the degree if interactions is fairly low. As a rule of thumb the depth of the tree should be around 4-6 [1]

Shrinkage (or learning rate) is a parameter that exponentially reduced the weight that a tree will have in the final prediction as more and more trees are added. As a general rule of thumb, a model with higher shrinkage (or low learning rate) and more trees will perform better than a model with low shrinkage and few trees. The learning rate should typically be less than 0.1.

Stochastic gradient boosting is doing the same thing as random forest is doing. Either sampling data points or sampling feature set before creating a split point. This typically leads to improved accuracy.
## Model pipeline


## References

### Papers
[1] [Friedman, J. H. "Greedy Function Approximation: A Gradient Boosting Machine"](https://statweb.stanford.edu/~jhf/ftp/trebst.pdf)
<br>The original paper on gradient boosting.

[2] [Friedman, J. H. "Stochastic Gradient Boosting"](https://statweb.stanford.edu/~jhf/ftp/stobst.pdf)
<br>

[3] [Ke G. et. al. "LightGBM: A Highly Efficient Gradient Boosting Decision Tree"](https://papers.nips.cc/paper/6907-lightgbm-a-highly-efficient-gradient-boosting-decision-tree.pdf)

[4] [Chen T, Guestrin, C. ,"XGBoost: A Scalable Tree Boosting System"](https://arxiv.org/pdf/1603.02754.pdf)

### Books
[Hastie, T. Tibshirani R. Friedman J. "The Elements of Statistical Learning"](https://web.stanford.edu/~hastie/Papers/ESLII.pdf)
<br> Great book for understanding of gradient boosting.

### Videos
[Peter Prettenhofer - Gradient Boosted Regression Trees in scikit-learn](https://www.youtube.com/watch?v=IXZKgIsZRm0)

### Blog posts
[CatBoost vs. Light GBM vs. XGBoost](https://towardsdatascience.com/catboost-vs-light-gbm-vs-xgboost-5f93620723db)
<br> Comparison of the tree main GBDT implementations.
