/**********************************************************
*	Encriptacion Y datos login 
*	Version Inicial
*
*	Nombre				Fecha				Descripcion
*	--------------------------------------------------------
*	Henry Vargas 		10-02-2019			Inicializacion de datos login, Password y encriptacion
*
*************************************************************/
USE SGSO_RESCUE;

SET XACT_ABORT ON;
SET NOCOUNT ON;

BEGIN TRANSACTION;
PRINT 'Modificar columana Pass_Encrypt...';
ALTER TABLE [Usuario].[Password] DROP COLUMN [PASS_ENCRYPT]
GO
ALTER TABLE [Usuario].[Password]  ADD [PASS_ENCRYPT] varbinary(MAX) NULL ;
PRINT 'Insert data into the Login table...';
INSERT INTO [Usuario].[Login]([ID_PERSONA],[USUARIO],[ESTADO])
	 VALUES((SELECT ID_PERSONA FROM [SGSO_RESCUE].[Usuario].[Persona] Where DOCUMENTO_IDENTIDAD='2640397')
	       ,(SELECT  SUBSTRING([NOMBRE], 1, 1)+''+[APELLIDO] FROM [SGSO_RESCUE].[Usuario].[Persona] Where DOCUMENTO_IDENTIDAD='2640397')
		   ,1),
		   ((SELECT ID_PERSONA FROM [SGSO_RESCUE].[Usuario].[Persona] Where DOCUMENTO_IDENTIDAD='5872275')
	       ,(SELECT  SUBSTRING([NOMBRE], 1, 1)+''+[APELLIDO] FROM [SGSO_RESCUE].[Usuario].[Persona] Where DOCUMENTO_IDENTIDAD='5872275')
		   ,1),
		   ((SELECT ID_PERSONA FROM [SGSO_RESCUE].[Usuario].[Persona] Where DOCUMENTO_IDENTIDAD='1893253')
	       ,(SELECT  SUBSTRING([NOMBRE], 1, 1)+''+[APELLIDO] FROM [SGSO_RESCUE].[Usuario].[Persona] Where DOCUMENTO_IDENTIDAD='1893253')
		   ,1),
		   ((SELECT ID_PERSONA FROM [SGSO_RESCUE].[Usuario].[Persona] Where DOCUMENTO_IDENTIDAD='2160353')
	       ,(SELECT  SUBSTRING([NOMBRE], 1, 1)+''+[APELLIDO] FROM [SGSO_RESCUE].[Usuario].[Persona] Where DOCUMENTO_IDENTIDAD='2160353')
		   ,1),
		   ((SELECT ID_PERSONA FROM [SGSO_RESCUE].[Usuario].[Persona] Where DOCUMENTO_IDENTIDAD='7250444')
	       ,(SELECT  SUBSTRING([NOMBRE], 1, 1)+''+[APELLIDO] FROM [SGSO_RESCUE].[Usuario].[Persona] Where DOCUMENTO_IDENTIDAD='7250444')
		   ,1),
		   ((SELECT ID_PERSONA FROM [SGSO_RESCUE].[Usuario].[Persona] Where DOCUMENTO_IDENTIDAD='1350617')
	       ,(SELECT  SUBSTRING([NOMBRE], 1, 1)+''+[APELLIDO] FROM [SGSO_RESCUE].[Usuario].[Persona] Where DOCUMENTO_IDENTIDAD='1350617')
		   ,1),
		   ((SELECT ID_PERSONA FROM [SGSO_RESCUE].[Usuario].[Persona] Where DOCUMENTO_IDENTIDAD='7519471')
	       ,(SELECT  SUBSTRING([NOMBRE], 1, 1)+''+[APELLIDO] FROM [SGSO_RESCUE].[Usuario].[Persona] Where DOCUMENTO_IDENTIDAD='7519471')
		   ,1),
		   ((SELECT ID_PERSONA FROM [SGSO_RESCUE].[Usuario].[Persona] Where DOCUMENTO_IDENTIDAD='6389963')
	       ,(SELECT  SUBSTRING([NOMBRE], 1, 1)+''+[APELLIDO] FROM [SGSO_RESCUE].[Usuario].[Persona] Where DOCUMENTO_IDENTIDAD='6389963')
		   ,1),
		   ((SELECT ID_PERSONA FROM [SGSO_RESCUE].[Usuario].[Persona] Where DOCUMENTO_IDENTIDAD='8201910')
	       ,(SELECT  SUBSTRING([NOMBRE], 1, 1)+''+[APELLIDO] FROM [SGSO_RESCUE].[Usuario].[Persona] Where DOCUMENTO_IDENTIDAD='8201910')
		   ,1),
		   ((SELECT ID_PERSONA FROM [SGSO_RESCUE].[Usuario].[Persona] Where DOCUMENTO_IDENTIDAD='1153097')
	       ,(SELECT  SUBSTRING([NOMBRE], 1, 1)+''+[APELLIDO] FROM [SGSO_RESCUE].[Usuario].[Persona] Where DOCUMENTO_IDENTIDAD='1153097')
		   ,1),
		   ((SELECT ID_PERSONA FROM [SGSO_RESCUE].[Usuario].[Persona] Where DOCUMENTO_IDENTIDAD='8491776')
	       ,(SELECT  SUBSTRING([NOMBRE], 1, 1)+''+[APELLIDO] FROM [SGSO_RESCUE].[Usuario].[Persona] Where DOCUMENTO_IDENTIDAD='8491776')
		   ,1),
		   ((SELECT ID_PERSONA FROM [SGSO_RESCUE].[Usuario].[Persona] Where DOCUMENTO_IDENTIDAD='5681246')
	       ,(SELECT  SUBSTRING([NOMBRE], 1, 1)+''+[APELLIDO] FROM [SGSO_RESCUE].[Usuario].[Persona] Where DOCUMENTO_IDENTIDAD='5681246')
		   ,1),
		   ((SELECT ID_PERSONA FROM [SGSO_RESCUE].[Usuario].[Persona] Where DOCUMENTO_IDENTIDAD='3712493')
	       ,(SELECT  SUBSTRING([NOMBRE], 1, 1)+''+[APELLIDO] FROM [SGSO_RESCUE].[Usuario].[Persona] Where DOCUMENTO_IDENTIDAD='3712493')
		   ,1),
		   ((SELECT ID_PERSONA FROM [SGSO_RESCUE].[Usuario].[Persona] Where DOCUMENTO_IDENTIDAD='8670416')
	       ,(SELECT  SUBSTRING([NOMBRE], 1, 1)+''+[APELLIDO] FROM [SGSO_RESCUE].[Usuario].[Persona] Where DOCUMENTO_IDENTIDAD='8670416')
		   ,1),
		   ((SELECT ID_PERSONA FROM [SGSO_RESCUE].[Usuario].[Persona] Where DOCUMENTO_IDENTIDAD='6497038')
	       ,(SELECT  SUBSTRING([NOMBRE], 1, 1)+''+[APELLIDO] FROM [SGSO_RESCUE].[Usuario].[Persona] Where DOCUMENTO_IDENTIDAD='6497038')
		   ,1);
