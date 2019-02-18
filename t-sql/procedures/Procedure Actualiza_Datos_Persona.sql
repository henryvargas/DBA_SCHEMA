/**********************************************************
*	Actualiza Datos Persona
*	Version Inicial
*
*	Nombre				Fecha				Descripcion
*	--------------------------------------------------------
*	Julio Daviu 		17-02-2019			Procedure actualiza datos persona
*
*************************************************************/
CREATE PROCEDURE [Usuario].ACTUALIZA_PERSONA
(
--VARIABLE OBLIGATORIA 
@CI_ORIG VARCHAR(50),
--VARIABLES DE CAMBIO
@NOMBRE VARCHAR(50),
@APELLIDO VARCHAR(50),
@EMAIL VARCHAR(50),
@DIRECCION VARCHAR(100),
@TELEFONO VARCHAR(50),
@CI VARCHAR(50),
--VARIABLES DE SALIDA
@MENSAJE VARCHAR(150) OUTPUT,
@ERROR VARCHAR(150) OUTPUT
)
AS
BEGIN

	IF @CI_ORIG IS NOT NULL

		BEGIN
				--VARIABLE AUXILIAR OBTENCION ID PERSONA

				DECLARE @OBT_PERSONA INT;

				--ASIGNACION A FUNCION OBTIENE ID_PERSONA CON EL CI
				SET @OBT_PERSONA=[Usuario].[OBTIENE_ID_PERSONA](@CI_ORIG);

			BEGIN
				IF @NOMBRE IS NOT NULL

					BEGIN


							BEGIN

									UPDATE [Usuario].[Persona] 
									   SET nombre=@NOMBRE
									 WHERE id_persona=@OBT_PERSONA;


									 	IF @@ROWCOUNT>1
											BEGIN
												SET @MENSAJE='SE actualizado el id_persona '
													+convert(varchar,@OBT_PERSONA)
													+'Campo Nombre a '+@NOMBRE;

												SET @ERROR='OK';
											
												PRINT @MENSAJE;
												PRINT @ERROR;
											END

							END

						


					END

				 ELSE IF @APELLIDO IS NOT NULL

					BEGIN


							BEGIN

									UPDATE [Usuario].[Persona] 
									   SET APELLIDO=@APELLIDO
									 WHERE id_persona=@OBT_PERSONA;


									 	IF @@ROWCOUNT>1
											BEGIN
												SET @MENSAJE='Se actualizado el id_persona '
													+convert(varchar,@OBT_PERSONA)
													+'Campo Apellido a '+@APELLIDO;

												SET @ERROR='OK';
											
												PRINT @MENSAJE;
												PRINT @ERROR;
											END

							END

					END
				ELSE IF @EMAIL IS NOT NULL

					BEGIN


							BEGIN

									UPDATE [Usuario].[Persona] 
									   SET EMAIL=@EMAIL
									 WHERE id_persona=@OBT_PERSONA;


									 	IF @@ROWCOUNT>1
											BEGIN
												SET @MENSAJE='Se actualizado el id_persona '
													+convert(varchar,@OBT_PERSONA)
													+'Campo Email a '+@EMAIL;

												SET @ERROR='OK';
											
												PRINT @MENSAJE;
												PRINT @ERROR;
											END

							END

					END

				ELSE IF @DIRECCION IS NOT NULL 

					BEGIN

							BEGIN

									UPDATE [Usuario].[Persona] 
									   SET DIRECCION=@DIRECCION
									 WHERE id_persona=@OBT_PERSONA;


									 	IF @@ROWCOUNT>1
											BEGIN
												SET @MENSAJE='Se actualizado el id_persona '
													+convert(varchar,@OBT_PERSONA)
													+'Campo Direccion a '+@DIRECCION;

												SET @ERROR='OK';
											
												PRINT @MENSAJE;
												PRINT @ERROR;
											END

							END

					END

				ELSE IF @TELEFONO IS NOT NULL

					BEGIN

							BEGIN

									UPDATE [Usuario].[Persona] 
									   SET TELEFONO=@TELEFONO
									 WHERE id_persona=@OBT_PERSONA;


									 	IF @@ROWCOUNT>1
											BEGIN
												SET @MENSAJE='Se actualizado el id_persona '
													+convert(varchar,@OBT_PERSONA)
													+'Campo Telefono a '+@TELEFONO;

												SET @ERROR='OK';
											
												PRINT @MENSAJE;
												PRINT @ERROR;
											END

							END

					END
	 
				 ELSE IF @CI IS NOT NULL


					BEGIN
							BEGIN

									UPDATE [Usuario].[Persona] 
									   SET documento_identidad=@TELEFONO
									 WHERE id_persona=@OBT_PERSONA;


									 	IF @@ROWCOUNT>1
											BEGIN
												SET @MENSAJE='Se actualizado el id_persona '
													+convert(varchar,@OBT_PERSONA)
													+'Campo Documento Identidad a '+@CI;

												SET @ERROR='OK';
											
												PRINT @MENSAJE;
												PRINT @ERROR;
											END

							END

					END
				 ELSE

					BEGIN

						SET @MENSAJE='Revise los Datos Ingresados vacios';
						SET @ERROR='COD-ERR003';


					END

			END
		END

	ELSE
			BEGIN
				SET @MENSAJE='Revise @CI_ORIG Obligatorio';
			END
	END 
GO