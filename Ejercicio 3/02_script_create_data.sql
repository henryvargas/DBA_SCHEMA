/*
*  Creacion de esquema data para SGSO_RESCUE
*
*  Nombre          Fecha         Description
*  ---------------------------------------------------
* Jorge F. Flores 15/02/2019     Version inicial
* 
*/

USE [SGSO_RESCUE_DATA];
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
--CREANDO ESQUEMA PROYECTOS

PRINT 'CREANDO ESQUEMA PROYECTOS';

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'Proyectos')

	BEGIN
		EXEC('CREATE SCHEMA Proyectos')

		PRINT 'ESQUEMA PROYECTOS CREADO';
	END
ELSE
	BEGIN
		PRINT 'ESQUEMA PROYECTO YA EXISTE';
	END

GO
--CREANDO ESQUEMA USUARIO

PRINT 'CREANDO ESQUEMA USUARIO';

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'Usuario')

	BEGIN
		EXEC('CREATE SCHEMA Usuario')

		PRINT 'ESQUEMA Usuario CREADO';
	END
ELSE
	BEGIN
		PRINT 'ESQUEMA Usuario YA EXISTE';
	END

GO

--CREANDO ESQUEMA EQUIPAMIENTOS

PRINT 'CREANDO ESQUEMA EQUIPAMIENTOS';

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'Equipamientos')

	BEGIN
		EXEC('CREATE SCHEMA Equipamientos')

		PRINT 'ESQUEMA EQUIPAMIENTOS CREADO';
	END
ELSE
	BEGIN
		PRINT 'ESQUEMA EQUIPAMIENTOS YA EXISTE';
	END

GO
--CREANDO ESQUEMA INCIDENTES

PRINT 'CREANDO ESQUEMA INCIDENTES';

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'Incidentes')

	BEGIN
		EXEC('CREATE SCHEMA Incidentes')

		PRINT 'ESQUEMA INCIDENTES CREADO';
	END
ELSE
	BEGIN
		PRINT 'ESQUEMA INCIDENTES YA EXISTE';
	END

GO
----------------------------------------------------------------------------------------------
---------------------------------------CREACION DE TABLAS-------------------------------------
-- CREANDO TABLA PROYECTO

PRINT 'CREANDO TABLA PROYECTO';

IF NOT EXISTS (SELECT 1 FROM  sys.objects WHERE object_id=object_id(N'[Proyectos].[base_Proyecto]')
			AND type in (N'U'))

BEGIN
		CREATE TABLE [Proyectos].[base_Proyecto](ID_PROYECTO INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_PROYECTO PRIMARY KEY
										,NOMBRE VARCHAR(100) CONSTRAINT NN_NOM_PROYE NOT NULL
										,RESPONSABLE INT CONSTRAINT NN_RESP_PROYE NOT NULL
										,CIUDAD VARCHAR(50) CONSTRAINT NN_CIU_PROYE NOT NULL
										,PROVINCIA VARCHAR(150) CONSTRAINT NN_PROV_PROYE NOT NULL
										,DIRECCION VARCHAR(150) CONSTRAINT NN_DIR_PROYE NOT NULL);

		PRINT 'TABLA PROYECTO CREADA';
END
ELSE
	BEGIN

		PRINT 'TABLA Proyecto NO CREADA, YA EXISTE EN LA BASE DE DATOS';

	END

GO


--CREANDO TABLA PERSONA

PRINT 'CREANDO TABLA PERSONA';

IF NOT EXISTS (SELECT 1 FROM  sys.objects WHERE object_id=object_id(N'[Usuario].[base_Persona]')
			AND type in (N'U'))

BEGIN
		CREATE TABLE [Usuario].[base_Persona](ID_PERSONA INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_PERSONA PRIMARY KEY
									, NOMBRE VARCHAR(50)  CONSTRAINT NN_PER_NOM NOT NULL
									, APELLIDO VARCHAR(50) CONSTRAINT NN_PER_APE NOT NULL
									, DOCUMENTO_IDENTIDAD VARCHAR(50) NOT NULL CONSTRAINT AK_PER_DOCUMENTO_IDENTIDAD UNIQUE(DOCUMENTO_IDENTIDAD) 
									, EMAIL VARCHAR(80) CONSTRAINT NN_PER_EMA NOT NULL
									, DIRECCION VARCHAR(100) CONSTRAINT NN_PER_DIR NOT NULL
									, TELEFONO VARCHAR(50) 
									);

		PRINT 'TABLA Persona CREADA';
