IF OBJECT_ID('dbo.dim_Station') IS NOT NULL
BEGIN
    DROP TABLE dim_Station
END

GO;

CREATE TABLE dim_Station (
	station_id nvarchar(400),
	station_name nvarchar(1000),
	latitude float,
	longitude float
	)

GO;

INSERT INTO dim_Station
SELECT station_id,station_name,latitude,longitude
FROM staging_stations;

GO;

SELECT TOP 10 * FROM dim_Station;
