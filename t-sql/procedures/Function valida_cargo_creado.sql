/**********************************************************
*	Funcion valida_cargo_creado
*	Version Inicial
*
*	Nombre				Fecha				Descripcion
*	--------------------------------------------------------
*	Julio Daviu 		10-02-2019			Version Inicial
*
*************************************************************/


CREATE FUNCTION [equipamientos].VALIDA_CARGO_CREADO
(
@CARGO VARCHAR(150)
)
RETURNS INT
AS
	BEGIN
		DECLARE @CONTADOR INT;

		BEGIN
			
			SELECT @CONTADOR=COUNT(1)
			FROM equipamientos.Cargo car
			where car.NOMBRE=@CARGO; 


		END

		return @contador;

	END
GO