END
ELSE
	BEGIN

		PRINT 'TABLA  Pesona  NO CREADA, YA EXISTE EN LA BASE DE DATOS';

	END

GO

--CREANDO TABLA LOGIN

PRINT 'CREANDO TABLA LOGIN';

IF NOT EXISTS (SELECT 1 FROM  sys.objects WHERE object_id=object_id(N'[Usuario].[base_Login]')
			AND type in (N'U'))

BEGIN
		CREATE TABLE [Usuario].[base_Login](ID_LOGIN INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_LOGIN PRIMARY KEY
									 ,ID_PERSONA INT CONSTRAINT FK_PERSONA FOREIGN KEY(ID_PERSONA) REFERENCES Usuario.base_Persona(ID_PERSONA)
									 ,USUARIO VARCHAR(50) CONSTRAINT NN_LOG_USE NOT NULL
									 ,ESTADO BIT CONSTRAINT NN_LOG_EST NOT NULL
									);

		PRINT 'TABLA Login CREADA';
END
ELSE
	BEGIN

		PRINT 'TABLA  Login  NO CREADA, YA EXISTE EN LA BASE DE DATOS';

	END

GO

--CREANDO TABLA PASSWORD

PRINT 'CREANDO TABLA PASSWORD';

IF NOT EXISTS (SELECT 1 FROM  sys.objects WHERE object_id=object_id(N'[Usuario].[base_Password]')
			AND type in (N'U'))

BEGIN
		CREATE TABLE [Usuario].[base_Password]( ID_PASS INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_PASSWORD PRIMARY KEY
		                                ,ID_LOGIN INT CONSTRAINT FK_LOGIN FOREIGN KEY(ID_LOGIN) REFERENCES Usuario.[base_Login](ID_LOGIN)
									    ,PASS_ENCRYPT VARCHAR(100) CONSTRAINT NN_PAS_ NOT NULL
									  );

		PRINT 'TABLA Password CREADA';
END
ELSE
	BEGIN

		PRINT 'TABLA  Password  NO CREADA, YA EXISTE EN LA BASE DE DATOS';

	END

GO
--
--CREANDO TABLA TIPO_ACCIDENTE

PRINT 'CREANDO TABLA TIPO_ACCIDENTE';

IF NOT EXISTS (SELECT 1 FROM  sys.objects WHERE object_id=object_id(N'[Incidentes].[base_Tipo_Accidente]')
			AND type in (N'U'))

BEGIN
		CREATE TABLE [Incidentes].[base_Tipo_Accidente]( ID_TIPO_ACC INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_TIPO_ACCIDENTE PRIMARY KEY
		                                       ,NOMBRE VARCHAR(50)  CONSTRAINT NN_TIP_ACC_NOM NOT NULL
									          );

		PRINT 'TABLA Tipo_Accidente CREADA';
END
ELSE
	BEGIN

		PRINT 'TABLA  Tipo_Accidente  NO CREADA, YA EXISTE EN LA BASE DE DATOS';

	END

GO
--CREANDO TABLA TIPO_LESION

PRINT 'CREANDO TABLA TIPO_LESION';

IF NOT EXISTS (SELECT 1 FROM  sys.objects WHERE object_id=object_id(N'[Incidentes].[base_Tipo_Lesion]')
			AND type in (N'U'))
			
BEGIN
		CREATE TABLE [Incidentes].[base_Tipo_Lesion] (ID_LESION INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_TIPO_LESION PRIMARY KEY
		                                     ,NOMBRE VARCHAR(50)  CONSTRAINT NN_TIP_LEC_NOM NOT NULL
											 ,AREA_AFECT VARCHAR(50)  CONSTRAINT NN_TIP_LEC_ARE_AFE NOT NULL
		                                    );
		PRINT 'TABLA Tipo_Lesion CREADA';
END
ELSE
	BEGIN

		PRINT 'TABLA  Tipo_Lesion  NO CREADA, YA EXISTE EN LA BASE DE DATOS';

	END

GO
--

