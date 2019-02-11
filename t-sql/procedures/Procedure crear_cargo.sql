/**********************************************************
*	Procedure crear cargo
*	Version Inicial
*
*	Nombre				Fecha				Descripcion
*	--------------------------------------------------------
*	Julio Daviu 		10-02-2019			Procedimiento para crear cargo
*
*************************************************************/

CREATE PROCEDURE [Equipamientos].CREAR_CARGO
(
@NOMBRE VARCHAR(100),
@DESCRIPCION VARCHAR(200),
@MENSAJE VARCHAR(150) OUTPUT,
@ERROR VARCHAR(150) OUTPUT
)
AS

DECLARE @VALIDA INT;

--FUNCION VALIDA SI EL CARGO ESTA CREADO

SET @VALIDA= [Equipamientos].[VALIDA_CARGO_CREADO](@NOMBRE);

--VALIDA CONDICIONES PARA INSERTAR, CARGO NO DEBE ESTAR CREADO
	IF (@NOMBRE IS NOT NULL AND @DESCRIPCION IS NOT NULL AND @VALIDA=0)

		

			BEGIN
			--iNSERTA CARGO

					INSERT INTO [Equipamientos].[Cargo]
							   ([NOMBRE]
							   ,[DESCRIPCION])
						 VALUES
							   (@NOMBRE
							   ,@DESCRIPCION);

				-- VALIDA INSERCION DATOS
					IF @@ROWCOUNT=1 
					SET @MENSAJE='Cargo Registrado '+@NOMBRE;
					SET @ERROR ='OK';

			END

	ELSE
		-- CONDICION DATOS INCORRECTOS
		BEGIN
			SET @MENSAJE='Revise Incorrectos ó Cargo Creado';
			SET @ERROR=@@ERROR;

		END

GO

