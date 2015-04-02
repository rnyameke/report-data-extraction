###############################################################################################
# This script relies on specific names for the columns (as well as positions).                #
# See the readme and codebook files for more information about values that need to be changed #
# if your data set differs                                                                    #
###############################################################################################

#set the working directory to be the folder containing the data file
setwd("~/Documents/Work documents")

#import the file containing the data
data <- read.csv("data_2.csv")

#change the seconds into hours
data[,8] <- data[,2] * 1/3600

#summary of services (number of tickets per service)
#serv_summary <- summary(data$service)

#summarize time to resolution (hours) (mean, median, quartiles, min, max)
summary(data[,8])

#tickets resolved within 30 days (for later analysis)
data_within_thirty <- subset(data, data[,8] <= 720)

#summarize time to resolution (hours) (mean, median, quartiles, min, max)
summary(data_within_thirty[,8])

#tickets resolved within x days
one_day <- subset(data_within_thirty, time_to_resolution_hours <= 24) 
two_days <- subset(data_within_thirty, time_to_resolution_hours <= 48)
three_days <- subset(data_within_thirty, time_to_resolution_hours <= 72)
four_days <- subset(data_within_thirty, time_to_resolution_hours <= 96)
five_days <- subset(data_within_thirty, time_to_resolution_hours <= 120)

#isolate service (this just ensures that it's not a factor, for pretty printing)
sub_data_service = subset(data, select = service)
serv_summary <- summary(sub_data_service)

#view the contents of serv_summary
print (serv_summary)
 

###############################################################################################
#extra code in case you want to see any of these things
#creates a data frame with only the time to resolution (in hours)
#sub_data_time <- subset(data, select = time_to_resolution_hours)

#ordering the times (in hours)
#round(sub_data_time)
#ordered_times <- sub_data_time[order(sub_data_time[,1], na.last = TRUE),]

#min and max - used the seconds because some were under 1 hour. remember that you can
#also get this in the summary
#minimum_resolve_time <- min(data[,2])
#maximum_resolve_time <- max(data[,2])

#isolate service
#sub_data_service = subset(data, select = service)

#order service alphabetically
#ordered_service <- sub_data_service[order(sub_data_service[,1]),]

#view the number of observations in one_day
#print (nrow(one_day))
#note that you can also just type the name of the vraiable in the console to get its value