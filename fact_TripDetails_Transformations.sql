IF OBJECT_ID('dbo.fact_TripDetails') IS NOT NULL
BEGIN
    DROP TABLE fact_TripDetails
END

GO

CREATE TABLE fact_TripDetails (
	trip_id NVARCHAR(200),
	rider_id BIGINT,
    start_station_id NVARCHAR(200),
    end_station_id NVARCHAR(200),
    start_time_id DATETIME2, 
    end_time_id DATETIME2,
    rideable_type VARCHAR(40),
    duration_in_mins VARCHAR(40), 
    rider_age SMALLINT
	)

GO

INSERT INTO fact_TripDetails
SELECT 
trip_id,
t.rider_id,
start_station_id,
end_station_id,
cast(start_at as DATETIME2) as start_time_id,
cast(ended_at as DATETIME2) as end_time_id,
rideable_type,
DATEDIFF(minute,cast(start_at as DATETIME2),cast(ended_at as DATETIME2)) as duration_in_mins,
DATEDIFF(year,r.birthday,cast(start_at as DATETIME2)) as rider_age
FROM staging_trips t
LEFT JOIN staging_riders r on t.rider_id = r.rider_id

GO

SELECT TOP 10 * from fact_TripDetails;