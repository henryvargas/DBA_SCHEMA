/**********************************************************
*	funcion obtiene Cargo
*	Version Inicial
*
*	Nombre				Fecha				Descripcion
*	--------------------------------------------------------
*	Julio Daviu 		16-02-2019			Obtiene el id_cargo
*
*************************************************************/
CREATE FUNCTION USUARIO.OBTIENE_ID_CARGO
(
@NOMBRE VARCHAR(50)
)
RETURNS INT
AS

BEGIN
--Variable para capturar el id_cargo
DECLARE @ID_CARGO INT;

		BEGIN
			--obtención del id_cargo con base al Nombre del cargo

			SELECT @ID_CARGO=car.ID_CARGO
			FROM [Equipamientos].Cargo car
			WHERE car.NOMBRE=@NOMBRE;

		END

		RETURN @ID_CARGO;

END	

GO
