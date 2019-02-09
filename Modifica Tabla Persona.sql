Alter table usuario.persona add documento_identidad varchar(50);

ALTER TABLE usuario.persona  
ADD CONSTRAINT UNIQ_PER_DOC UNIQUE(documento_identidad);



