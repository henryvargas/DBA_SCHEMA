USE [SGSO_RESCUE]
GO

INSERT INTO [Usuario].[Persona]
           ([NOMBRE]
           ,[APELLIDO]
           ,[CI]
           ,[EMAIL]
           ,[DIRECCION]
           ,[TELEFONO]
           ,[documento_identidad])
     VALUES
           ('CARLOS'
           ,'CAMACHO'
           ,'5188819'
           ,'beto8882@gmail.com'
           ,'G. Villarroel 2023'
           ,'79324048'
           ,'CI')
GO
-----------------------------------------------------

UPDATE [Usuario].[Persona]
   SET [NOMBRE] = 'ALBERTO'
      ,[APELLIDO] = 'SORIA'
      ,[CI] = '123456'
      ,[EMAIL] = 'a@a.com'
      ,[DIRECCION] = 'j.e molina'
      ,[TELEFONO] = '4255485'
      ,[documento_identidad] = '456'
 WHERE [ID_PERSONA] = 3
GO


