/**********************************************************
*	Version Inicial
*
*	Nombre				Fecha				Descripcion
*	--------------------------------------------------------
*	Desconocido
*	Henry Vargas		09-02-2019			Modificacion de la tabla Person (ADD DOCUMENTO_IDENTIDAD) 
*   Henry Vargas        10-02-2019          Aggregar datos a DOCUMENTO_IDENTIDAD
*
*************************************************************/

USE SGSO_RESCUE;

SET XACT_ABORT ON;
SET NOCOUNT ON;

BEGIN TRANSACTION;
PRINT 'Alter Table Insert DOCUMENTO_IDENTIDAD into the Person table...';
ALTER TABLE usuario.persona  
ADD  DOCUMENTO_IDENTIDAD varchar(50) CONSTRAINT UNIQ_PER_DOC UNIQUE(DOCUMENTO_IDENTIDAD);
PRINT 'Insert DOCUMENTO_IDENTIDAD into the Person table...';
GO
COMMIT TRANSACTION;
BEGIN TRANSACTION;
INSERT INTO [Usuario].[Persona]([NOMBRE],[APELLIDO],[EMAIL],[DIRECCION],[TELEFONO],[DOCUMENTO_IDENTIDAD])
	 VALUES('Keegan','Guerrero','Curabitur.vel.lectus@feugiatSednec.com','Apartado núm.: 719, 2875 Praesent Avenida','372-76715','2640397')
		,('Dante','Sandoval','consectetuer.mauris.id@Sed.edu','5652 Vel, C.','434-51410','5872275')
		,('Michelle','Alvarado','Vivamus@egestasblandit.com','Apdo.:329-521 Eu Av.','772-41484','1893253')
		,('Marvin','González','Sed.molestie.Sed@ametorciUt.net','9522 Interdum C.','200-47043','2160353')
		,('Lance','Pérez','neque@idliberoDonec.net','Apartado núm.: 332, 6350 Nisl Carretera','123-64052','7250444')
		,('John','Fernández','eu.erat@lacus.org','Apartado núm.: 768, 9826 Eros ','391-62813','1350617')
		,('Buckminster','Gutiérrez','odio.a.purus@tristiquesenectus.com','406-6432 Velit. ','666-20426','7519471')
		,('Brady','García','cursus@tellus.net','Apartado núm.: 404, 5769 Sit ','866-60718','6389963')
		,('Keaton','Saavedra','lacus.Quisque@estmollis.co.uk','4861 Phasellus C.','963-62992','8201910')
		,('Otto','Pizarro','magna.nec.quam@natoquepenatibus.edu','517-3064 Ac ','134-43427','1153097')
		,('John','Zúñiga','dictum.magna@faucibus.edu','Apartado núm.: 177, 9479 Orci, Av.','975-70788','8491776')
		,('Solomon','Bravo','id@ultricesposuerecubilia.net','Apartado núm.: 890, 4672 Placerat, Av.','332-56993','5681246')
		,('Aidan','Vidal','aliquet.sem@rhoncusNullam.com','Apdo.:421-7765 Tincidunt Avenida','503-63588','3712493')
		,('Drew','Vargas','Donec.egestas.Aliquam@vestibulumneceuismod.net','810-8652 Montes, Avda.','603-23165','8670416')
		,('Stone','Alvarado','tellus.Aenean.egestas@loremegetmollis.net','346-8852 Dolor Ctra.','124-49130','6497038')
		,('Hamish','Núñez','Vestibulum.accumsan.neque@penatibuset.org','622-676 Metus. Carretera','978-40317','5044715')
		,('Miranda','Ortiz','egestas.Sed.pharetra@sapien.net','Apartado núm.: 774, 925 Erat Carretera','650-76702','9290350')
		,('Lynn','Alarcón','primis.in.faucibus@montesnasceturridiculus.co.uk','Apdo.:756-5819 Euismod Av.','246-09372','8257529')
		,('Alana','Castro','euismod@congueInscelerisque.co.uk','Apartado núm.: 571, 9041 Varius Calle','382-40511','6048626')
		,('Lee','Rivera','Sed.eu@duiin.edu','Apartado núm.: 877, 5888 Dolor Avda.','133-94851','2019893');
PRINT 'Person table done...';

PRINT 'Insert data into the Cargo table...';

INSERT INTO Equipamientos.Cargo([NOMBRE],[DESCRIPCION]) 
	VALUES('Ventas y Mercadotécnia','Encargados de la logistica de venta y mercadeo')
		 ,('Planificacion de proyectos','Encargados de la gestion de proyectos')
		 ,('Obrero','Mano de obra')
		 ,('Finanzas','Manejo de la economia de la empresa')
		 ,('Gestión de activos','Gestiona el aprovicionamiento y asignacion de materiales')
		 ,('Recursos humanos','Gestiona las operaciones del personal')
		 ,('Infraestructura','Encargados de realizar la gestion de construccion de infraestructuras')
		 ,('Contabilidad','Maneja las transacciones economicas ')
		 ,('Gerente','El encargado de la toma de desiciones')
		 ,('Nóminas','Genera la planilla de pagos')
		 ,('Capataz','Controla las actividades en obra');
	
PRINT 'Cargo table done...';

PRINT 'Insert data into the tipo_Accidente table...';

INSERT INTO [Incidentes].[Tipo_Accidente]
           ([NOMBRE])
     VALUES
           ('Atropellamiento')
		  ,('Caida')
		  ,('Intoxicacion')
		  ,('Quemadura')
		  ,('Electrocucion')
		  ,('Cortadura')
		  ,('Choque');
		  
PRINT 'tipo_Accidente table done...';

PRINT 'Insert data into the categoria table...';

INSERT INTO [Equipamientos].[Categoria]
           ([NOMBRE],[AREA],[DESCRIPCION])
     VALUES
           ('Cascos','Cabeza','Diferentes tipos de cascos')
		  ,('Botas','Pies','Diferentes tipos de botas de seguridad')
		  ,('Guantes','Manos','Diferentes tipos de guantes de seguridad')
		  ,('Gafas','Cabeza','Diferentes tipos de gafas de seguridad');

PRINT 'categoria table done...';
COMMIT TRANSACTION;