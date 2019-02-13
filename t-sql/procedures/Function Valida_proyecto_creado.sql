/*
*  Function  Inserta Valida Proyecto creado
*
*  Nombre          Fecha         Description
*  ---------------------------------------------------
* Julio Daviu  12/02/2019     Version inicial
*/
CREATE FUNCTION [Proyectos].VALIDA_PROYECTO_CREADO
(
@NOMBRE VARCHAR(100),
@RESPONSABLE INT
)
RETURNS INT
AS

BEGIN
	DECLARE @CONTADOR INT;
	DECLARE @REVISA INT;
		BEGIN

				BEGIN
					SELECT @CONTADOR=COUNT(1)
					FROM [Proyectos].Proyecto PP
					INNER JOIN [Usuario].Persona PR
					ON (PR.ID_PERSONA=PP.RESPONSABLE)
					WHERE PP.NOMBRE=@NOMBRE
					AND PP.RESPONSABLE=@RESPONSABLE;
				END


				IF @CONTADOR >0

					SET @REVISA=1
				ELSE
					SET @REVISA=0;


		END

		RETURN @REVISA;

END

