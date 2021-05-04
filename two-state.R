library(dpylr)
filter(
i
ois
newdata<-mutate(datapro,stageoflife = ifelse(menopause > "ge40", "postmenopause","premenopause"))

#for the age of 40

ageof40s<-subset(newdata, age == "40-49",na.action = na.omit)

#where the transition matrix is a two state going from premenopause(PA) to postmenopause(PB) (I did A and B because A comes before B, just like pre comes before post)

#calculating the conditional Probability for P(1|PA) P(2|PA) P(3|PA)

matrixforpro<-table(ageof40s$deg.malig,ageof40s$stageoflife)
matrixforpro

#now calculating for premenopause.
#P(1|PA) = P(1&premenopause)/P(premenopause)

0/9 
#the probability of P(1|PA) is 0. 

#P(2|PA) = P(2&premenopause)/P(premenopause)

4/9
#the probability of P(2|PA) is 0.44.

#P(3|PA) = P(3&premenopause)/P(premenopause)

5/9 
#the probability of P(3|PA) is 0.55.

#now calculating for postmenopause.
#P(1|PA) = P(1&postmenopause)/P(postmenopause)

18/81 
#the probability of P(1|PB) is 0.22. 

#P(2|PA) = P(2&postmenopause)/P(postmenopause)

44/81

#the probability of P(2|PB) is 0.54.

#P(3|PA) = P(3&postmenopause)/P(postmenopause)

19/81

#the probability of P(3|PB) is 0.23.

#the initial prob is 1/2. 
#the transition probabilities are (made them up unless someone knows how to calculate it).
#emission probabilities are P(1|PA) = 0, P(2|PA) 0.44, P(3|PA) 0.55 and P(1|PB) = 0.22, P(2|PB) = 0.54 and P(3|PB) = 0.23. 

#what is the likely hood that a women between the ages of 40-49 will develop a degree of malignancy of either 1,2,3 during premenopausal stage.

#x = 1  2  3
#pi= PA PA PA 

a4049<-filter(data, age == "40-49")
prmeno<-filter(a4049, menopause == "premeno")

#THere are 81 individuals of premeno out of the data set of 90 people

81/90
#so PA|PA = 0.9
# 1 - 0.9 = 0.1
#The transition from PA to PB is 0.1 for this data set
#so PB |PB
9/90 
1 - 0.9

#hidden markov
#all premenopause for all sets
((0.5 *  0.44) *((0.90 * 0.44)^44)* ((0.90 * 0.55)^44))
#1.598e-12

#half grade 2 and grade 3 premenopause

#for all states being menopause and the grades being equally distributed


((0.5 * 0.22) * ((0.1 * 0.22)^30) * ((0.1 * 0.54)^29) * ((0.1 *0.23)^29))
#1.1056e-135 





#what is the likely good that a women between the age of 40-49 will develop a degree of malignancy of either 1,2,3 during postmenopausal stage. 

#x = 1  2  3
#pi= PB PB PB 



#for the age of 20-29
