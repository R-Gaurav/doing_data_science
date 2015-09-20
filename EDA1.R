#DDS 1:

data1<- read.csv(“nyt1.csv”)

# If nrow(data1) == sum(table(data1$Age)) , then there are no NA in data1$Age
# Also u can use findInterval() “ findInterval(ages, c(20, 30, 40))” instead of cut()

data1$age_group <- cut(data1$Age,c(-Inf,0,18,24,34,44,54,64,+Inf),labels=F)

# Get the total number of impressions in each age group
imp_grp <- split(data1$Impressions, data1$age_group)
s <- lapply(imp_grp, sum)

# Plots a histogram with impression category in x axis and various age groups on y axis
library(ggplot2)
ggplot(data1, aes(x=Impressions, fill=as.factor(age_group)))+geom_histogram(binwidth=1)
ggplot(data1, aes(x=age_group, y= Impressions, fill=as.factor(age_group)))+geom_boxplot()

#Density plot of CTR
ggplot(subset(data1, Impressions>0), aes(x=Clicks/Impressions,colour=as.factor(age_group)))+geom_density()

ggplot(subset(data1,Clicks>0),aes(x=age_group,y=Clicks,fill=as.factor(age_group)))+geom_boxplot()




