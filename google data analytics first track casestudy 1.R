# Working Directory set manually
#Installing and loading the packages
install.packages("tidyverse")
install.packages("ggplot2")
install.packages("lubridate")
install.packages("here")
install.packages("skimr")
install.packages("janitor")
install.packages("readr")
install.packages("Tmisc")

#loading the packages
library(lubridate)
library(tidyverse)
library(ggplot2)
library(here)
library(skimr)
library(janitor)
library(dplyr)
library(readr)
library(Tmisc)

# Loading the data set csv files to vectors
q1_2019 <- read_csv("Divvy_Trips_2019_Q1.csv")
q2_2019 <- read_csv("Divvy_Trips_2019_Q2.csv")
q3_2019 <- read_csv("Divvy_Trips_2019_Q3.csv")
q4_2019 <- read_csv("Divvy_Trips_2019_Q4.csv")
q1_2020 <- read_csv("Divvy_Trips_2020_Q1.csv")

# Quick look inside each vector to know what is up with the data
colnames(q1_2019)
colnames(q2_2019)
colnames(q3_2019)
colnames(q4_2019)
colnames(q1_2020)
head(q1_2019)
head(q2_2019)
head(q3_2019)
head(q4_2019)
head(q1_2020)
# Checking for duplicate values
sum(duplicated(q1_2019))
sum(duplicated(q2_2019))
sum(duplicated(q3_2019))
sum(duplicated(q4_2019))
sum(duplicated(q1_2020))
# Checking for missing values
sum(is.na(q1_2019))
sum(is.na(q2_2019))
sum(is.na(q3_2019))
sum(is.na(q4_2019))
sum(is.na(q1_2020))
#Another look inside the data
glimpse(q1_2019)
glimpse(q2_2019)
glimpse(q3_2019)
glimpse(q4_2019)
glimpse(q1_2020)

# Issues found in the data sets
## column names are not consistent (q2_2019 has different column names need to be changed)
## The trip_id column Must be al as characters.
## there are some columns in (q1_2020) needs to be removed (rideable_type, start_lat, start_lng, end_lat, end_lng)
## there are some columns in (q1_2019, q2_2019, q3_2019, q4_2019) to remove (gender, birthyear) 
## No Duplicates Found.
## There are missing values (q1_2019, gender, birthyear), (q2_2019, birthyear), (q3_2019, gender birthyear), 
#(q4_2019, gender birthyear), (q1_2020, 4 values)
# In the "user_type" column, replace "Subscriber" with "member" and "Customer" with "casual"

## 1st Cleaning Part
# Renaming all columns into specified consistent names
q1_2019 <- rename(q1_2019
                  ,trip_id = trip_id
                  ,start_time = start_time
                  ,end_time = end_time
                  ,bike_id = bikeid
                  ,trip_duration = tripduration
                  ,start_station_id = from_station_id
                  ,start_station_name = from_station_name
                  ,end_station_id = to_station_id
                  ,end_station_name = to_station_name
                  ,user_type = usertype
                  ,gender = gender
                  ,birth_year = birthyear )

q2_2019 <- rename(q2_2019
                  ,trip_id = "01 - Rental Details Rental ID"
                  ,start_time = "01 - Rental Details Local Start Time" 
                  ,end_time = "01 - Rental Details Local End Time"
                  ,bike_id = "01 - Rental Details Bike ID"
                  ,trip_duration = "01 - Rental Details Duration In Seconds Uncapped" 
                  ,start_station_id = "03 - Rental Start Station ID"
                  ,start_station_name = "03 - Rental Start Station Name"
                  ,end_station_id = "02 - Rental End Station ID"
                  ,end_station_name = "02 - Rental End Station Name"
                  ,user_type = "User Type"
                  ,gender = "Member Gender"
                  ,birth_year = "05 - Member Details Member Birthday Year")

q3_2019 <- rename(q3_2019
                  ,trip_id = trip_id
                  ,start_time = start_time
                  ,end_time = end_time
                  ,bike_id = bikeid
                  ,trip_duration = tripduration
                  ,start_station_id = from_station_id
                  ,start_station_name = from_station_name
                  ,end_station_id = to_station_id
                  ,end_station_name = to_station_name
                  ,user_type = usertype
                  ,gender = gender
                  ,birth_year = birthyear)

