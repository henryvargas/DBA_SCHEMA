/*
*  Procedimiento Inserta Proyecto
*
*  Nombre          Fecha         Description
*  ---------------------------------------------------
* Julio Daviu  12/02/2019     Version inicial
*/
CREATE  PROCEDURE [Proyectos].INSERTA_PROYECTO
(
@NOMBRE VARCHAR(100),
@RESPONSABLE INT,
@CIUDAD VARCHAR(50),
@PROVINCIA VARCHAR(150),
@DIRECCION VARCHAR(150),
@MENSAJE VARCHAR(150) OUTPUT,
@ERROR VARCHAR(150) OUTPUT
)
AS

DECLARE @REVISA INT;

--INVOCACION A FUNCION EXTERNA QUE VALIDA SI EL PROYECTO ESTA CREADO

SET @REVISA=[Proyectos].[VALIDA_PROYECTO_CREADO]( @NOMBRE,@RESPONSABLE);

--VALIDACION DE CAMPOS INGRESADO
IF (@NOMBRE IS NOT NULL AND @RESPONSABLE IS NOT NULL 
	AND @CIUDAD IS NOT NULL AND @PROVINCIA IS NOT NULL
	AND @DIRECCION IS NOT NULL)
	AND @REVISA=0
	
	

	BEGIN
	
		--INSERCION DE DATOS EN TABLA PROYECTOS

		BEGIN
			INSERT INTO [Proyectos].[Proyecto]
					   ([NOMBRE]
					   ,[RESPONSABLE]
					   ,[CIUDAD]
					   ,[PROVINCIA]
					   ,[DIRECCION])
				 VALUES
					   (@NOMBRE
					   ,@RESPONSABLE
					   ,@CIUDAD
					   ,@PROVINCIA
					  ,@DIRECCION)

			SET  @MENSAJE='Registro Proeycto '+@NOMBRE+ ' Realizado' ;
			SET @ERROR=@@ERROR;
		END

	END
ELSE
	BEGIN
		SET @MENSAJE='Ingrese Todos los Datos, Revise proyecto ya creado ';
	END
GO