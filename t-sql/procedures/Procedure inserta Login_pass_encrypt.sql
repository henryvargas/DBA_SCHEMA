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
@PASSWORD NVARCHAR(300),
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

		IF @ID_PERSONA >0

		BEGIN

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

					BEGIN
						DECLARE @RC_1 int
						DECLARE @DOCUMENTO varchar(50)
						DECLARE @USUARIO varchar(50)
						DECLARE @ID_LOGIN int
						DECLARE @MENSAJE_1 varchar(50)
						DECLARE @ERROR_1 varchar(50)


						SET @DOCUMENTO=@DOC_ENTIDAD_USER

						EXECUTE @RC_1 = [Usuario].[OBTIENE_LOGIN] 
						  @DOCUMENTO
						  ,@USARIO
						  ,@ID_LOGIN OUTPUT
						  ,@MENSAJE_1 OUTPUT
						  ,@ERROR_1 OUTPUT

						 SET  @MENSAJE_1='EL lOGUIN ES '+	 CONVERT (VARCHAR,@ID_LOGIN);

						 SET @MENSAJE=@MENSAJE_1;

						 SET @PASSWORD=ENCRYPTBYPASSPHRASE('Password-default', @PASSWORD)

						 BEGIN

									INSERT INTO [Usuario].[Password]
												([ID_LOGIN]
												,[PASS_ENCRYPT])
									 VALUES
												(@ID_LOGIN
												,@PASSWORD)




						 END

					END




				END



		END

			BEGIN
				IF (@ID_PERSONA IS NULL OR @ID_PERSONA=0 )

				PRINT 'Error Documento Identidad inexistente';
			END

	END

	
	ELSE
		BEGIN
			PRINT 'Algun valor nulo, Ingrese todos los campos';
		END

END
