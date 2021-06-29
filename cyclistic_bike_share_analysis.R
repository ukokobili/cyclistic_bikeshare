# This analysis is for case study 1 from the Google Data Analytics Certificate (Cyclistic).  
# This is a Cyclistic bike-share analysis case study! In this case study, 
# I will use a dataset of a fictional company call Cyclistic in Chicago.

# Install required packages
library(tidyverse)  #helps wrangle data
library(lubridate)  #helps wrangle date attributes
library(ggplot2)  #helps visualize data
getwd() #displays your working directory
setwd("../OneDrive/projects/Capstone_Project") #sets directory

# Data collection
# Upload Divvy datasets (csv files) here
tripdata_202004 <- read_csv("202004_tripdata.csv")
tripdata_202005 <- read_csv("202005_tripdata.csv")
tripdata_202006 <- read_csv("202006_tripdata.csv")
tripdata_202007 <- read_csv("202007_tripdata.csv")
tripdata_202008 <- read_csv("202008_tripdata.csv")
tripdata_202009 <- read_csv("202009_tripdata.csv")
tripdata_202010 <- read_csv("202010_tripdata.csv")
tripdata_202011 <- read_csv("202011_tripdata.csv")
tripdata_202012 <- read_csv("202012_tripdata.csv")
tripdata_202101 <- read_csv("202101_tripdata.csv")
tripdata_202102 <- read_csv("202102_tripdata.csv")
tripdata_202103 <- read_csv("202103_tripdata.csv")

# Data wrangling and combination of tables
# Compare column names each of the files
colnames(tripdata_202004)
colnames(tripdata_202005)
colnames(tripdata_202006)
colnames(tripdata_202007)
colnames(tripdata_202008)
colnames(tripdata_202009)
colnames(tripdata_202010)
colnames(tripdata_202011)
colnames(tripdata_202012)
colnames(tripdata_202101)
colnames(tripdata_202102)
colnames(tripdata_202103)

# Inspect the dataframes and look for inconsistencies
str(tripdata_202004)
str(tripdata_202005)
str(tripdata_202006)
str(tripdata_202007)
str(tripdata_202008)
str(tripdata_202009)
str(tripdata_202010)
str(tripdata_202011)
str(tripdata_202012)
str(tripdata_202101)
str(tripdata_202102)
str(tripdata_202103)

# Convert ride_id and rideable_type to character so that they can stack correctly
tripdata_202004 <-  mutate(tripdata_202004, ride_id = as.character(ride_id)
                           ,rideable_type = as.character(rideable_type))

tripdata_202005 <-  mutate(tripdata_202005, ride_id = as.character(ride_id)
                           ,rideable_type = as.character(rideable_type))

tripdata_202006 <-  mutate(tripdata_202006, ride_id = as.character(ride_id)
                           ,rideable_type = as.character(rideable_type))

tripdata_202007 <-  mutate(tripdata_202007, ride_id = as.character(ride_id)
                           ,rideable_type = as.character(rideable_type))

tripdata_202008 <-  mutate(tripdata_202008, ride_id = as.character(ride_id)
                           ,rideable_type = as.character(rideable_type))

tripdata_202009 <-  mutate(tripdata_202009, ride_id = as.character(ride_id)
                           ,rideable_type = as.character(rideable_type))

tripdata_202010 <-  mutate(tripdata_202010, ride_id = as.character(ride_id)
                           ,rideable_type = as.character(rideable_type))

tripdata_202011 <-  mutate(tripdata_202011, ride_id = as.character(ride_id)
                           ,rideable_type = as.character(rideable_type))

tripdata_202012 <-  mutate(tripdata_202012, ride_id = as.character(ride_id)
                           ,rideable_type = as.character(rideable_type))

tripdata_202101 <-  mutate(tripdata_202101, ride_id = as.character(ride_id)
                           ,rideable_type = as.character(rideable_type))

tripdata_202102 <-  mutate(tripdata_202102, ride_id = as.character(ride_id)
                           ,rideable_type = as.character(rideable_type))

tripdata_202103 <-  mutate(tripdata_202103, ride_id = as.character(ride_id)
                           ,rideable_type = as.character(rideable_type))

# Convert start_at and end_at to character for 202004 to datetime
tripdata_202004 <-  mutate(tripdata_202004, started_at = as.POSIXct(started_at 
                            ,format = "%Y-%m-%d %H:%M:%S")
                           ,ended_at = as.POSIXct(ended_at
                            ,format = "%Y-%m-%d %H:%M:%S"))

# Convert start_station_id` and end_station_id from double to factor
tripdata_202004 <- mutate(tripdata_202004, start_station_id = as.factor(start_station_id) 
                           ,end_station_id = as.factor(end_station_id))

tripdata_202005 <- mutate(tripdata_202005, start_station_id = as.factor(start_station_id)
                          ,end_station_id = as.factor(end_station_id))

tripdata_202006 <- mutate(tripdata_202006, start_station_id = as.factor(start_station_id)
                          ,end_station_id = as.factor(end_station_id))

tripdata_202007 <- mutate(tripdata_202007, start_station_id = as.factor(start_station_id)
                          ,end_station_id = as.factor(end_station_id))

tripdata_202008 <- mutate(tripdata_202008, start_station_id = as.factor(start_station_id)
                          ,end_station_id = as.factor(end_station_id))

tripdata_202009 <- mutate(tripdata_202009, start_station_id = as.factor(start_station_id)
                          ,end_station_id = as.factor(end_station_id))

tripdata_202010 <- mutate(tripdata_202010, start_station_id = as.factor(start_station_id)
                          ,end_station_id = as.factor(end_station_id))

