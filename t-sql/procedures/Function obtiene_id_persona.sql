/**********************************************************
*	funcion obtiene id_persona
*	Version Inicial
*
*	Nombre				Fecha				Descripcion
*	--------------------------------------------------------
*	Julio Daviu 		16-02-2019			obtencion del id persona con el CI
*
*************************************************************/
CREATE FUNCTION [usuario].OBTIENE_ID_PERSONA
(@CI varchar(50))
RETURNS INT
AS
	BEGIN
	DECLARE @ID_PERSONA INT;

		BEGIN

			SELECT @ID_PERSONA=per.id_persona
			FROM [Usuario].Persona per
			WHERE per.documento_identidad=@CI;


		END

		RETURN @ID_PERSONA;
	END


GO