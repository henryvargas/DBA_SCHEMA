/*
*  Creacion de esquema code para SGSO_RESCUE
*
*  Nombre          Fecha         Description
*  ---------------------------------------------------
* Jorge F. Flores 17/02/2019     Version inicial
* 
*/

USE [SGSO_RESCUE_CODE];
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

PRINT 'Adding Users to Roles.......';
ALTER ROLE MyService_rescue ADD MEMBER [Service_rescue];
ALTER ROLE MyReporting_rescue ADD MEMBER [Reporting_rescue];
GO

PRINT 'Creating Synonyms....';

IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Proyecto')
	CREATE SYNONYM [Proyectos].[Proyecto] FOR [SGSO_RESCUE_DATA].[Proyectos].[base_Proyecto];

IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Persona')
	CREATE SYNONYM [Usuario].[Persona] FOR [SGSO_RESCUE_DATA].[Usuario].[base_Persona];

IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Login')
	CREATE SYNONYM [Usuario].[Login] FOR [SGSO_RESCUE_DATA].[Usuario].[base_Login];

IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Password')
	CREATE SYNONYM [Usuario].[Password] FOR [SGSO_RESCUE_DATA].[Usuario].[base_Password];

IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Tipo_Accidente')
	CREATE SYNONYM [Incidentes].[Tipo_Accidente] FOR [SGSO_RESCUE_DATA].[Incidentes].[base_Tipo_Accidente];

IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Tipo_Lesion')
	CREATE SYNONYM [Incidentes].[Tipo_Lesion] FOR [SGSO_RESCUE_DATA].[Incidentes].[base_Tipo_Lesion];

IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Incidente')
	CREATE SYNONYM [Incidentes].[Incidente] FOR [SGSO_RESCUE_DATA].[Incidentes].[base_Incidente];

IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Cargo')
	CREATE SYNONYM [Equipamientos].[Cargo] FOR [SGSO_RESCUE_DATA].[Equipamientos].[base_Cargo];

IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Organigrama')
	CREATE SYNONYM [Proyectos].[Organigrama] FOR [SGSO_RESCUE_DATA].[Proyectos].[base_Organigrama];

IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Empleado')
	CREATE SYNONYM [Usuario].[Empleado] FOR [SGSO_RESCUE_DATA].[Usuario].[base_Empleado];

IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Proyecto_Empleado')
	CREATE SYNONYM [Proyectos].[Proyecto_Empleado] FOR [SGSO_RESCUE_DATA].[Proyectos].[base_Proyecto_Empleado];

IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Incidente_Empleado')
	CREATE SYNONYM [Incidentes].[Incidente_Empleado] FOR [SGSO_RESCUE_DATA].[Incidentes].[base_Incidente_Empleado];

IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Ausentismo')
	CREATE SYNONYM [Incidentes].[Ausentismo] FOR [SGSO_RESCUE_DATA].[Incidentes].[base_Ausentismo];

IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Equipamiento')
	CREATE SYNONYM [Equipamientos].[Equipamiento] FOR [SGSO_RESCUE_DATA].[Equipamientos].[base_Equipamiento];

IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Asignacion_Equipamiento')
	CREATE SYNONYM [Equipamientos].[Asignacion_Equipamiento] FOR [SGSO_RESCUE_DATA].[Equipamientos].[base_Asignacion_Equipamiento];

IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Equipamiento_hist')
	CREATE SYNONYM [Equipamientos].[Equipamiento_hist] FOR [SGSO_RESCUE_DATA].[Equipamientos].[base_Equipamiento_hist];