--CREANDO TABLA INCIDENTE

PRINT 'CREANDO TABLA INCIDENTE';

IF NOT EXISTS (SELECT 1 FROM  sys.objects WHERE object_id=object_id(N'[Incidentes].[base_Incidente]')
			AND type in (N'U'))

BEGIN
		CREATE TABLE [Incidentes].[base_Incidente]( ID_INCIDENTE INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_INCIDENTE PRIMARY KEY
		                                   ,ID_TIPO_ACC INT CONSTRAINT FK_TIP_ACC FOREIGN KEY(ID_TIPO_ACC) REFERENCES Incidentes.base_Tipo_Accidente(ID_TIPO_ACC)
										   ,ID_LESION INT CONSTRAINT FK_TIP_LES FOREIGN KEY(ID_LESION) REFERENCES Incidentes.base_Tipo_Lesion(ID_LESION)
										   ,FECHA_INCIDENTE DATE CONSTRAINT NN_INC_FEC_ACC NOT NULL
										   ,JORNADA VARCHAR(50)  CONSTRAINT NN_INC_JOR NOT NULL
										   ,SITIO_INCID VARCHAR (50) CONSTRAINT NN_INC_SIT_INC NOT NULL
										   ,TIPO_INCID BIT CONSTRAINT NN_INC_TIP_INC NOT NULL
										   ,MUERTE BIT  
										   ,DESCRIPTION VARCHAR(1000)
									      );

		PRINT 'TABLA Incidente CREADA';
END
ELSE
	BEGIN

		PRINT 'TABLA  Incidente  NO CREADA, YA EXISTE EN LA BASE DE DATOS';

	END

GO


--CREANDO TABLA CARGO

PRINT 'CREANDO TABLA CARGO';

IF NOT EXISTS (SELECT 1 FROM  sys.objects WHERE object_id=object_id(N'[Equipamientos].[base_Cargo]')
			AND type in (N'U'))
			
BEGIN
		CREATE TABLE [Equipamientos].[base_Cargo] (ID_CARGO INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_CARGO PRIMARY KEY
		                                  ,NOMBRE VARCHAR(100)  CONSTRAINT NN_CAR_NOM NOT NULL
										  ,DESCRIPCION VARCHAR(200)  CONSTRAINT NN_CAR_DES NOT NULL
		                                    );
		PRINT 'TABLA Cargo CREADA';
END
ELSE
	BEGIN

		PRINT 'TABLA  Cargo  NO CREADA, YA EXISTE EN LA BASE DE DATOS';

	END

GO
--CREANDO TABLA ORGANIGRAMA

PRINT 'CREANDO TABLA ORGANIGRAMA';

IF NOT EXISTS (SELECT 1 FROM  sys.objects WHERE object_id=object_id(N'[Proyectos].[base_Organigrama]')
			AND type in (N'U'))
			
BEGIN
		CREATE TABLE [Proyectos].[base_Organigrama] (ID_ORGANIGRAMA INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_ORGANIGRAMA PRIMARY KEY
		                                    ,ID_CARGO INT CONSTRAINT FK_ID_CAR FOREIGN KEY(ID_CARGO) REFERENCES Equipamientos.base_Cargo(ID_CARGO)
										    ,ANTECESOR INT  
											,SUCESOR INT
		                                    );
		PRINT 'TABLA Organigrama CREADA';
END
ELSE
	BEGIN

		PRINT 'TABLA  Organigrama  NO CREADA, YA EXISTE EN LA BASE DE DATOS';

	END

GO
--CREANDO TABLA EMPLEADO

PRINT 'CREANDO TABLA EMPLEADO';

IF NOT EXISTS (SELECT 1 FROM  sys.objects WHERE object_id=object_id(N'[Usuario].[base_Empleado]')
			AND type in (N'U'))
			
