# Google-Data_Analytics_CaseStudy_1
A full case study capstone project for google data analytics certificate course
Google Data Analytics Case Study 1
How Does a Bike-Share Navigate Speedy Success?
•	Business Task Statement:
How to Convert Casual riders into annual members?

•	Question Asked : 
How do annual members and casual riders use bikes differently?

•	Key Stakeholders:
A)	Primary: Lily Moreno My Direct Manager
B)	Secondary: Marketing Analytics Team
C)	Upper Management: Cyclistic Executive team

•	Goal of analysis:
To understand how casual riders and annual members use Cyclistic bikes differently
•	Data Resources Used:
Trip data for both casual and annual riders made available by Motivate International Inchttps://divvy-tripdata.s3.amazonaws.com/index.html. under this licensehttps://ride.divvybikes.com/data-license-agreement.)

•	Project Phases:
The main question is How do annual members and casual riders use Cyclistic bikes differently?
1-	Ask:
Deliverable: A clear statement of the business task (How to Convert Casual riders into annual members?)
2-	Prepare:
Deliverable: A description of all data sources used:
A)	 Data is downloaded from Motivate International Inc.
B)	Downloaded files trip_data_ from 2019 Q1 to 2020 Q1
C)	CSV files downloaded and saved in one main csv file called(cyclistic_trip_data_2019_q1_to_q4_to_2020_q1)
D)	Csv file names are (Divvy_Trips_2019_Q1.csv, Divvy_Trips_2019_Q2.csv, Divvy_Trips_2019_Q3.csv, Divvy_Trips_2019_Q4.csv, Divvy_Trips_2020_Q1.csv)
E)	Files were too large to open with excel and spreadsheets
F)	all files are imported to R in as vectors (the reason we use R because it’s faster, allows me to use viz to check bias, and I want to go further to the machine learning field so it will allow me to do so because it’s close to Python, and allow algorithms and machine learning)
.


3-	Process:
Deliverable: Documentation of any cleaning or manipulation of data (Included in the script, and RMD file)
•	Quality & Tidiness Issues Found: 
1-	Column names are not consistent (q2_2019 has different column names need to be changed).
2-	The trip_id column Must be al as characters.
3-	There are some columns in (q1_2020) needs to be removed (rideable_type, start_lat, start_lng, end_lat, end_lng).
4-	There are some columns in (q1_2019, q2_2019, q3_2019, q4_2019) to remove (gender, birthyear).
5-	No Duplicates Found.
6-	There are missing values (q1_2019, gender, birthyear), (q2_2019, birthyear), (q3_2019, gender birthyear),(q4_2019, gender birthyear), (q1_2020, 4 values).
7-	Start and end time are a group of datetime needs to be separated to YY MM DD time.
8-	There are unneeded columns need to be removed (bike_id, start_station_id, end_station_id, gender, start_lat, start_lng, end_lat, end_lng).
9-	start_station name includes unneeded values("MTL-ECO5.1-01", "HQ QR" )
10-	End station name also has unneeded values(HQ QR", "MTL-ECO5.1-01" ) and NA values
11-	User type column values need to be consistent (member& casual only)
12-	Week days are not ordered correctly
13-	There are NA's in trip duration column so we will calculate it manually using start and end time

4-	Analyze:
-	Key tasks
A)	Aggregate your data so it’s useful and accessible.
B)	 Organize and format your data.
C)	 Perform calculations.
D)	Identify trends and relationships.
Deliverable: A summary of your analysis (analysis have been made and included in R Script, and RMD) 
5-	Share:
“ Share is divided by two steps Key insights found from conduction some descriptive analysis, then a final file version is made and saved as CSV file to create visuals using Tableau” 
•	Key Insights & surprises about the data:
1-	The average ride length per minute for casual users is more than premium users.
2-	Friday has the longest avg_ride_length_per_minute for casual users, However Saturday has the longest avg ride per minute for annual members.
3-	The maximum ride length per minute for member users occurs on Tuesday, however the maximum ride length per minute for casual users occur on Thursday.
4-	The most used start station in general is "Streeter Dr & Grand Ave " with the amount of 70447 occurrences, Also which surprising it's the most used end station name by 84479 occurrences
5-	The least used start_station_name is 2112 W Peterson Ave, with 546 occurrences, and surprisingly it's the same least used end station with 685.
6-	The most used station for annual members is Canal St & Adams St 58161, and for casual users Streeter Dr & Grand Ave with 54634
7-	The least used start station is 2112 W Peterson Ave for both types of users.
8-	Total number of rides for the period of (2019-01-01 to 2020-03-30) is 4,241,111rides, Noticed that Annual members have 3315766 rides with the % of 78.18%, and casual members have 925345 rides with the % of 21.81%.
9-	The top week day for casual riders bike rides is Saturday, and for annual members is Tuesday.
10-	The lowest rides for casual riders is Tuesday, and for annual members is Sunday.

•	My Recommendations:
A)	We can start our campaign by conducting a survey for casual riders on Saturday since it's the top day for casual users.
B)	We can conduct a marketing campaign on Saturday, and Streeter Dr & Grand Ave since it's the top for casual users
C)	Finally we can make a discount for users only on Thursday, since it's the day when most casual riders have the longest avg ride_length

![The Average Ride Length Per minutes for M](https://user-images.githubusercontent.com/72468395/149984684-50890e7f-2737-4498-a6cf-660a59a7ff0e.PNG)
![The Most Used Start Station By both user types](https://user-images.githubusercontent.com/72468395/149984695-41b4f1bb-046d-4016-b407-0e0d88bdcc4a.png)
![Number of Rides per user type By Weekday](https://user-images.githubusercontent.com/72468395/149984698-a2c1d232-41b1-48a2-bfa3-f101f3a4417e.png)
