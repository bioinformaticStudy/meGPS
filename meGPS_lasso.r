#install.packages("data.table")
library(data.table)
#install.packages("glmnet")
library(glmnet)        # ridge, elastic net, and lasso 
dat<-read.table(file="methylation_expression.csv",sep=",",header=T)
x = model.matrix(Type~.,dat)
y = dat$Type
set.seed(123)
lasso_model <- cv.glmnet(x, y, alpha=1)      # alpha=1 is lasso
best_lambda_lasso <- lasso_model$lambda.1se  # largest lambda in 1 SE
lasso_coef <-   lasso_model$glmnet.fit$beta[,  # retrieve coefficients
		lasso_model$glmnet.fit$lambda  # at lambda.1se
		== best_lambda_lasso]
coef_l = data.table(lasso = lasso_coef)      # build table
coef_l[, feature := names(lasso_coef)]       # add feature names
to_plot_r = melt(coef_l                      # label table
               , id.vars='feature'
               , variable.name = 'model'
               , value.name = 'coefficient')
#install.packages("ggplot2")
library(ggplot2)
ggplot(data=to_plot_r,                       # plot coefficients
       aes(x=feature, y=coefficient, fill=model)) +
       coord_flip() +         
       geom_bar(stat='identity', fill='brown4', color='purple') +
       facet_wrap(~ model) + guides(fill=FALSE) 


