IF OBJECT_ID('dbo.fact_Payment') IS NOT NULL
BEGIN
    DROP TABLE fact_Payment
END

GO

CREATE TABLE fact_Payment (
	payment_id BIGINT,
	payment_date DATETIME2,
	amount FLOAT,
	rider_id BIGINT
	)

GO

INSERT INTO fact_Payment
SELECT 
payment_id,
cast(date as DATETIME2) as date,
cast(amount as FLOAT) as amount,
rider_id
FROM staging_payments

GO

SELECT TOP 10 * from fact_Payment;