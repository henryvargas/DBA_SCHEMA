USE SGSO_RESCUE;

SET XACT_ABORT ON;
SET NOCOUNT ON;

BEGIN TRANSACTION;

PRINT 'Insert data into the Person table...';

INSERT INTO [Usuario].[Persona]([NOMBRE],[APELLIDO],[EMAIL],[DIRECCION],[TELEFONO])
	 VALUES('Keegan','Guerrero','Curabitur.vel.lectus@feugiatSednec.com','Apartado n�m.: 719, 2875 Praesent Avenida','372-76715')
		,('Dante','Sandoval','consectetuer.mauris.id@Sed.edu','5652 Vel, C.','434-51410')
		,('Michelle','Alvarado','Vivamus@egestasblandit.com','Apdo.:329-521 Eu Av.','772-41484')
		,('Marvin','Gonz�lez','Sed.molestie.Sed@ametorciUt.net','9522 Interdum C.','200-47043')
		,('Lance','P�rez','neque@idliberoDonec.net','Apartado n�m.: 332, 6350 Nisl Carretera','123-64052')
		,('John','Fern�ndez','eu.erat@lacus.org','Apartado n�m.: 768, 9826 Eros ','391-62813')
		,('Buckminster','Guti�rrez','odio.a.purus@tristiquesenectus.com','406-6432 Velit. ','666-20426')
		,('Brady','Garc�a','cursus@tellus.net','Apartado n�m.: 404, 5769 Sit ','866-60718')
		,('Keaton','Saavedra','lacus.Quisque@estmollis.co.uk','4861 Phasellus C.','963-62992')
		,('Otto','Pizarro','magna.nec.quam@natoquepenatibus.edu','517-3064 Ac ','134-43427')
		,('John','Z��iga','dictum.magna@faucibus.edu','Apartado n�m.: 177, 9479 Orci, Av.','975-70788')
		,('Solomon','Bravo','id@ultricesposuerecubilia.net','Apartado n�m.: 890, 4672 Placerat, Av.','332-56993')
		,('Aidan','Vidal','aliquet.sem@rhoncusNullam.com','Apdo.:421-7765 Tincidunt Avenida','503-63588')
		,('Drew','Vargas','Donec.egestas.Aliquam@vestibulumneceuismod.net','810-8652 Montes, Avda.','603-23165')
		,('Stone','Alvarado','tellus.Aenean.egestas@loremegetmollis.net','346-8852 Dolor Ctra.','124-49130')
		,('Hamish','N��ez','Vestibulum.accumsan.neque@penatibuset.org','622-676 Metus. Carretera','978-40317')
		,('Miranda','Ortiz','egestas.Sed.pharetra@sapien.net','Apartado n�m.: 774, 925 Erat Carretera','650-76702')
		,('Lynn','Alarc�n','primis.in.faucibus@montesnasceturridiculus.co.uk','Apdo.:756-5819 Euismod Av.','246-09372')
		,('Alana','Castro','euismod@congueInscelerisque.co.uk','Apartado n�m.: 571, 9041 Varius Calle','382-40511')
		,('Lee','Rivera','Sed.eu@duiin.edu','Apartado n�m.: 877, 5888 Dolor Avda.','133-94851');
PRINT 'Person table done...';

PRINT 'Insert data into the Cargo table...';

INSERT INTO Equipamientos.Cargo([NOMBRE],[DESCRIPCION]) 
	VALUES('Ventas y Mercadot�cnia','Encargados de la logistica de venta y mercadeo')
		 ,('Planificacion de proyectos','Encargados de la gestion de proyectos')
		 ,('Obrero','Mano de obra')
		 ,('Finanzas','Manejo de la economia de la empresa')
		 ,('Gesti�n de activos','Gestiona el aprovicionamiento y asignacion de materiales')
		 ,('Recursos humanos','Gestiona las operaciones del personal')
		 ,('Infraestructura','Encargados de realizar la gestion de construccion de infraestructuras')
		 ,('Contabilidad','Maneja las transacciones economicas ')
		 ,('Gerente','El encargado de la toma de desiciones')
		 ,('N�minas','Genera la planilla de pagos')
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