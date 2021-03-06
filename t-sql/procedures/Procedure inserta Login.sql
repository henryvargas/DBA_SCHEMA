USE [SGSO_RESCUE]
GO
/*
*  Procedimiento Inserta LOGIN
*
*  Nombre          Fecha         Description
*  ---------------------------------------------------
* Julio Daviu  08/02/2019     Version inicial
* Julio Daviu  10/02/2019     Add pass encrypt 
*/

CREATE  PROCEDURE [Usuario].[INSERTA_LOGIN]
(
@DOC_ENTIDAD_USER VARCHAR(50),
@USARIO VARCHAR(50),
@ESTADO BIT,
@MENSAJE VARCHAR(150) OUTPUT,
@ERROR VARCHAR(150) OUTPUT
)
AS
BEGIN
	IF (@DOC_ENTIDAD_USER IS NOT NULL
		and @USARIO IS NOT NULL
		AND @ESTADO IS NOT NULL)
	--INVOCACION PROCEDIMIENTO EXTERNO
	BEGIN

		DECLARE @DOC_DOCUMENTO_IDENTIDAD varchar(50)
		DECLARE @NOMBRE varchar(50)
		DECLARE @APELLIDO varchar(50)
		DECLARE @EMAIL varchar(50)
		DECLARE @TELEFONO varchar(50)
		DECLARE @ID_PERSONA int
		DECLARE @RC int

		SET @DOC_DOCUMENTO_IDENTIDAD=@DOC_ENTIDAD_USER;

		--CAPTURANDO EL ID PERSONA CON BASE AL DOCUMENTO
		EXECUTE @RC = [Usuario].[OBTIENE_PERSONA] 
			 @DOC_DOCUMENTO_IDENTIDAD
			  ,@NOMBRE OUTPUT
			  ,@APELLIDO OUTPUT
			  ,@EMAIL OUTPUT
			  ,@TELEFONO OUTPUT
			  ,@ID_PERSONA OUTPUT
			  ,@MENSAJE OUTPUT
			  ,@ERROR OUTPUT
  
		

		--INSERTANDO DATOS EN TABLA LOGIN

		BEGIN
			

				INSERT INTO [Usuario].[Login]
						   ([ID_PERSONA]
						   ,[USUARIO]
						   ,[ESTADO])
				 VALUES
						   (@ID_PERSONA
						   ,@USARIO
						   ,@ESTADO);

			IF @@ROWCOUNT=1

				SET @MENSAJE= 'Registro de Loguin realizado '+ @USARIO+ ' DOCUMENTO '+@DOC_ENTIDAD_USER;
				SET @ERROR=@@ERROR;

		END

	END

	
	ELSE
		BEGIN
			PRINT 'Algun valor nulo, Ingrese todos los campos';
		END

END
GO
