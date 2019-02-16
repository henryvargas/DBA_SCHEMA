/**********************************************************
*	Procedimiento Adiciona_empleado
*	Version Inicial
*
*	Nombre				Fecha				Descripcion
*	--------------------------------------------------------
*	Julio Daviu 		16-02-2019			Adiciona empleado
*
*************************************************************/
CREATE PROCEDURE [Usuario].ADICIONA_EMPLEADO
(
@NOMBRE_CARGO VARCHAR(50),
@CI VARCHAR(50),
@FECHA_CONTRATO DATE,
@GENERO VARCHAR(50),
@NRO_SEGURO VARCHAR(50),
@ESTADO_SEGURO BIT,
@MENSAJE VARCHAR(50) OUTPUT,
@ERROR  VARCHAR(50) OUTPUT
)
AS
BEGIN
	DECLARE @OBT_ID_CARGO INT;

	DECLARE @OBT_ID_PERSONA INT;

		--OBTIENE EL ID_CARGO CON BASE AL NOMBRE DEL CARGO

		SET @OBT_ID_CARGO=[Usuario].[OBTIENE_ID_CARGO](@NOMBRE_CARGO);

		--OBTIENE  EL ID_PERSONA CON BASE AL DOCUMENTO DE IDENTIDAD

		SET @OBT_ID_PERSONA=[Usuario].[OBTIENE_ID_PERSONA](@CI);


	--VALIDACION CONDICIONES PARA REALIZAR EL INSERT

	IF(@NOMBRE_CARGO IS NOT NULL
				AND @CI IS NOT NULL
				AND @FECHA_CONTRATO  IS NOT NULL
				AND @ESTADO_SEGURO IS NOT NULL) 
				AND @OBT_ID_CARGO>0
				AND @OBT_ID_PERSONA >0

				BEGIN
						
					INSERT INTO [Usuario].[Empleado]
							   ([ID_CARGO]
							   ,[ID_PERSONA]
							   ,[FECHA_CONTR]
							   ,[GENERO]
							   ,[NRO_SEGURO]
							   ,[ESTADO_SEGURO])
						 VALUES
							   (@OBT_ID_CARGO
							   ,@OBT_ID_PERSONA
							   ,@FECHA_CONTRATO
							   ,@GENERO
							   ,@NRO_SEGURO
							   ,@ESTADO_SEGURO)

							BEGIN

				
									IF @@ROWCOUNT >0

										SET @MENSAJE='Empleado registrado correctamente con documento'+ @CI;

										SET @ERROR=@@ERROR;
							END


				END

				

		ELSE
			 SET @MENSAJE='Parámetros incorrectos o vacios revise';
			 SET @ERROR='COD_ERRR 003';




END

GO