q4_2019 <- rename(q4_2019
                  ,trip_id = trip_id
                  ,start_time = start_time
                  ,end_time = end_time
                  ,bike_id = bikeid
                  ,trip_duration = tripduration
                  ,start_station_id = from_station_id 
                  ,start_station_name = from_station_name
                  ,end_station_id = to_station_id
                  ,end_station_name = to_station_name
                  ,user_type = usertype
                  ,gender = gender
                  ,birth_year = birthyear)

q1_2020 <- rename(q1_2020
                  ,trip_id = ride_id
                  ,start_time = started_at
                  ,end_time = ended_at
                  ,bike_id = rideable_type
                  ,start_station_id = start_station_id 
                  ,start_station_name = start_station_name
                  ,end_station_id = end_station_id
                  ,end_station_name = end_station_name
                  ,user_type = member_casual)

# Confirming Column names consistency
colnames(q1_2019)
colnames(q2_2019)
colnames(q3_2019)
colnames(q4_2019)
colnames(q1_2020)
# Check the data types in each column in all data sets
str(q1_2019)
str(q2_2019)
str(q3_2019)
str(q4_2019)
str(q1_2020)
# Convert ride_id in all dataframes to characters to allow merging all in one data set 
q1_2019 <-  mutate(q1_2019, trip_id = as.character(trip_id))
q2_2019 <-  mutate(q2_2019, trip_id = as.character(trip_id))
q3_2019 <-  mutate(q3_2019, trip_id = as.character(trip_id))
q4_2019 <-  mutate(q4_2019, trip_id = as.character(trip_id))
q1_2020 <-  mutate(q1_2020, trip_id = as.character(trip_id))
q1_2019 <-  mutate(q1_2019, bike_id = as.character(bike_id))
q2_2019 <-  mutate(q2_2019, bike_id = as.character(bike_id))
q3_2019 <-  mutate(q3_2019, bike_id = as.character(bike_id))
q4_2019 <-  mutate(q4_2019, bike_id = as.character(bike_id))
q1_2020 <-  mutate(q1_2020, bike_id = as.character(bike_id))
# Merging individual quarter's data frames into one big data frame
trip_data <- bind_rows(q1_2019, q2_2019, q3_2019, q4_2019, q1_2020)

# Deep assessment for all trips data frame to find quality and tideness issues
str(trip_data)
glimpse(trip_data)
summary(trip_data)
class(trip_data)
class(trip_data$start_time)
class(trip_data$end_time)
class(trip_data$bike_id)
class(trip_data$trip_duration)
class(trip_data$start_station_name)
class(trip_data$end_station_name)
class(trip_data$user_type)
class(trip_data$birth_year)
# More issues found with the new full data frame
# Start and end time are a group od datetime needs to be separated to YY MM DD time
# There are unneeded coumns need to be removed (bike_id, start_station_id, end_station_id, gender, start_lat, start_lng, end_lat, end_lng)

# second cleaning phase
# Creating a date column to be able to explore trends based on the day or month
trip_data$date <- as.Date(trip_data$start_time)
trip_data$month <- format(as.Date(trip_data$date), "%M")
trip_data$day <- format(as.Date(trip_data$date), "%D")
trip_data$year <- format(as.Date(trip_data$date), "%Y")
trip_data$day_of_week <- format(as.Date(trip_data$date), "%A")
# Removing unneeded variables
trip_data <- trip_data %>%  
  select(-c(start_station_id, end_station_id, gender, start_lat, start_lng, end_lat, end_lng))
# Rechecking the data frame
glimpse(trip_data)
str(trip_data)

# Assessing the quality & Tidiness of each variable
names(trip_data)
unique(trip_data$start_station_name)
unique(trip_data$end_station_name)
unique(trip_data$user_type)
unique(trip_data$birth_year)
unique(trip_data$date)
unique(trip_data$trip_duration)
unique(trip_data$day_of_week)
sum(is.na(trip_data$trip_duration))
# More Issues found
# start_station name includes unneeded values("MTL-ECO5.1-01", "HQ QR" )
# End station name also has unneeded values(HQ QR", "MTL-ECO5.1-01" ) and NA values
# User type column values need to be consistent (member& casual only)
# Week days are not ordered correctly
# there are NA's in trip duration column so we will calculate it manually using start and end time

