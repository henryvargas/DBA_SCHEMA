/*
*  Procedimiento obtiene Persona dato entrada documento identidad
*
*  Nombre          Fecha         Description
*  ---------------------------------------------------
* Julio Daviu  09/02/2019     Version inicial
*
*/
CREATE PROCEDURE Usuario.OBTIENE_PERSONA 
(	@DOC_DOCUMENTO_IDENTIDAD VARCHAR(50),
	@NOMBRE VARCHAR(50) OUTPUT,
	@APELLIDO VARCHAR(50) OUTPUT,
	@EMAIL VARCHAR(50) OUTPUT,
	@TELEFONO VARCHAR(50) OUTPUT,
	@MENSAJE VARCHAR(150) OUTPUT,
	@ERROR	VARCHAR(150) OUTPUT

)
AS 
	BEGIN
	IF (@DOC_DOCUMENTO_IDENTIDAD IS NOT NULL )
			BEGIN
				SELECT 
					@NOMBRE=PER.NOMBRE,
					@APELLIDO=PER.APELLIDO,
					@EMAIL=PER.EMAIL,
					@TELEFONO=PER.TELEFONO
				FROM USUARIO.PERSONA PER
				WHERE PER.documento_identidad=@DOC_DOCUMENTO_IDENTIDAD;

				SET @MENSAJE='FIN DATOS GENERADOS';
				SET @ERROR=@@ERROR;
			END 
		
	ELSE
		SET @MENSAJE='Ingrese el documento de Identidad'
		SET @ERROR=@@ERROR;
	END

GO
