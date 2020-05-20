#Bagging
# Using the ipred decision trees
library(ipred)
set.seed(300)
mybag<-bagging(iris$Species~., data = iris,nbagg=50)
credit_pred<-predict(mybag,iris)
table(credit_pred, iris$Species)

#Break the data
train<-iris[1:130,]
test<-iris[131:150,]

mybag<-bagging(train$Species~., data=train, nbagg=50)
credit_pred<-predict(mybag, test[,-5])
table(credit_pred, test$Species)
