IF OBJECT_ID('dbo.dim_Date') IS NOT NULL
BEGIN
    DROP TABLE dim_Date
END

GO

CREATE TABLE dim_Date
(
    date_id       datetime2,
    date          DATE,  
    day           tinyint,
    day_name      varchar(15),
    week          tinyint,
    day_of_week   tinyint,
    month         tinyint,
    month_name    varchar(12),
    quarter       tinyint,
    year          smallint
);

GO


DECLARE @StartDate DATE = '20010101', @NumberOfYears INT = 30
SET DATEFIRST 7
SET DATEFORMAT dmy
DECLARE @CutoffDate DATE = DATEADD(YEAR, @NumberOfYears, @StartDate);

INSERT dim_Date(date_id) 
SELECT d
FROM
(
  SELECT d = DATEADD(DAY, rn - 1, @StartDate)
  FROM 
  (
    SELECT TOP (DATEDIFF(DAY, @StartDate, @CutoffDate)) 
      rn = ROW_NUMBER() OVER (ORDER BY s1.[object_id])
    FROM sys.all_objects AS s1
    CROSS JOIN sys.all_objects AS s2
    -- on my system this would support > 5 million days
    ORDER BY s1.[object_id]
  ) AS x
) AS y;


GO

UPDATE dim_Date
set 
  date     = CONVERT(date, [date_id]),
  [day]    = DATEPART(DAY,    [date_id]),
  [day_name]   = DATENAME(WEEKDAY,    [date_id]),
  [week] = DATEPART(WEEK , [date_id]),
  [day_of_week]  = DATEPART(WEEKDAY,    [date_id]),
  [month]       = DATEPART(MONTH,     [date_id]),
  [month_name]    = DATENAME(MONTH,  [date_id]),
  [quarter]  =  DATEPART(QUARTER, [date_id]),
  [year]       = DATEPART(YEAR,     [date_id])
  ;


SELECT TOP 10 * from dim_Date order by date_id;