/******************************************************************************
**  Name: TG_PersonA(Audit)_InsertUpdate
**  Desc: Audit History for Persona table - documento_identidad
** 
**  Called by: Portal
**
**  Author: Carlos Camacho
**
**  Date: 02/09/2019
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 02/09/2019 Carlos Camacho   Initial version - Trigger for Audit Persona - documento_identidad
*******************************************************************************/


/*****************************************************************************
PERSONA - documento_identidad
*****************************************************************************/
CREATE TRIGGER [Usuario].[TG_Persona(Audit)_documento_identidad_InsertUpdate]
ON [Usuario].[Persona]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
 
  IF UPDATE(documento_identidad)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue) 
    SELECT TableName    = 'Persona', 
           ColumnName   = 'documento_identidad',
           ID1          = i.ID_PERSONA, 
           Date         = @CurrDate, 
           OldValue     = d.[documento_identidad], 
           NewValue     = i.[documento_identidad]     
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.ID_PERSONA = i.ID_PERSONA)
    WHERE ISNULL(d.documento_identidad, '') != ISNULL(i.documento_identidad, '');
  END
END;