tripdata_202011 <- mutate(tripdata_202011, start_station_id = as.factor(start_station_id)
                          ,end_station_id = as.factor(end_station_id))

tripdata_202012 <- mutate(tripdata_202012, start_station_id = as.factor(start_station_id)
                          ,end_station_id = as.factor(end_station_id))

tripdata_202102 <- mutate(tripdata_202102, start_station_id = as.factor(start_station_id)
                          ,end_station_id = as.factor(end_station_id))

tripdata_202103 <- mutate(tripdata_202103, start_station_id = as.factor(start_station_id)
                          ,end_station_id = as.factor(end_station_id))
                   
# Stack individual data frames into one big data frame
all_trips <- bind_rows(tripdata_202004, tripdata_202005, tripdata_202006, 
                       tripdata_202007, tripdata_202008, tripdata_202009,
                       tripdata_202010, tripdata_202011, tripdata_202012,
                       tripdata_202102, tripdata_202102, tripdata_202103)

# Remove lat, lng
all_trips <- all_trips %>%  
  select(-c(start_lat, start_lng, end_lat, end_lng))

# Data clean up and add data to prepare for analysis
# Inspect the new table that has been created
colnames(all_trips)  #List of column names
nrow(all_trips)  #How many rows are in data frame?
dim(all_trips)  #Dimensions of the data frame?
head(all_trips)  #See the first 6 rows of data frame.  Also tail(qs_raw)
str(all_trips)  #See list of columns and data types (numeric, character, etc)
summary(all_trips)  #Statistical summary of data. Mainly for numeric

# Add columns that list the date, month, day, and year of each ride
# $ allows you extract elements by name from a named list/name()
all_trips$date <- as.Date(all_trips$started_at) #The default format is yyyy-mm-dd
all_trips$month <- format(as.Date(all_trips$date), "%m")
all_trips$day <- format(as.Date(all_trips$date), "%d")
all_trips$year <- format(as.Date(all_trips$date), "%Y")
all_trips$day_of_week <- format(as.Date(all_trips$date), "%A")

# Add a "ride_length" calculation to all_trips (in seconds)
all_trips$ride_length <- difftime(all_trips$ended_at,all_trips$started_at)

# Inspect the structure of the columns
str(all_trips)

# Convert "ride_length" from Factor to numeric so we can run calculations on the data
is.factor(all_trips$ride_length)
all_trips$ride_length <- as.numeric(as.character(all_trips$ride_length))
is.numeric(all_trips$ride_length)


# Remove "bad" data
# The dataframe includes a few hundred entries when bikes were taken out of docks and checked for quality by Divvy or ride_length was negative
# We will create a new version of the dataframe (v2) since data is being removed
# https://www.datasciencemadesimple.com/delete-or-drop-rows-in-r-with-conditions-2/

all_trips_v2 <- all_trips[!(all_trips$start_station_name == "HQ QR" | all_trips$ride_length<0),]

# Descriptive analysis
# Descriptive analysis on ride_length (all figures in seconds)
mean(all_trips_v2$ride_length) #straight average (total ride length / rides)
median(all_trips_v2$ride_length) #midpoint number in the ascending array of ride lengths
max(all_trips_v2$ride_length) #longest ride
min(all_trips_v2$ride_length) #shortest ride

# You can condense the four lines above to one line using summary() on the specific attribute
summary(all_trips_v2$ride_length)

# Compare members and casual users
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = mean)
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = median)
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = max)
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = min)

# See the average ride time by each day for members vs casual users
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual + all_trips_v2$day_of_week, FUN = mean)

# Notice that the days of the week are out of order. Let's fix that.
all_trips_v2$day_of_week <- ordered(all_trips_v2$day_of_week, levels=c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))

# Now, let's run the average ride time by each day for members vs casual users
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual + all_trips_v2$day_of_week, FUN = mean)

# analyze ridership data by type and weekday
all_trips_v2 %>% 
  mutate(weekday = wday(started_at, label = TRUE)) %>%  #creates weekday field using wday()
  group_by(member_casual, weekday) %>%  #groups by usertype and weekday
  summarise(number_of_rides = n()							#calculates the number of rides and average duration 
            ,average_duration = mean(ride_length)) %>% 		# calculates the average duration
  arrange(member_casual, weekday)								# sorts

# Let's visualize the number of rides by rider type
all_trips_v2 %>% 
  mutate(weekday = wday(started_at, label = TRUE)) %>% 
  group_by(member_casual, weekday) %>% 
  summarise(number_of_rides = n()
            ,average_duration = mean(ride_length)) %>% 
  arrange(member_casual, weekday)  %>% 
  ggplot(aes(x = weekday, y = number_of_rides, fill = member_casual)) +
  geom_col(position = "dodge")

# Let's create a visualization for average duration
all_trips_v2 %>% 
  mutate(weekday = wday(started_at, label = TRUE)) %>% 
  group_by(member_casual, weekday) %>% 
  summarise(number_of_rides = n()
            ,average_duration = mean(ride_length)) %>% 
  arrange(member_casual, weekday)  %>% 
  ggplot(aes(x = weekday, y = average_duration, fill = member_casual)) +
  geom_col(position = "dodge")

# Create a csv file that we will visualize in Excel, Tableau, or Power BI
counts <- aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual + all_trips_v2$day_of_week, FUN = mean)
write.csv(counts, '..\\OneDrive\\projects\\Capstone_Project\\avg_ride_length.csv', row.names = FALSE)
write_csv(counts, path = "avg_ride_length.csv")
