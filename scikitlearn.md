[#](#) Scikit-learn
## Imports
```
# knn classifier
from sklearn.neighbors import KNeighborsClassifier

# train_test_split
from sklearn.model_selection import train_test_split

# train_test_split
from sklearn import liner_model

# import seaborn for plotting
import seaborn as sns

from sklearn.metrics import mean_squared_error

# import cross validataion
from sklearn.model_slection import cross_val_score

# import Ridge for regularization
from sklearn.linear_model import Ridge

# import lasso to select feature
from sklearn.linear_model import Lasso

# from sklearn.metrics import classification_report, confusion_matrix
```

## Measuring model performance

scikit-learn's build-in datasets are type of `Bunch`
`Bunch` can be access in two ways: `.` or `[]`
ex: `digits.images` or `digits['images']`

MNIST is a data set of 0-9 pictures
28x28

which is in
```python
from sklearn import datasets

datasets.load_digits

# They can be loaded using the following functions:
#
# load_boston([return_X_y]) Load and return the boston house-prices dataset (regression).
# load_iris([return_X_y]) Load and return the iris dataset (classification).
# load_diabetes([return_X_y]) Load and return the diabetes dataset (regression).
# load_digits([n_class, return_X_y])  Load and return the digits dataset (classification).
# load_linnerud([return_X_y]) Load and return the linnerud dataset (multivariate regression).
# load_wine([return_X_y]) Load and return the wine dataset (classification).
# load_breast_cancer([return_X_y])  Load and return the breast cancer wisconsin dataset (classification).
```

### plt.imshow(X)
```
display an image from 2D data

cmap: color map

```

### train_test_split
```
X = digits['data']
y = digits['target']

# Split into training and test set
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.2, random_state=42, stratify=y)
```
`test_size` is percentage of data use to be test

`Stratify` the split according to the labels so that they are distributed in the training and test sets as they are in the original dataset.

### KNeighborsClassifier

Classifier implementing the k-nearest neighbors vote.

params:
algorithm : {'auto', 'ball_tree', 'kd_tree', 'brute'}, optional

```
knn = KNeighborsClassifier(n_neighbors = 7)

# Fit the classifier to the training data
knn.fit(X_train, y_train)

# Print the accuracy
print(knn.score(X_test, y_test))
```


## Liner regression

```
reg = liner_model.LinearRegression()
reg.fit(X, y)
reg.predict(X_test)
reg.score(X_test, y_test)
```

###dataframe.corr()
calculate correlation for nxn dimension dataframe

###np.linspace(min, max)
return by default 50 number even space from min and max

###mean_squared_error(y_true, y_prediction)
calculate mean square of prediction
smaller is better


## Cross-Validation
```
from sklearn.model_slection import cross_val_score
reg = linear_model.LinearRegression()
cv_results = cross_val_score(reg, X, y, cv=5)
```
split training and test using different partie of fold
5 fold = 5 fold CV
K fold = K fold CV

more fold is more computationally expensive


## Regularization
## Ridge regression
Loss function = OLS loss function + alpha * sum(a ^ 2)
```
from sklearn.linear_model import Ridge
ridge = Ridge(alpha=0.1, normalize=True)
ridge.fit(X_train, y_train)
ridge_pred = ridge.predict(X_test)
```

## Lasso regression
Loss function = OLS loss function + alpha * sum(abs(a))
```
from sklearn.linear_model import Lasso
lasso = Lasso(alpha=0.1)
lasso_coef = lasso.fit(X, y).coef_
```

###mean of some data
```
np.mean(data)
```

###standard division of some data
```
np.std(data)
```
