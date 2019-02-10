<<<<<<< HEAD
/*
*  Procedimiento Inserta Psersona
*
*  Nombre          Fecha         Description
*  ---------------------------------------------------
* Julio Daviu  08/02/2019     Version inicial
* JULIO dAVIU	09/02/2019	 Adcion columna Documento_identidad
*/

CREATE PROCEDURE USUARIO.INSERTA_PERSONA 
(
@NOMBRE VARCHAR(50),
@APELLIDO VARCHAR(50),
@EMAIL VARCHAR(80),
@DIRECCION VARCHAR(100),
@TELEFONO VARCHAR(50),
@MENSAJE VARCHAR(150) OUTPUT,
@ERROR VARCHAR(150) OUTPUT
)
AS

IF (@NOMBRE IS NOT NULL 
	AND @APELLIDO IS NOT NULL 
	AND @EMAIL IS NOT NULL 
	AND @DIRECCION IS NOT NULL 
	AND @TELEFONO IS NOT NULL)

	BEGIN

			

			BEGIN
				INSERT INTO [Usuario].[Persona]
						   ([NOMBRE]
						   ,[APELLIDO]
						   ,[EMAIL]
						   ,[DIRECCION]
						   ,[TELEFONO])
					 VALUES
						   (@NOMBRE
						   ,@APELLIDO
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

----CAMBIO 09-02-2018

/****** Object:  StoredProcedure [Usuario].[INSERTA_PERSONA]    Script Date: 09/02/2019 12:14:58 ******/
ALTER PROCEDURE [Usuario].[INSERTA_PERSONA] 
(
@NOMBRE VARCHAR(50),
@APELLIDO VARCHAR(50),
@EMAIL VARCHAR(80),
@DIRECCION VARCHAR(100),
@TELEFONO VARCHAR(50),
@DOC_ENTIDAD  VARCHAR(50),
@MENSAJE VARCHAR(150) OUTPUT,
@ERROR VARCHAR(150) OUTPUT
)
AS

IF (@NOMBRE IS NOT NULL 
	AND @APELLIDO IS NOT NULL 
	AND @EMAIL IS NOT NULL 
	AND @DIRECCION IS NOT NULL 
	AND @TELEFONO IS NOT NULL
	AND @DOC_ENTIDAD IS NOT NULL)

	BEGIN
			BEGIN
				INSERT INTO [Usuario].[Persona]
						   ([NOMBRE]
						   ,[APELLIDO]
						   ,[EMAIL]
						   ,[DIRECCION]
						   ,[TELEFONO]
						   ,[documento_identidad])
					 VALUES
						   (@NOMBRE
						   ,@APELLIDO
						   ,@EMAIL
						   ,@DIRECCION
						   ,@TELEFONO
						   ,@DOC_ENTIDAD)
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




=======
/*
*  Procedimiento Inserta Psersona
*
*  Nombre          Fecha         Description
*  ---------------------------------------------------
* Julio Daviu  08/02/2019     Version inicial
*/

CREATE PROCEDURE USUARIO.INSERTA_PERSONA 
(
@NOMBRE VARCHAR(50),
@APELLIDO VARCHAR(50),
@EMAIL VARCHAR(80),
@DIRECCION VARCHAR(100),
@TELEFONO VARCHAR(50),
@MENSAJE VARCHAR(150) OUTPUT,
@ERROR VARCHAR(150) OUTPUT
)
AS

IF (@NOMBRE IS NOT NULL 
	AND @APELLIDO IS NOT NULL 
	AND @EMAIL IS NOT NULL 
	AND @DIRECCION IS NOT NULL 
	AND @TELEFONO IS NOT NULL)

	BEGIN
			BEGIN
				INSERT INTO [Usuario].[Persona]
						   ([NOMBRE]
						   ,[APELLIDO]
						   ,[EMAIL]
						   ,[DIRECCION]
						   ,[TELEFONO])
					 VALUES
						   (@NOMBRE
						   ,@APELLIDO
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







>>>>>>> 49ed82336713eef3b89cc602d8dca4b1b7cdcf40
