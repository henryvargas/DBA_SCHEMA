----------------------------------------------------------------------------------------------
---------------------------------------CREACION DE TABLAS-------------------------------------
-- CREANDO TABLA AUDITHISTORY


PRINT 'CREANDO TABLA AUDITHISTORY';

IF NOT EXISTS (SELECT 1 FROM  sys.objects WHERE object_id=object_id(N'[dbo].[AuditHistory]')
			AND type in (N'U'))

BEGIN
		CREATE TABLE [dbo].[AuditHistory]
		(
			[AuditHistoryId] INT IDENTITY(1,1) NOT NULL CONSTRAINT [PK_AuditHistory] PRIMARY KEY,
			[TableName]		 VARCHAR(50) NULL,
			[ColumnName]	 VARCHAR(50) NULL,
			[ID]             INT NULL,
			[Date]           DATETIME NULL,
			[Oldvalue]       VARCHAR(MAX) NULL,
			[NewValue]       VARCHAR(MAX) NULL
			--,
			--[ModifiedBy]     INT
		);

		PRINT 'TABLA AUDITHISTORY CREADA';
END
ELSE
	BEGIN

		PRINT 'TABLA AUDITHISTORY NO CREADA, YA EXISTE EN LA BASE DE DATOS';

	END

GO