BEGIN
		CREATE TABLE [Usuario].[base_Empleado](ID_EMPLEADO INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_EMPLEADO PRIMARY KEY
		                                    ,ID_CARGO INT CONSTRAINT FK_ID_CAR FOREIGN KEY(ID_CARGO) REFERENCES Equipamientos.base_Cargo(ID_CARGO)
											,ID_PERSONA INT CONSTRAINT FK_ID_PER FOREIGN KEY(ID_PERSONA) REFERENCES Usuario.base_Persona(ID_PERSONA)
										    ,FECHA_CONTR DATE CONSTRAINT NN_EMP_FEC_CON NOT NULL
											,GENERO VARCHAR (50) CONSTRAINT NN_EMP_FEC_GEN NOT NULL
											,NRO_SEGURO VARCHAR (50) CONSTRAINT NN_EMP_NRO_SEG NOT NULL
											,ESTADO_SEGURO BIT CONSTRAINT NN_EMP_NRO_SEG NOT NULL
		                                    );
		PRINT 'TABLA Empleado CREADA';
END
ELSE
	BEGIN

		PRINT 'TABLA Empleado NO CREADA, YA EXISTE EN LA BASE DE DATOS';

	END

GO

--CREANDO TABLA PROYECTO_EMPLEADO

PRINT 'CREANDO TABLA PROYECTO_EMPLEADO';

IF NOT EXISTS (SELECT 1 FROM  sys.objects WHERE object_id=object_id(N'[Proyectos].[base_Proyecto_Empleado]')
			AND type in (N'U'))
			
BEGIN
		CREATE TABLE [Proyectos].[base_Proyecto_Empleado] (ID_PRO_EMP INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_PRO_EMP PRIMARY KEY
		                                          ,ID_PROYECTO INT CONSTRAINT FK_ID_PRO FOREIGN KEY(ID_PROYECTO) REFERENCES Proyectos.base_Proyecto(ID_PROYECTO)
											      ,ID_EMPLEADO INT CONSTRAINT FK_ID_EMP FOREIGN KEY(ID_EMPLEADO) REFERENCES Usuario.base_Empleado(ID_EMPLEADO)
										         
		                                         );
		PRINT 'TABLA Proyecto_Empleado CREADA';
END
ELSE
	BEGIN

		PRINT 'TABLA Proyecto_Empleado NO CREADA, YA EXISTE EN LA BASE DE DATOS';

	END

GO
--CREANDO TABLA INCIDENTE_EMPLEADO

PRINT 'CREANDO TABLA INCIDENTE_EMPLEADO';

IF NOT EXISTS (SELECT 1 FROM  sys.objects WHERE object_id=object_id(N'[Incidentes].[base_Incidente_Empleado]')
			AND type in (N'U'))
			
BEGIN
		CREATE TABLE [Incidentes].[base_Incidente_Empleado] (ID_INC_EMP INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_INC_EMP PRIMARY KEY
		                                          ,ID_INCIDENTE INT CONSTRAINT FK_INC_EMP_ID_INC FOREIGN KEY(ID_INCIDENTE) REFERENCES Incidentes.base_Incidente(ID_INCIDENTE)
											      ,ID_EMPLEADO INT CONSTRAINT FK_INC_EMP_ID_EMP FOREIGN KEY(ID_EMPLEADO) REFERENCES Usuario.base_Empleado(ID_EMPLEADO)
										           );
		PRINT 'TABLA Incidente_Empleado CREADA';
END
ELSE
	BEGIN

		PRINT 'TABLA Incidente_Empleado NO CREADA, YA EXISTE EN LA BASE DE DATOS';

	END

GO
--CREANDO TABLA AUSENTISMO

PRINT 'CREANDO TABLA AUSENTISMO';

IF NOT EXISTS (SELECT 1 FROM  sys.objects WHERE object_id=object_id(N'[Incidentes].[base_Ausentismo]')
			AND type in (N'U'))
			
BEGIN
		CREATE TABLE [Incidentes].[base_Ausentismo] (ID_AUSENTISMO INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_ID_AUS PRIMARY KEY
		                                    ,ID_EMPLEADO INT CONSTRAINT FK_AUS_ID_EMP FOREIGN KEY(ID_EMPLEADO) REFERENCES Usuario.base_Empleado(ID_EMPLEADO)
										    ,CAUSA VARCHAR (100) CONSTRAINT NN_AUS_CAU NOT NULL
											,FECHA_INIC DATE CONSTRAINT NN_AUS_FINC NOT NULL
											,FECHA_FIN DATE CONSTRAINT NN_AUS_FFIN NOT NULL
											,DIAS_AUS INT 
											,HORAS_AUS DATETIME 
											,OBSERVACION VARCHAR (1000) 
										   );
		PRINT 'TABLA Ausentismo CREADA';
