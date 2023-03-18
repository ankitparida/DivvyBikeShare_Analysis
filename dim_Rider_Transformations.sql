IF OBJECT_ID('dbo.dim_Rider') IS NOT NULL
BEGIN
    DROP TABLE dim_Rider
END

GO

CREATE TABLE dim_Rider (
	rider_id BIGINT,
	first_name nvarchar(200),
	last_name nvarchar(200),
	address nvarchar(400),
	birthday datetime2,
	account_start_date datetime2,
	account_end_date datetime2,
	is_member varchar(20)
	)

GO

INSERT INTO dim_Rider
SELECT 
rider_id,
first_name,
last_name,
address,
CONVERT(date, [birthday]) as birthday,
CONVERT(date, [account_start_date]) as account_start_date,
CONVERT(date, [account_end_date]) as account_end_date,
is_member
FROM staging_riders

GO

SELECT TOP 10 * from dim_Rider;