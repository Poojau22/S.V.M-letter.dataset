#divide into training and test data
letter_train<-letterdata[1:16000,]
letter_test<-letterdata[16001:20000,]

# Training a model on the data
# Being by training a simple linear SVM
library(kernlab)
letter_classifier<-ksvm(letter~., data=letter_train, kernel= "vanilladot")
# Evaluating the model performance
# Predictions on testing dataset
letter_predictions<-predict(letter_classifier, letter_test)
head(letter_predictions)

# Table (letter_predictions, letter_test$letter)
agreement<-letter_predictions==letter_test$letter
prop.table(table(agreement))

## Improving model performance
letter_classifier_rbf<-ksvm(letter~., data=letter_train, kernel="rbfdot")
letter_predictions_rbf<-predict(letter_classifier_rbf, letter_test)
head(letter_predictions_rbf)

agreement_rbf<-letter_predictions_rbf==letter_test$letter
table(agreement_rbf)
prop.table(table(agreement_rbf))
