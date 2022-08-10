#Statistical analysis was conducted using combined data from Karoi and Ndambe to combat a too-small sampling size. 

#examine rates of training 
joined_CSV$Received.training..N..Y.
#set NAs to 0
joined_CSV[is.na(joined_CSV)] = 0

#assign the Y/N value of 'received training' to corresponding mitigation strategies
Trained_Table<-
  table(joined_CSV$Received.training..N..Y.,joined_CSV$What.are.you.doing.to.reduce.effects.of.climate.change.)
Trained_Table

#add arbitrary margins on array
addmargins(Trained_Table)  

#proportion of all values
prop.table(Trained_Table, 
           margin=1)  

#chi square test of independence
chisq.test(joined_CSV$Received.training..N..Y.,
           joined_CSV$What.are.you.doing.to.reduce.effects.of.climate.change.,correct=F) 

#chi square test of independence of the previously created variable
chisq.test(Trained_Table)

#small expected counts, may generate data errors

#Fisher's exact test
fisher.test(joined_CSV$Received.training..N..Y.,
            joined_CSV$What.are.you.doing.to.reduce.effects.of.climate.change., simulate.p.value=TRUE)

#examine mitigation tactics of individuals older than 50 years of age in both Karoi and Ndambe
print((joined_CSV$What.are.you.doing.to.reduce.effects.of.climate.change.[joined_CSV$Age..number. > 50]))

#examine mitigation tactics of individuals younger than 35 years of age in both Karoi and Ndambe
print((joined_CSV$What.are.you.doing.to.reduce.effects.of.climate.change.[joined_CSV$Age..number. <35]))
