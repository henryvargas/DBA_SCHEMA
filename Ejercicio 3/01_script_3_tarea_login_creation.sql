/*
*  Creacion login
*
*  Nombre          Fecha         Description
*  ---------------------------------------------------
* Jorge F. Flores 10/02/2019     Version inicial
* 
*/


USE [master];
GO
--TODO: Set SQLCMD variables

:SETVAR passwd "Password01"

IF NOT EXISTS ( SELECT * FROM sys.server_principals WHERE name = 'Service_rescue' )
  CREATE LOGIN [Service_rescue] WITH PASSWORD = '$(passwd)', CHECK_POLICY = OFF;

IF NOT EXISTS ( SELECT * FROM sys.server_principals WHERE name = 'Reporting_rescue' )
  CREATE LOGIN [Reporting_rescue] WITH PASSWORD = '$(passwd)', CHECK_POLICY = OFF;