# Final Cleaning
# the "user_type " column, replace "Subscriber" with "member" and "Customer" with "casual"
trip_data <-  trip_data %>% 
  mutate(user_type = recode(user_type
                            ,"Subscriber" = "member"
                            ,"Customer" = "casual"))
# Add a "ride_length" calculation to all_trips (in seconds)
trip_data$ride_length <- difftime(trip_data$end_time,trip_data$start_time)
#Converting ride length to minutes
trip_data <- trip_data %>%
  mutate(ride_length_minu=ride_length/60)
# Convert "ride_length" from Factor to numeric so we can run calculations on the data
trip_data$ride_length_minu <- as.numeric(trip_data$ride_length_minu)
# Ordering days of week properly
trip_data$day_of_week <- ordered(trip_data$day_of_week, levels = c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))
# Remove "bad" data
trip_data <- trip_data[!(trip_data$start_station_name == "HQ QR" | trip_data$ride_length<0),]
# Final Check
colnames(trip_data)  #List of column names
nrow(trip_data)  #How many rows are in data frame?
dim(trip_data)  #Dimensions of the data frame?
head(trip_data, 20)  #See the first 20 rows of data frame.  
tail(trip_data, 20 ) #See the last 20 rows of data frame.
str(trip_data)  #See list of columns and data types (numeric, character, etc)
summary(trip_data)  #Statistical summary of data. Mainly for numerics
# Rechecking the most important variables in the Data
unique(trip_data$start_station_name)

unique(trip_data$user_type)
unique(trip_data$birth_year)
unique(trip_data$date)
unique(trip_data$ride_length_minu)
unique(trip_data$day_of_week)
sum(is.na(trip_data$trip_duration))

# Descriptive analysis on ride_length in minutes
mean(trip_data$ride_length_minu) 
median(trip_data$ride_length_minu) 
max(trip_data$ride_length_minu) 
min(trip_data$ride_length_minu) 
summary(trip_data$ride_length_minu)

# Comparing ride_length per minute for members and casual users
aggregate(trip_data$ride_length_minu ~ trip_data$user_type, FUN = mean)
aggregate(trip_data$ride_length_minu ~ trip_data$user_type, FUN = median)
aggregate(trip_data$ride_length_minu ~ trip_data$user_type, FUN = min)
aggregate(trip_data$ride_length_minu ~ trip_data$user_type, FUN = max)

# comparing ride_length per minute for members and casual users during different week days and creating visuals

aggregate(trip_data$ride_length_minu ~ trip_data$user_type + trip_data$day_of_week, FUN = mean)
aggregate(trip_data$ride_length_minu ~ trip_data$user_type + trip_data$day_of_week, FUN = min)
aggregate(trip_data$ride_length_minu ~ trip_data$user_type + trip_data$day_of_week, FUN = max)


# The most used start station in general and  per each user type
count(trip_data, start_station_name, sort = TRUE)
count(trip_data, end_station_name, sort = TRUE)
count(trip_data, start_station_name, sort = FALSE)
count(trip_data, end_station_name, sort = FALSE)
count(trip_data, user_type, start_station_name,sort= TRUE)
count(trip_data, start_station_name, user_type, sort= FALSE)
count(trip_data, user_type, day_of_week, sort = TRUE)
count(trip_data, user_type, sort = FALSE)
names(trip_data)

# Creating a Trip_data_for_visualizing file
final_trip_data <- trip_data %>% drop_na() %>% 
  select(-c(start_time, end_time, trip_duration, ride_length, year))

nrow(trip_data_for_visuals)
# Exporting the Trip data file to visualize trends and key findings using tableau
write.csv(final_trip_data, 
          file = 'D:/00-Data/02-Google Data Analytics/0000-Case Study/01-First Track Casestudy 1/Bikeshare Data/cyclistic_trip_data 2019_to_2020/rdirectory/00-casestudy final directory/final_trip_data.csv')
names()




