--1. TO CHECK PEAK DAYS OF THE WEEK

SELECT
d.day_of_week,
d.day_name,
count(d.day_of_week) as no_of_rides
FROM fact_tripdetails t
LEFT JOIN dim_date d on CONVERT(date, t.start_time_id) = CAST(d.date_id AS DATETIME)
GROUP BY d.day_of_week,d.day_name
ORDER BY no_of_rides DESC
;

--SATURDAY IS THE PEAK DAY OF A WEEK WITH MAXIMUM NUMBER OF RIDES


--2. TIME SPENT ON A RIDE BASED ON STATION, AGE, MEMBER

----ANALYSIS BASED ON STATION NAME

SELECT
s1.station_name,
count(distinct trip_id) as total_starting_trips
FROM fact_tripdetails t
LEFT JOIN dim_Stations s1 on t.start_station_id = s1.station_id
group by s1.station_name
order by total_starting_trips desc
;

---PEAK DEPARTURE STATION IS : "Streeter Dr & Grand Ave"

SELECT
s1.station_name,
count(distinct trip_id) as total_ending_trips
FROM fact_tripdetails t
LEFT JOIN dim_Stations s1 on t.end_station_id = s1.station_id
group by s1.station_name
order by total_ending_trips desc
;

---PEAK ARRIVAL STATION IS : "Streeter Dr & Grand Ave"

----ANALYSIS BASED ON AGE

SELECT
rider_age,
count(trip_id) as trip_count
FROM fact_tripdetails
group by rider_age
order by trip_count desc;

---AGE GROUP BETWEEN 27-29 TOOK MAXIMUM NUMBER OF RIDES

----ANALYSIS BASED ON MEMBERSHIP

SELECT
r.is_member,
count(t.trip_id) as trip_count
FROM
fact_TripDetails t
LEFT JOIN dim_rider r on t.rider_id = r.rider_id
group by r.is_member;

--RIDERS WHO TOOK MEMBERSHIP SEEMS TAKING THE RIDES MOST OF THE TIME