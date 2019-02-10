/******************************************************************************
**  Name: TG_PersonA(Audit)_ID_EMPLEADO_InsertUpdate
**  Desc: Audit History for Asignacion_Equipamiento table - ID_EMPLEADO
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
** 02/09/2019 Carlos Camacho   Initial version - Trigger for Audit ASIGN_EQUIP - ID_EMPLEADO
*******************************************************************************/

/*****************************************************************************
PERSONA - ID_EMPLEADO
*****************************************************************************/
CREATE TRIGGER [Equipamientos].[TG_Asignacion_Equipamiento(Audit)_ID_EMPLEADO_InsertUpdate]
ON [Equipamientos].[Asignacion_Equipamiento]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
 
  IF UPDATE(ID_EMPLEADO)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue) 
    SELECT TableName    = 'Asignacion_Equipamiento', 
           ColumnName   = 'ID_EMPLEADO',
           ID1          = i.ID_ASIGNACION, 
           Date         = @CurrDate, 
           OldValue     = d.[ID_EMPLEADO], 
           NewValue     = i.[ID_EMPLEADO]     
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.ID_ASIGNACION = i.ID_ASIGNACION)
    WHERE ISNULL(d.ID_EMPLEADO, '') != ISNULL(i.ID_EMPLEADO, '');
  END
END;
