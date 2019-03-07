# Random Forest Regression

# Importing the dataset
dataset = read.csv('for-coding.csv')
dataset = dataset[2:7]

# Splitting the dataset into the Training set and Test set
## install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Fitting Random Forest Regression to the dataset
# install.packages('randomForest')
library(randomForest)
set.seed(1234)
regressor = randomForest(x = dataset[-6],
                         y = dataset$fare_amount,
                         ntree = 500)

# Predicting a new result with Random Forest Regression
y_pred = predict(regressor)

# Visualising the Random Forest Regression results (higher resolution)
# install.packages('ggplot2')
library(ggplot2)
x_grid = seq(min(dataset$trip_distance), max(dataset$trip_distance), 0.01)
ggplot() +
  geom_point(aes(x = dataset$trip_distance, y = dataset$fare_amount),
             colour = 'red') +
  geom_line(aes(x = dataset$trip_distance, y = y_pred),
            colour = 'blue') +
  ggtitle('Taxi-Fare-Prediction') +
  xlab('trip_distance') +
  ylab('Fare-amount')




  