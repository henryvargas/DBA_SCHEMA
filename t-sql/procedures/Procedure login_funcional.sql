USE [SGSO_RESCUE]
GO
/**********************************************************
*	Login funcional
*	Version Inicial
*
*	Nombre				Fecha				Descripcion
*	--------------------------------------------------------
*	Julio Daviu 		10-02-2019			Procediciemento para realizar login
*
*************************************************************/
CREATE PROCEDURE [Usuario].[LOGIN_FUNCIONAL]
(
@USUARIO VARCHAR(50),
@PASSWORD NVARCHAR(300),
@RESULT BIT OUTPUT,
@MENSAJE VARCHAR(150) OUTPUT,
@ERROR VARCHAR(150) OUTPUT
)
AS 
DECLARE @PASSENCODE NVARCHAR(300);
DECLARE @PASSDECODE NVARCHAR(300);

BEGIN
	SELECT @PASSENCODE=ps.PASS_ENCRYPT
	FROM [usuario].[Login] lg
	INNER JOIN [Usuario].[Password] ps
	ON (PS.ID_LOGIN=lg.ID_LOGIN)
	where lg.USUARIO=@USUARIO;

	set @PASSDECODE=DECRYPTBYPASSPHRASE('Password-default', @PASSENCODE);

END

BEGIN
	IF @PASSDECODE=@PASSWORD

		SET @RESULT=1;

	ELSE
		SET @RESULT=0

END


GO


