USE [SGSO_RESCUE_CODE];

-- Creacion del procedimiento almacenado INSERTA_PERSONA 
IF EXISTS (SELECT 1 FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[USUARIO].[INSERTA_PERSONA]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [USUARIO].[INSERTA_PERSONA]
END
GO
/*
*  Creacion procedimiento para la insercion de datos en la tabla persona
*
*  Nombre          Fecha         Description
*  ---------------------------------------------------
* Jorge F. Flores 17/02/2019     Version inicial
* 
*/

CREATE PROCEDURE [USUARIO].[INSERTA_PERSONA]
(
@NOMBRE VARCHAR(50),
@APELLIDO VARCHAR(50),
@DOCUMENTO_IDENTIDAD VARCHAR(50),
@EMAIL VARCHAR(80),
@DIRECCION VARCHAR(100),
@TELEFONO VARCHAR(50),
@MENSAJE VARCHAR(150) OUTPUT,
@ERROR VARCHAR(150) OUTPUT
)
AS

IF (@NOMBRE IS NOT NULL 
	AND @APELLIDO IS NOT NULL 
	AND @DOCUMENTO_IDENTIDAD IS NOT NULL
	AND @EMAIL IS NOT NULL 
	AND @DIRECCION IS NOT NULL 
	AND @TELEFONO IS NOT NULL)

	BEGIN

			

			BEGIN
				INSERT INTO [Usuario].[Persona]
						   ([NOMBRE]
						   ,[APELLIDO]
						   ,[DOCUMENTO_IDENTIDAD]
						   ,[EMAIL]
						   ,[DIRECCION]
						   ,[TELEFONO])
					 VALUES
						   (@NOMBRE
						   ,@APELLIDO
						   ,@DOCUMENTO_IDENTIDAD
						   ,@EMAIL
						   ,@DIRECCION
						   ,@TELEFONO)
			END
				
			BEGIN
				IF @@ROWCOUNT=1 

					SET @MENSAJE ='Se Registro la persona';
					set @ERROR ='OK';

					PRINT @MENSAJE +' '+@error;	
				
			END
				
	END
ELSE 
		BEGIN
			SET	@MENSAJE ='Revise campos nulos';
			SET @ERROR ='COD ERR 001';

			PRINT @MENSAJE +' '+@error;	
		END 

GO
GRANT EXECUTE ON OBJECT::[USUARIO].[INSERTA_PERSONA] TO [MyService_rescue] AS [USUARIO];
GO

PRINT 'Procedimiento [USUARIO].[INSERTA_PERSONA] creado ';

go

-- Creacion del procedimiento almacenado UPDATE_PERSONA 
IF EXISTS (SELECT 1 FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[USUARIO].[UPDATE_PERSONA]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [USUARIO].[UPDATE_PERSONA]
END
GO
/*
*  Creacion procedimiento para la actualizacion de datos en la tabla persona
*
*  Nombre          Fecha         Description
*  ---------------------------------------------------
* Jorge F. Flores 17/02/2019     Version inicial
* 
*/
CREATE PROCEDURE [USUARIO].[UPDATE_PERSONA]
(
@ID_PERSONA INT,
@NOMBRE VARCHAR(50),
@APELLIDO VARCHAR(50),
@DOCUMENTO_IDENTIDAD VARCHAR(50),
@EMAIL VARCHAR(80),
@DIRECCION VARCHAR(100),
@TELEFONO VARCHAR(50),
@MENSAJE VARCHAR(150) OUTPUT,
@ERROR VARCHAR(150) OUTPUT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE Persona
	SET NOMBRE=@NOMBRE
	   ,APELLIDO=@APELLIDO
	   ,DOCUMENTO_IDENTIDAD=@DOCUMENTO_IDENTIDAD
       ,EMAIL=@EMAIL
       ,DIRECCION=@DIRECCION
       ,TELEFONO=@TELEFONO
END
GO
GRANT EXECUTE ON OBJECT::[USUARIO].[UPDATE_PERSONA] TO [MyService_rescue] AS [USUARIO];
GO

PRINT 'Procedimiento [USUARIO].[UPDATE_PERSONA] creado ';

go
-- Creacion del procedimiento almacenado DELETE_PERSONA 
IF EXISTS (SELECT 1 FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[USUARIO].[DELETE_PERSONA]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [USUARIO].[DELETE_PERSONA]
END
GO
/*
*  Creacion procedimiento para borrar registros en la tabla persona
*
*  Nombre          Fecha         Description
*  ---------------------------------------------------
* Jorge F. Flores 17/02/2019     Version inicial
* 
*/
CREATE PROCEDURE [USUARIO].[DELETE_PERSONA]
(
	@ID_PERSONA INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM Persona
	WHERE ID_PERSONA = @ID_PERSONA;
END
GO

GRANT EXECUTE ON OBJECT::[USUARIO].[DELETE_PERSONA] TO [MyService_rescue] AS [USUARIO];
GO

PRINT 'Procedimiento [USUARIO].[DELETE_PERSONA] creado ';

go

-- Creacion del procedimiento almacenado INSERTA_EMPLEADO
IF EXISTS (SELECT 1 FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[USUARIO].[INSERTA_EMPLEADO]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [USUARIO].[INSERTA_EMPLEADO]
END
GO
/*
*  Creacion procedimiento para la insercion de datos en la tabla EMPLEADO
*
*  Nombre          Fecha         Description
*  ---------------------------------------------------
* Jorge F. Flores 17/02/2019     Version inicial
* 
*/
CREATE PROCEDURE [Usuario].INSERTA_EMPLEADO
(
@NOMBRE_CARGO VARCHAR(50),
@CI VARCHAR(50),
@FECHA_CONTRATO DATE,
@GENERO VARCHAR(50),
@NRO_SEGURO VARCHAR(50),
@ESTADO_SEGURO BIT,
@MENSAJE VARCHAR(50) OUTPUT,
@ERROR  VARCHAR(50) OUTPUT
)
AS
BEGIN
	DECLARE @OBT_ID_CARGO INT;

	DECLARE @OBT_ID_PERSONA INT;

		--OBTIENE EL ID_CARGO CON BASE AL NOMBRE DEL CARGO

		SET @OBT_ID_CARGO=[Usuario].[OBTIENE_ID_CARGO](@NOMBRE_CARGO);

		--OBTIENE  EL ID_PERSONA CON BASE AL DOCUMENTO DE IDENTIDAD

		SET @OBT_ID_PERSONA=[Usuario].[OBTIENE_ID_PERSONA](@CI);


	--VALIDACION CONDICIONES PARA REALIZAR EL INSERT

	IF(@NOMBRE_CARGO IS NOT NULL
				AND @CI IS NOT NULL
				AND @FECHA_CONTRATO  IS NOT NULL
				AND @ESTADO_SEGURO IS NOT NULL) 
				AND @OBT_ID_CARGO>0
				AND @OBT_ID_PERSONA >0

				BEGIN
						
					INSERT INTO [Usuario].[Empleado]
							   ([ID_CARGO]
							   ,[ID_PERSONA]
							   ,[FECHA_CONTR]
							   ,[GENERO]
							   ,[NRO_SEGURO]
							   ,[ESTADO_SEGURO])
						 VALUES
							   (@OBT_ID_CARGO
							   ,@OBT_ID_PERSONA
							   ,@FECHA_CONTRATO
							   ,@GENERO
							   ,@NRO_SEGURO
							   ,@ESTADO_SEGURO)

							BEGIN

				
									IF @@ROWCOUNT >0

										SET @MENSAJE='Empleado registrado correctamente con documento'+ @CI;

										SET @ERROR=@@ERROR;
							END


				END

				

		ELSE
			 SET @MENSAJE='Parámetros incorrectos o vacios revise';
			 SET @ERROR='COD_ERRR 003';




END

GO

GRANT EXECUTE ON OBJECT::[USUARIO].[INSERTA_EMPLEADO] TO [MyService_rescue] AS [USUARIO];
GO

PRINT 'Procedimiento [USUARIO].[INSERTA_EMPLEADO] creado ';

GO

-- Creacion del procedimiento almacenado UPDATE_EMPLEADO 
IF EXISTS (SELECT 1 FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[USUARIO].[UPDATE_EMPLEADO]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [USUARIO].[UPDATE_EMPLEADO]
END
GO
/*
*  Creacion procedimiento para la actualizacion de datos en la tabla persona
*
*  Nombre          Fecha         Description
*  ---------------------------------------------------
* Jorge F. Flores 17/02/2019     Version inicial
* 
*/
CREATE PROCEDURE [USUARIO].[UPDATE_EMPLEADO]
(
@ID_EMPLEADO INT,
@ID_CARGO INT,
@ID_PERSONA INT,
@FECHA_CONTRATO DATE,
@GENERO VARCHAR(50),
@NRO_SEGURO VARCHAR(50),
@ESTADO_SEGURO BIT,
@MENSAJE VARCHAR(50) OUTPUT,
@ERROR  VARCHAR(50) OUTPUT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE Empleado
	SET 
	    ID_CARGO=@ID_CARGO
	   ,ID_PERSONA=@ID_PERSONA
	   ,FECHA_CONTRATO=@FECHA_CONTRATO
       ,GENERO=@GENERO
       ,NRO_SEGURO=@NRO_SEGURO
       ,ESTADO_SEGURO=@ESTADO_SEGURO
END
GO
GRANT EXECUTE ON OBJECT::[USUARIO].[UPDATE_EMPLEADO] TO [MyService_rescue] AS [USUARIO];
GO

PRINT 'Procedimiento [USUARIO].[UPDATE_EMPLEADO] creado ';

GO

-- Creacion del procedimiento almacenado DELETE_EMPLEADO
IF EXISTS (SELECT 1 FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[USUARIO].[DELETE_EMPLEADO]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [USUARIO].[DELETE_EMPLEADO]
END
GO
/*
*  Creacion procedimiento para borrar registros en la tabla EMPLEADO
*
*  Nombre          Fecha         Description
*  ---------------------------------------------------
* Jorge F. Flores 17/02/2019     Version inicial
* 
*/
CREATE PROCEDURE [USUARIO].[DELETE_EMPLEADO]
(
	@ID_EMPLEADO INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM Empleado
	WHERE ID_EMPLEADO = @ID_EMPLEADO;
END
GO

GRANT EXECUTE ON OBJECT::[USUARIO].[DELETE_EMPLEADO] TO [MyService_rescue] AS [USUARIO];
GO

PRINT 'Procedimiento [USUARIO].[DELETE_EMPLEADO] creado ';

GO
-- Creacion del procedimiento almacenado GET_EMPLEADO
IF EXISTS (SELECT 1 FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[USUARIO].[GET_EMPLEADO]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [USUARIO].[GET_EMPLEADO]
END
GO
/*
*  Creacion procedimiento para mostar un registros en la tabla EMPLEADO
*
*  Nombre          Fecha         Description
*  ---------------------------------------------------
* Jorge F. Flores 17/02/2019     Version inicial
* 
*/
CREATE PROCEDURE [USUARIO].[GET_EMPLEADO]
(
	@ID_EMPLEADO INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

SELECT [ID_EMPLEADO]
      ,[ID_CARGO]
      ,[ID_PERSONA]
      ,[FECHA_CONTR]
      ,[GENERO]
      ,[NRO_SEGURO]
      ,[ESTADO_SEGURO]
  FROM [Usuario].[Empleado]
  WHERE ID_EMPLEADO= @ID_EMPLEADO
END
GO

GRANT EXECUTE ON OBJECT::[USUARIO].[GET_EMPLEADO] TO [MyReporting_rescue] AS [USUARIO];
GO

PRINT 'Procedimiento [USUARIO].[GET_EMPLEADO] creado ';

GO
