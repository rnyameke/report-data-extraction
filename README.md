**_This file breaks down the script in snow_script.R_**"

The goal of this script is to determine the number of tickets per service, as well as obtain metrics around time spent on tickets

The first step is importing the csv created by ServiceNow. See CodeBook.md for more information about this file

in order to successfully obtain the information we want, we must first format the columns of the data to match the types

the POSIXct function tells R that that column represents a date and time. We can then split it into two separate columns for each type


