/******************************************************************************
**  Name: TG_PersonA(Audit)_InsertUpdate
**  Desc: Audit History for Persona table - TELEFONO
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
** 02/09/2019 Carlos Camacho   Initial version - Trigger for Audit Persona - TELEFONO
*******************************************************************************/

/*****************************************************************************
PERSONA - TELEFONO
*****************************************************************************/
CREATE TRIGGER [Usuario].[TG_Persona(Audit)_TELEFONO_InsertUpdate]
ON [Usuario].[Persona]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
 
  IF UPDATE(TELEFONO)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue) 
    SELECT TableName    = 'Persona', 
           ColumnName   = 'TELEFONO',
           ID1          = i.ID_PERSONA, 
           Date         = @CurrDate, 
           OldValue     = d.[TELEFONO], 
           NewValue     = i.[TELEFONO]     
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.ID_PERSONA = i.ID_PERSONA)
    WHERE ISNULL(d.TELEFONO, '') != ISNULL(i.TELEFONO, '');
  END
END;