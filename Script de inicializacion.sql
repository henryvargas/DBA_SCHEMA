/**********************************************************
*	Create Databe SGSO_RESCUE
*	Creacci�n de tablas 
*	Version Inicial
*
*	Nombre				Fecha				Descripcion
*	--------------------------------------------------------
*	Julio Daviu			03-02-2019			Creacion Esquema (Proyectos, Usuario) Tablas (Proyecto, Persona, Login )
*   Miguel Claros       03-02-2019          Creacion Esquema (Incidentes), Tablas (Password, Incidente, Tipo_Accidente, Tipo_Lesion)
*
*
*************************************************************/
--CREATE DATABASE SGSO_RESCUE;
--GO
USE SGSO_RESCUE

GO

--CREANDO ESQUEMA PROEYCTOS

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

-- TABLA PROYECTO

PRINT 'CREANDO TABLA PROYECTO';

IF NOT EXISTS (SELECT 1 FROM  sys.objects WHERE object_id=object_id(N'[Proyectos].[Proyecto]')
			AND type in (N'U'))

BEGIN
		CREATE TABLE [Proyectos].Proyecto(ID_PROYECTO INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_PROYECTO PRIMARY KEY
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

--CREANDO TABLA PERSONA

PRINT 'CREANDO TABLA PERSONA';

IF NOT EXISTS (SELECT 1 FROM  sys.objects WHERE object_id=object_id(N'[Usuario].[Persona]')
			AND type in (N'U'))

BEGIN
		CREATE TABLE Usuario.Persona(ID_PERSONA INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_PERSONA PRIMARY KEY
									, NOMBRE VARCHAR(50)  CONSTRAINT NN_PER_NOM NOT NULL
									, APELLIDO VARCHAR(50) CONSTRAINT NN_PER_APE NOT NULL
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

IF NOT EXISTS (SELECT 1 FROM  sys.objects WHERE object_id=object_id(N'[Usuario].[Login]')
			AND type in (N'U'))

BEGIN
		CREATE TABLE Usuario.[Login](ID_LOGIN INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_LOGIN PRIMARY KEY
									 ,ID_PERSONA INT CONSTRAINT FK_PERSONA FOREIGN KEY(ID_PERSONA) REFERENCES Usuario.Persona(ID_PERSONA)
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

IF NOT EXISTS (SELECT 1 FROM  sys.objects WHERE object_id=object_id(N'[Usuario].[Password]')
			AND type in (N'U'))

BEGIN
		CREATE TABLE Usuario.[Password]( ID_PASS INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_PASSWORD PRIMARY KEY
		                                ,ID_LOGIN INT CONSTRAINT FK_LOGIN FOREIGN KEY(ID_LOGIN) REFERENCES Usuario.[Login](ID_LOGIN)
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
--CREANDO TABLA TIPO_ACCIDENTE

PRINT 'CREANDO TABLA TIPO_ACCIDENTE';

IF NOT EXISTS (SELECT 1 FROM  sys.objects WHERE object_id=object_id(N'[Incidentes].[Tipo_Accidente]')
			AND type in (N'U'))

BEGIN
		CREATE TABLE Incidentes.Tipo_Accidente( ID_TIPO_ACC INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_TIPO_ACCIDENTE PRIMARY KEY
		                                       ,NOMBRE VARCHAR(50)  CONSTRAINT NN_TIP_ACC_NOM NOT NULL
									          );

		PRINT 'TABLA Tipo_Accidente CREADA';
END
ELSE
	BEGIN

		PRINT 'TABLA  Tipo_Accidente  NO CREADA, YA EXISTE EN LA BASE DE DATOS';

	END

GO

--CREANDO TABLA INCIDENTE

PRINT 'CREANDO TABLA INCIDENTE';

IF NOT EXISTS (SELECT 1 FROM  sys.objects WHERE object_id=object_id(N'[Incidentes].[Incidente]')
			AND type in (N'U'))

BEGIN
		CREATE TABLE Incidentes.Incidente( ID_INCIDENTE INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_INCIDENTE PRIMARY KEY
		                                   ,ID_TIPO_ACC INT CONSTRAINT FK_TIP_ACC FOREIGN KEY(ID_TIPO_ACC) REFERENCES Incidentes.Tipo_Accidente(ID_TIPO_ACC)
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

--CREANDO TABLA TIPO_LESION

PRINT 'CREANDO TABLA TIPO_LESION';

IF NOT EXISTS (SELECT 1 FROM  sys.objects WHERE object_id=object_id(N'[Incidentes].[Tipo_Lesion]')
			AND type in (N'U'))
			
BEGIN
		CREATE TABLE Incidentes.Tipo_Lesion (ID_LESION INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_TIPO_LESION PRIMARY KEY
		                                     ,ID_INCIDENTE INT CONSTRAINT FK_ID_INC FOREIGN KEY(ID_INCIDENTE) REFERENCES Incidentes.Incidente(ID_INCIDENTE)
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
