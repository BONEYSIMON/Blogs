#This Project was done for Blog " Statistical Approach to Demystify "The Hot Hands" Myth " by BONEY SIMON
#The codes are written by BONEY SIMON, me myself and This code is to be refered alongside the blog


#Load packages
library(dplyr) #data manipulation
library(ggplot2)#data visualisation
library(statsr) #package for the data

#Step 1:Load data
data(kobe_basket)
str(kobe_basket) #the dataset has observations of 6 variables
table(kobe_basket$shot)# kobe made app 44% hits of total shots


#Step 2:calculating streak length for kobe
#kobe_streak is a dataframe with length as variable containing streak lengths
kobe_streak <- calc_streak(kobe_basket$shot) #calc_streak() is a custom function
#Plotting histogram for streak length distribution
ggplot(data=kobe_streak,aes(x=length))+geom_histogram(binwidth=1)



#simulating independent and dependent shooter to compare the performance of Kobe
#we use simulate() for that
#first of all, we will see how to simulate independent shooter(equal probability for hit and miss)
shot_outcomes <- c("H", "M")
sim_basket <- sample(shot_outcomes, size = 133, replace = T)# now 133 simulations will be run



#Step 3:

#simulating again, for the independent shooter 
sim_basket_comp<-sample(shot_outcomes,size=133,replace=T,prob=c(0.45,0.55))
#calculating streak length for our independent shooter
sim_streak<-calc_streak(sim_basket_comp)
#making a histogram of the streak length's
ggplot(sim_streak,aes(x=length))+geom_histogram(binwidth=1)


#Step 4:

#Conclusion: There is not much difference between kobe and our simulated independent shooters 
#      streak length distribution. So there is not much evidence for Kobe Bryant's Hot Hands.
