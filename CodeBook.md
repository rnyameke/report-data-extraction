**_This file provides an overview of the data columns, as well as the options to select when generating the CSV file_**

To obtain the csv file, run a report in Canvas for the desired time range. Set type to "list", and select the following columns:

Service.Service Name <- This is the name of the service. Eg. Academic Support > Canvas

Resolve time <- This is the time to resolution in seconds. It is equal to Resolved - Created

Created <- This is the date and time of ticket creation

Resolved <- This is the date and time of ticket resolution

Call the file data_file.csv

The script adds some additional columns to the data table and renames some of the existing ones. The final columns will be:

1. service

2. time_to_res_secs

3. created on

4. resolved at

5. resolved_date

6. resolved_time

7. time_to_res_hours

