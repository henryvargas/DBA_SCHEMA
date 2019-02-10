ALTER TABLE [Usuario].[Password] ALTER COLUMN [PASS_ENCRYPT] Nvarchar(300)  ;

ALTER TABLE usuario.password  
ADD CONSTRAINT UNIQ_PASS_ID_LOG UNIQUE(id_login);

