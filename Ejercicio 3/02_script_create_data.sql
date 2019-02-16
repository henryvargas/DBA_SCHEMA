USE [SGSO_RESCUE];
GO

PRINT 'Creating Users....';

IF NOT EXISTS ( SELECT 1 FROM sys.database_principals WHERE name = 'Service_rescue')
	CREATE USER [Service_rescue] FOR LOGIN [Service_rescue] WITH DEFAULT_SCHEMA = [dbo];

IF NOT EXISTS ( SELECT 1 FROM sys.database_principals WHERE name = 'Reporting_recue')
	CREATE USER [Reporting_rescue] FOR LOGIN [Reporting_rescue] WITH DEFAULT_SCHEMA = [dbo];

PRINT 'Creating Roles.......';

IF NOT EXISTS ( SELECT 1 FROM sys.database_principals WHERE name = 'MyService_rescue' and Type = 'R')
	CREATE ROLE MyService_rescue AUTHORIZATION [dbo];

IF NOT EXISTS ( SELECT 1 FROM sys.database_principals WHERE name = 'MyReporting_rescue' and Type = 'R')
	CREATE ROLE MyReporting_rescue AUTHORIZATION [dbo];

PRINT 'Adding Permissions to Roles.......';
GRANT SELECT ON SCHEMA::[dbo] TO [MyService_rescue];
GRANT INSERT ON SCHEMA::[dbo] TO [MyService_rescue];
GRANT UPDATE ON SCHEMA::[dbo] TO [MyService_rescue];
GRANT DELETE ON SCHEMA::[dbo] TO [MyService_rescue];
GO
GRANT SELECT ON SCHEMA::[dbo] TO [MyReporting_rescue];
GO

PRINT 'Adding Users to Roles.......';
ALTER ROLE MyService_rescue ADD MEMBER [Service_rescue];
ALTER ROLE MyReporting_rescue ADD MEMBER [Reporting_rescue];
GO
