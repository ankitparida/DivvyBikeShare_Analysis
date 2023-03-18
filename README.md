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

1. ***fact_TripDetails:*** Store the trip related data including the duration and age of the rider.
2. ***fact_Payment***: Store Payment related information.

### Dimension Tables:

1. ***dim_Rider***: Store the Rider details.
2. ***dim_Station***: Store the Station details.
3. ***dim_Date***: Calender Table.


## <u> STAR SCHEMA </u>:

![image](https://user-images.githubusercontent.com/30798966/226138633-0705fc2d-0c1c-4491-8355-5970bbb4b391.png)


### Important Files:

1. ***ProjectDataToPostgres.py:*** Create and Load data into SQL Tables in Azure Postgres SQL Db.
2. ***PostgresConnCleanup.py:*** To close all redundant Connection if required.
3. ***starSchema_Diagram:*** Star schema to design the datawarehouse.
4. ***<>_Transformation.sql:*** Transformation SQLs for dimension and fact tables.
5. ***sql_script_<>.sql:*** SQL scripts to create external tables using the csv places in Azure blobstorage.

**NOTE- The Dataset can be downloaded from** ![Divvy-Bikes-Dataset](https://divvybikes.com/system-data/)

## Acknowledgements
I would like to give credit to:
* ![Udacity](https://classroom.udacity.com/nanodegrees/nd0277/)

### Github Link: [https://github.com/ankitparida/DivvyBikeShare_Analysis](https://github.com/ankitparida/DivvyBikeShare_Analysis/)
