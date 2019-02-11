USE [SGSO_RESCUE]
GO

DECLARE @RC int
DECLARE @NOMBRE varchar(100)
DECLARE @DESCRIPCION varchar(200)
DECLARE @MENSAJE varchar(150)
DECLARE @ERROR varchar(150)

-- TODO: Set parameter values here.

EXECUTE @RC = [Equipamientos].[CREAR_CARGO] 
   'Gerente General'
  ,'Cargo Principal sin dependientes'
  ,@MENSAJE OUTPUT
  ,@ERROR OUTPUT

  print @MENSAJE;
  print @ERROR;
GO








