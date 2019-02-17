/**********************************************************
*	Procedure Adiciona Organigrama 
*	Version Inicial
*
*	Nombre				Fecha				Descripcion
*	--------------------------------------------------------
*	Julio Daviu 		16-02-2019			Procedure addionna dependientes
*
*************************************************************/
CREATE PROCEDURE [Proyectos].ADD_ORGANIGRAMA
(
@ANTECESOR INT,
@SUCESOR INT,
@MENSAJE VARCHAR(150) OUTPUT,
@ERROR VARCHAR(150) OUTPUT
)
AS

	BEGIN
		--VARIABLE AUXILIAR CARGO
		DECLARE @OBT_ID_CARGO INT;

		--INVICACION A FUNCION OBTENCION DEL ID_CARGO
		SET @OBT_ID_CARGO=[Usuario].[OBTIENE_ID_CARGO](@ANTECESOR);

		--VALIDACION VARIABLES
		IF (@ANTECESOR  IS NOT NULL OR  @ANTECESOR IS NOT NULL) AND @OBT_ID_CARGO>0

			BEGIN
			
				
				--INSERCION DATOS
					BEGIN


								INSERT INTO [Proyectos].[Organigrama]
										   ([ID_CARGO]
										   ,[ANTECESOR]
										   ,[SUCESOR])
									 VALUES
										   (@OBT_ID_CARGO
										   ,@ANTECESOR
										   ,@SUCESOR);

						IF @@ROWCOUNT=1
						
							BEGIN
								SET @MENSAJE='Registro Realizado correctamente';
								set @ERROR='OK';
							END
						ELSE
							BEGIN
								ROLLBACK;
								SET  @MENSAJE='Transaccion no completada';
								SET  @ERROR='ROLLBACK';
							END

					END
				END
			ELSE
				--MANEJO DE EXCEPCIONES
				BEGIN

					SET @MENSAJE='Revise Datos ingresados ';

					SET @ERROR='COD_ERR 003';
				END

	END
GO