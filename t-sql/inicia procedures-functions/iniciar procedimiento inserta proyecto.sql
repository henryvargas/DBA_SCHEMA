USE [SGSO_RESCUE]
GO

DECLARE @RC int
DECLARE @NOMBRE varchar(100)
DECLARE @RESPONSABLE int
DECLARE @CIUDAD varchar(50)
DECLARE @PROVINCIA varchar(150)
DECLARE @DIRECCION varchar(150)
DECLARE @MENSAJE varchar(150)
DECLARE @ERROR varchar(150)

-- TODO: Set parameter values here.

EXECUTE @RC = [Proyectos].[INSERTA_PROYECTO] 
   'GESTION Y SEGUIMIENTO PROYECTOS'
  ,1
  ,'LA PAZ'
  ,'CENTRAL'
  ,'CAPITAN RAVELO'
  ,@MENSAJE OUTPUT
  ,@ERROR OUTPUT

  PRINT @MENSAJE;
  PRINT @ERROR;
GO




