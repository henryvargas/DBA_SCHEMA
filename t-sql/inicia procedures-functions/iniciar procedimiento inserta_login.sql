USE [SGSO_RESCUE]
GO

DECLARE @RC int
DECLARE @DOC_ENTIDAD_USER varchar(50)
DECLARE @USARIO varchar(50)
DECLARE @ESTADO BIT
DECLARE @PASSWORD NVARCHAR(300)
DECLARE @MENSAJE varchar(150)
DECLARE @ERROR varchar(150)

-- TODO: Set parameter values here.

EXECUTE @RC = [Usuario].[INSERTA_LOGIN] 
   '53068490'
  ,'jdaviu'
  ,1
  ,'PASSWORD01'
  ,@MENSAJE OUTPUT
  ,@ERROR OUTPUT

PRINT @MENSAJE;
PRINT @ERROR;
GO


Select * from usuario.login


select * from usuario.Password







