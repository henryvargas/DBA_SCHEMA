/**********************************************************
*	Procedimiento Obtiene Login 
*	Version Inicial
*
*	Nombre				Fecha				Descripcion
*	--------------------------------------------------------
*	Julio Daviu 		10-02-2019			Version Inicial
*
*************************************************************/

CREATE PROCEDURE [Usuario].[OBTIENE_LOGIN]
(
@DOCUMENTO VARCHAR(50),
@USUARIO VARCHAR(50),
@ID_LOGIN INT OUTPUT,
@MENSAJE VARCHAR(50) OUTPUT,
@ERROR VARCHAR(50) OUTPUT
)
AS 
DECLARE @EXISTE INT;

	BEGIN
		SELECT 
			@EXISTE=LG.ID_LOGIN
		FROM Usuario.[Login] lg
		INNER JOIN Usuario.[Persona] per
		on (lg.ID_PERSONA=per.ID_PERSONA)
		where per.documento_identidad=@DOCUMENTO;
	END

	SET @ID_LOGIN=@EXISTE;

	
		BEGIN
		IF @ID_LOGIN IS NOT NULL

			SET @MENSAJE= 'El id loguin para el '+@USUARIO+' es '+convert(varchar,@ID_LOGIN);
			SET @ERROR='OK';
		
		END
		
		
	




