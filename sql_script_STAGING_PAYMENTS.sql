IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'SynapseDelimitedTextFormat') 
	CREATE EXTERNAL FILE FORMAT [SynapseDelimitedTextFormat] 
	WITH ( FORMAT_TYPE = DELIMITEDTEXT ,
	       FORMAT_OPTIONS (
			 FIELD_TERMINATOR = ',',
			 USE_TYPE_DEFAULT = FALSE
			))
GO

IF NOT EXISTS (SELECT * FROM sys.external_data_sources WHERE name = 'udacity_udacityadls2_dfs_core_windows_net') 
	CREATE EXTERNAL DATA SOURCE [udacity_udacityadls2_dfs_core_windows_net] 
	WITH (
		LOCATION = 'abfss://udacity@udacityadls2.dfs.core.windows.net', 
		TYPE = HADOOP 
	)
GO

CREATE EXTERNAL TABLE dbo.staging_payments (
	[payment_id] bigint,
	[date] nvarchar(4000),
	[amount] float,
	[rider_id] bigint
	)
	WITH (
	LOCATION = 'payments.csv',
	DATA_SOURCE = [udacity_udacityadls2_dfs_core_windows_net],
	FILE_FORMAT = [SynapseDelimitedTextFormat]
	)
GO


SELECT TOP 100 * FROM dbo.staging_payments
GO