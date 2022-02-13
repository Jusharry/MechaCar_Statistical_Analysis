library(dplyr)
cars <- read_csv('MechaCar_mpg.csv')

multi_reg <- lm(mpg~ AWD+ground_clearance+spoiler_angle+vehicle_weight+vehicle_length,data=cars)
summary(multi_reg)

#R-Squared
summary(multi_reg)$r.squared

car_parts <- read_csv('Suspension_coil.csv')
total_summary <- car_parts%>% summarize(Mean=mean(PSI),Median=median(PSI),SD=sd(PSI),Variance=var(PSI))
lot_summary <- car_parts%>% group_by(Manufacturing_Lot)%>% summarize(Mean=mean(PSI),Median=median(PSI),SD=sd(PSI),Variance=var(PSI))

sample_test <- car_parts %>% sample_n(50)
t.test((sample_test$PSI),mu=mean(car_parts$PSI))

lot1_sample <- subset(car_parts,Manufacturing_Lot=='Lot1')
t.test((lot1_sample$PSI),mu=mean(car_parts$PSI))

lot2_sample <- subset(car_parts,Manufacturing_Lot=='Lot2')
t.test((lot2_sample$PSI),mu=mean(car_parts$PSI))

lot3_sample <- subset(car_parts,Manufacturing_Lot=='Lot3')
t.test((lot3_sample$PSI),mu=mean(car_parts$PSI))

