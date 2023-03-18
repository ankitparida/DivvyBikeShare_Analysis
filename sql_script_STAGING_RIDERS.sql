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

CREATE EXTERNAL TABLE dbo.staging_riders (
	[rider_id] bigint,
	[first_name] nvarchar(4000),
	[last_name] nvarchar(4000),
	[address] nvarchar(4000),
	[birthday] nvarchar(4000),
	[account_start_date] nvarchar(4000),
	[account_end_date] nvarchar(4000),
	[is_member] bit
	)
	WITH (
	LOCATION = 'riders.csv',
	DATA_SOURCE = [udacity_udacityadls2_dfs_core_windows_net],
	FILE_FORMAT = [SynapseDelimitedTextFormat]
	)
GO


SELECT TOP 100 * FROM dbo.staging_riders
GO