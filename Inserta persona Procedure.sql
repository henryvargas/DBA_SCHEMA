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







