###############################################################################################
# This script relies on specific names for the columns (as well as positions).                #
# See the readme and codebook files for more details about the script values that need to be changed #
# if your data set differs                                                                    #
###############################################################################################

#set the working directory to be the folder containing the data file
setwd("~/Documents/Work documents") #change file path as needed

#import the file containing the data
data <- read.csv("data_file.csv")

#a little housekeeping...

#give the columns to friendlier names
data <- rename(data, c(u_business_service.name = "service", calendar_stc = "time_to_res_secs", sys_created_on = "created on"))

#format the date-time column so that R knows it's a date-time field
data$resolved_at <- as.POSIXct(data$resolved_at, tz = "")

#extract the date and time into separate columns
data$resolved_date <- as.Date(data$resolved_at)
data$resolved_time <- format(data$resolved_at, "%H:%M")

#strip the commas from time_to_res_secs
data$time_to_res_secs <- gsub(",", "", data$time_to_res_secs)

#change the format of time_to_resolution_secs to numeric
data[,2] <- as.numeric (data[,2])

#change the seconds into hours and store this in a new column
data$time_to_res_hours <- data$time_to_res_secs * 1/3600

#stats

#isolate service (for pretty printing)
sub_data_service = subset(data, select = service)

#get number of tickets per service
serv_summary <- summary(sub_data_service)

#view the contents of serv_summary
print (serv_summary)


#summarize time to resolution (hours) (mean, median, quartiles, min, max)
summary(data[,7])

#tickets resolved within 30 days (for later analysis)
data_within_thirty <- subset(data, data[,7] <= 720)

#summarize time to resolution (hours) (mean, median, quartiles, min, max)
summary(data_within_thirty[,7])

#tickets resolved within x days
one_day <- subset(data_within_thirty, time_to_res_hours <= 24)
two_days <- subset(data_within_thirty, time_to_res_hours <= 48)
three_days <- subset(data_within_thirty, time_to_res_hours <= 72)
four_days <- subset(data_within_thirty, time_to_res_hours <= 96)
five_days <- subset(data_within_thirty, time_to_res_hours <= 120)

#to see the value of any variable, just type the variable name in the console