END
ELSE
	BEGIN

		PRINT 'TABLA Ausentismo NO CREADA, YA EXISTE EN LA BASE DE DATOS';

	END

GO

--CREANDO TABLA EQUIPAMIENTO

PRINT 'CREANDO TABLA EQUIPAMIENTO';

IF NOT EXISTS (SELECT 1 FROM  sys.objects WHERE object_id=object_id(N'[Equipamientos].[base_Equipamiento]')
			AND type in (N'U'))
			
BEGIN
		CREATE TABLE [Equipamientos].[base_Equipamiento] (ID_EQUIPAMIENTO INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_EQUIPAMIENTO PRIMARY KEY
		                                  ,NOMBRE VARCHAR(100)  CONSTRAINT NN_EQUI_NOM NOT NULL
										  ,ESTADO BIT 
										  ,STOCK INT  CONSTRAINT NN_EQUI_STOCK NOT NULL
		                                    );
		PRINT 'TABLA EQUIPAMIENTO CREADA';
END
ELSE
	BEGIN

		PRINT 'TABLA  Equipamiento  NO CREADA, YA EXISTE EN LA BASE DE DATOS';

	END

GO
--CREANDO TABLA ASIGNACION_EQUIPAMIENTO

PRINT 'CREANDO TABLA ASIGNACION_EQUIPAMIENTO';

IF NOT EXISTS (SELECT 1 FROM  sys.objects WHERE object_id=object_id(N'[Equipamientos].[base_Asignacion_Equipamiento]')
			AND type in (N'U'))
			
BEGIN
		CREATE TABLE [Equipamientos].[base_Asignacion_Equipamiento] (ID_ASIGNACION INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_ASIGNACION_EQ PRIMARY KEY
		                                  ,ID_EQUIPAMIENTO INT CONSTRAINT FK_ASIG_EQUIP FOREIGN KEY(ID_EQUIPAMIENTO) REFERENCES Equipamientos.base_Equipamiento(ID_EQUIPAMIENTO)
										  ,ID_EMPLEADO INT CONSTRAINT FK_ASIG_EMPLEADO FOREIGN KEY(ID_EMPLEADO) REFERENCES Usuario.base_Empleado(ID_EMPLEADO)
										  ,CANTIDAD INT  CONSTRAINT NN_CANT_ASIG NOT NULL
										  ,FECHA_ASIG DATE CONSTRAINT NN_ASIG_FASI NOT NULL
										  );
		PRINT 'TABLA ASIGNACION_EQUIPAMIENTO CREADA';
END
ELSE
	BEGIN

		PRINT 'TABLA  Asignacion_Equipamiento  NO CREADA, YA EXISTE EN LA BASE DE DATOS';

	END

GO
--CREANDO TABLA EQUIPAMIENTO

PRINT 'CREANDO TABLA EQUIPAMIENTO_HIST';

IF NOT EXISTS (SELECT 1 FROM  sys.objects WHERE object_id=object_id(N'[Equipamientos].[base_Equipamiento_hist]')
			AND type in (N'U'))
			
BEGIN
		CREATE TABLE [Equipamientos].[base_Equipamiento_hist] (ID_EQUIPAMIENTO_HIST INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_EQUIPAMIENTO_HIST PRIMARY KEY
		                                  ,ID_EQUIPAMIENTO INT CONSTRAINT FK_EQUIP_EQHIS FOREIGN KEY(ID_EQUIPAMIENTO) REFERENCES Equipamientos.base_Equipamiento(ID_EQUIPAMIENTO)
										  ,NOMBRE VARCHAR(100)  CONSTRAINT NN_EQUIH_NOM NOT NULL
										  ,ESTADO BIT 
										  ,STOCK INT  CONSTRAINT NN_EQUIH_STOCK NOT NULL
										  ,CANTIDAD INT CONSTRAINT NN_EQUIH NOT NULL
										  ,ULTIMO BIT
		                                    );
		PRINT 'TABLA EQUIPAMIENTO_HIST CREADA';
END
ELSE
	BEGIN

		PRINT 'TABLA  Equipamiento_hist  NO CREADA, YA EXISTE EN LA BASE DE DATOS';

	END

GO