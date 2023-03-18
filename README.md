# DivvyBikeShare_Analysis

## Project Overview
Divvy is a bike sharing program in Chicago, Illinois USA that allows riders to purchase a pass at a kiosk or use a mobile application to unlock a bike at stations around the city and use the bike for a specified amount of time. The bikes can be returned to the same station or to another station. The City of Chicago makes the anonymized bike trip data publicly available for projects like this where we can analyze the data.

Since the data from Divvy are anonymous, we have created fake rider and account profiles along with fake payment data to go along with the data from Divvy. The dataset looks like this:

![image](https://user-images.githubusercontent.com/30798966/226129279-4bd13cff-9300-41c5-9135-a879bd298136.png)

The goal of this project is to develop a data warehouse solution using Azure Synapse Analytics. 

## Steps to implement:

***1. Design a star schema based on the business outcomes listed below.***

***2. Import the data into Synapse.***

***3. Transform the data into the star schema and finally, view the reports from Analytics.***

### The business outcomes are as follows:
1. Analyze how much time is spent per ride
- Based on date and time factors such as day of week and time of day
- Based on which station is the starting and / or ending station
- Based on age of the rider at time of the ride
- Based on whether the rider is a member or a casual rider

2. Analyze how much money is spent
- Per month, quarter, year
- Per member, based on the age of the rider at account start

3. Analyze how much money is spent per member
- Based on how many rides the rider averages per month
- Based on how many minutes the rider spends on a bike per month

## Schema for Divvy Bike Share Analysis

### Fact Table:

***fact_TripDetails:*** Store the trip related data including the duration and age of the rider.

### Dimension Tables:

***dim_Rider***: Store the Rider details.
***dim_Station***: Store the Station details.
***dim_Payment***: Store Payment related information.
***dim_Date***: Calender Table.


## <u> STAR SCHEMA </u>:

![image](https://user-images.githubusercontent.com/30798966/226129200-081767ca-78b0-4370-be5d-8867ddeb93ac.png)