PRINT 'Finish into the Login table...';
GO
--COMMIT TRANSACTION;
	 
--BEGIN TRANSACTION;

/* 
 *Esta orden tiene que arrojar algo. Si no fuese el caso no se puede encriptar informacion en esta base de datos. Para activar este servicio ver esta pagina 
 *Asumiendo que el servicio esta funcionando vamos a proceder con la creacion de una clave
 * Crear una clave  
 */
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'CLAVE_SGSP'; 
PRINT 'CREATE MASTER KEY ENCRYPTION BY PASSWORD ...';
/*
 *Es importante tomar nota de esta clave.
 *Luego crear el certificado
 *Crear certificado 
 */
CREATE CERTIFICATE Certificado WITH SUBJECT = 'Proteccion_Datos'; 
PRINT 'CREATE CERTIFICATE...';
--Y ahora se crea la clave simetrica
CREATE SYMMETRIC KEY Clave1   WITH ALGORITHM = AES_128   ENCRYPTION BY CERTIFICATE Certificado; 
PRINT 'CREATE SYMMETRIC KEY table...';
--modify the column Password
/*
 * Encriptar los datos
 * Y ahora se encriptan los datos de la nueva columna
 * Encriptar los datos  
 * Abrir la clave Clave1 
 */

OPEN SYMMETRIC KEY Clave1 DECRYPTION BY CERTIFICATE Certificado;

PRINT 'Insertar Valor Emcriptado...';
INSERT INTO [Usuario].[Password] ([ID_LOGIN], [PASS_ENCRYPT]) 
VALUES ((select [ID_LOGIN] from [Usuario].[Login] where USUARIO='KGuerrero')
         , EncryptByKey( Key_GUID('Clave1'), CONVERT(varchar,'11222331-K') ) ),
		 ((select [ID_LOGIN] from [Usuario].[Login] where USUARIO='DSandoval')
         , EncryptByKey( Key_GUID('Clave1'), CONVERT(varchar,'11222332-K') ) ),
		 ((select [ID_LOGIN] from [Usuario].[Login] where USUARIO='MAlvarado')
         , EncryptByKey( Key_GUID('Clave1'), CONVERT(varchar,'11222333-K') ) ),
		 ((select [ID_LOGIN] from [Usuario].[Login] where USUARIO='MGonzález')
         , EncryptByKey( Key_GUID('Clave1'), CONVERT(varchar,'11222334-K') ) ),
		 ((select [ID_LOGIN] from [Usuario].[Login] where USUARIO='LPérez')
         , EncryptByKey( Key_GUID('Clave1'), CONVERT(varchar,'11222335-K') ) ),
		 ((select [ID_LOGIN] from [Usuario].[Login] where USUARIO='JFernández')
         , EncryptByKey( Key_GUID('Clave1'), CONVERT(varchar,'11222336-K') ) ),
		 ((select [ID_LOGIN] from [Usuario].[Login] where USUARIO='BGutiérrez')
         , EncryptByKey( Key_GUID('Clave1'), CONVERT(varchar,'11222337-K') ) ),
		 ((select [ID_LOGIN] from [Usuario].[Login] where USUARIO='BGarcía')
         , EncryptByKey( Key_GUID('Clave1'), CONVERT(varchar,'11222338-K') ) ),
		 ((select [ID_LOGIN] from [Usuario].[Login] where USUARIO='KSaavedra')
         , EncryptByKey( Key_GUID('Clave1'), CONVERT(varchar,'11222339-K') ) ),
		 ((select [ID_LOGIN] from [Usuario].[Login] where USUARIO='OPizarro')
         , EncryptByKey( Key_GUID('Clave1'), CONVERT(varchar,'11222008-K') ) ),
		 ((select [ID_LOGIN] from [Usuario].[Login] where USUARIO='SBravo')
         , EncryptByKey( Key_GUID('Clave1'), CONVERT(varchar,'11222778-K') ) );     

-- Cerrar la clave 
CLOSE SYMMETRIC KEY Clave1; 
GO
COMMIT TRANSACTION;

