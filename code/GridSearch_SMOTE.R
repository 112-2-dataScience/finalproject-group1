if (!require(themis)) install.packages('themis')
library(themis)
library(caret)
library(randomForest)
library(dplyr)
library(pROC)
# https://rdrr.io/cran/themis/man/smotenc.html

data <- read.csv("data/WA_Fn-UseC_-HR-Employee-Attrition.csv")
# imbalanced data
# No: 1233, Yes: 237

dist <- table(data$Attrition)
print(table(data$Attrition))
n <- nrow(data)
print(paste0('No: ', round(dist[[1]]/n*100,2),'%'))
print(paste0('Yes: ', round(dist[[2]]/n*100, 2),'%'))
data$Attrition <- factor(data$Attrition)

# train_test_split
set.seed(123)
trainIndex <- createDataPartition(data$Attrition, p = 0.7, list = FALSE)
train_data <- data[trainIndex, ]
test_data <- data[-trainIndex, ]

# downsampling for "No", and SMOTENC for "Yes"
# downsampling and SMOTE are used for training data
# Here, I downsample majority to size 500, 
# and smote minority to 300
majority <- train_data[train_data$Attrition == "No",]
minority <- train_data[train_data$Attrition == "Yes",]
majority <- sample_n(majority, size=500)
train_data <- rbind(majority, minority)

# shuffle
random_index <- sample(nrow(train_data))
train_data <- train_data[random_index, ]

train_smote <- smotenc(train_data, 'Attrition', k = 8, over_ratio = 0.6)

dist <- table(train_smote$Attrition)
print(table(train_smote$Attrition))
n <- nrow(train_smote)
print(paste0('No: ', round(dist[[1]]/n*100,2),'%'))
print(paste0('Yes: ', round(dist[[2]]/n*100, 2),'%'))
train_smote$Attrition <- factor(train_smote$Attrition)


# grid search, 
best_ntree <- NULL
best_mtry <- NULL
best_AUC <- 0
ntrees <- seq(500,1000,50)
mtrys <- 5:8
count <- 1
n_rounds <- length(ntrees) * length(mtrys)
test_data$Attrition <- factor(test_data$Attrition, levels = levels(train_smote$Attrition))
for(ntree in ntrees){
  for(mtry in mtrys){
    rf_model <- randomForest(Attrition~., data=train_smote, ntree=ntree, mtry=mtry)
    predicted_prob <- predict(rf_model, test_data, type = "prob")[,2]
    roc_obj <- roc(test_data$Attrition, predicted_prob)
    auc_value <- auc(roc_obj)
    if(auc_value > best_AUC){
      best_AUC <- auc_value
      best_ntree <- ntree
      best_mtry <- mtry
    }
    print(paste0(count,"/",n_rounds))
    count<-count+1
  }
}
print(paste0("best_ntree: ",best_ntree))
print(paste0("best_mtry: ",best_mtry))

