USE [SGSO_RESCUE_DATA];

SET XACT_ABORT ON;
SET NOCOUNT ON;

BEGIN TRANSACTION;

PRINT 'Insert data into the Person table...';

INSERT INTO [Usuario].[base_Persona]([NOMBRE],[APELLIDO],[DOCUMENTO_IDENTIDAD],[EMAIL],[DIRECCION],[TELEFONO])
	 VALUES('Keegan','Guerrero','5242389','Curabitur.vel.lectus@feugiatSednec.com','Apartado núm.: 719, 2875 Praesent Avenida','372-76715')
		,('Dante','Sandoval','5248795','consectetuer.mauris.id@Sed.edu','5652 Vel, C.','434-51410')
		,('Michelle','Alvarado','48759842','Vivamus@egestasblandit.com','Apdo.:329-521 Eu Av.','772-41484')
		,('Marvin','González','12478548','Sed.molestie.Sed@ametorciUt.net','9522 Interdum C.','200-47043')
		,('Lance','Pérez','3265981','neque@idliberoDonec.net','Apartado núm.: 332, 6350 Nisl Carretera','123-64052')
		,('John','Fernández','4859758','eu.erat@lacus.org','Apartado núm.: 768, 9826 Eros ','391-62813')
		,('Buckminster','Gutiérrez','2615485','odio.a.purus@tristiquesenectus.com','406-6432 Velit. ','666-20426')
		,('Brady','García','6545789','cursus@tellus.net','Apartado núm.: 404, 5769 Sit ','866-60718')
		,('Keaton','Saavedra','5092817','lacus.Quisque@estmollis.co.uk','4861 Phasellus C.','963-62992')
		,('Otto','Pizarro','8945231','magna.nec.quam@natoquepenatibus.edu','517-3064 Ac ','134-43427')
		,('John','Zúñiga','6932571','dictum.magna@faucibus.edu','Apartado núm.: 177, 9479 Orci, Av.','975-70788')
		,('Solomon','Bravo','4387159','id@ultricesposuerecubilia.net','Apartado núm.: 890, 4672 Placerat, Av.','332-56993')
		,('Aidan','Vidal','9073281','aliquet.sem@rhoncusNullam.com','Apdo.:421-7765 Tincidunt Avenida','503-63588')
		,('Drew','Vargas','5019874','Donec.egestas.Aliquam@vestibulumneceuismod.net','810-8652 Montes, Avda.','603-23165')
		,('Stone','Alvarado','2478514','tellus.Aenean.egestas@loremegetmollis.net','346-8852 Dolor Ctra.','124-49130')
		,('Hamish','Núñez','8745120','Vestibulum.accumsan.neque@penatibuset.org','622-676 Metus. Carretera','978-40317')
		,('Miranda','Ortiz','5898748','egestas.Sed.pharetra@sapien.net','Apartado núm.: 774, 925 Erat Carretera','650-76702')
		,('Lynn','Alarcón','6998741','primis.in.faucibus@montesnasceturridiculus.co.uk','Apdo.:756-5819 Euismod Av.','246-09372')
		,('Alana','Castro','8522471','euismod@congueInscelerisque.co.uk','Apartado núm.: 571, 9041 Varius Calle','382-40511')
		,('Lee','Rivera','6658741','Sed.eu@duiin.edu','Apartado núm.: 877, 5888 Dolor Avda.','133-94851');
PRINT 'Person table done...';

PRINT 'Insert data into the Cargo table...';

INSERT INTO [Equipamientos].[base_Cargo]([NOMBRE],[DESCRIPCION]) 
	VALUES('Ventas y Mercadotécnia','Encargados de la logistica de venta y mercadeo')
		 ,('Planificacion de proyectos','Encargados de la gestion de proyectos')
		 ,('Obrero','Mano de obra')
		 ,('Finanzas','Manejo de la economia de la empresa')
		 ,('Gestión de activos','Gestiona el aprovicionamiento y asignacion de materiales')
		 ,('Recursos humanos','Gestiona las operaciones del personal')
		 ,('Infraestructura','Encargados de realizar la gestion de construccion de infraestructuras')
		 ,('Contabilidad','Maneja las transacciones economicas ')
		 ,('Gerente','El encargado de la toma de desiciones')
		 ,('Nominas','Genera la planilla de pagos')
		 ,('Capataz','Controla las actividades en obra');
	
PRINT 'Cargo table done...';

PRINT 'Insert data into the tipo_Accidente table...';

INSERT INTO [Incidentes].[base_Tipo_Accidente]
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

PRINT 'Insert data into the tipo_lesion table...';

INSERT INTO [Incidentes].[base_Tipo_Lesion]
           ([NOMBRE],[AREA_AFECT])
     VALUES
           ('Por sobrecarga','piernas y espalda')
		  ,('Musculares','piernas')
		  ,('Huesos','Brazos')
		  ,('En articulaciones','codos');


PRINT 'tipo_lesion table done...';

PRINT 'Insert data into the equipamiento table...';

INSERT INTO [Equipamientos].[base_Equipamiento]
           ([NOMBRE],[ESTADO],[STOCK])
     VALUES
           ('guantes de seguridad',1,200)
		  ,('botas de seguridad',1,200)
		  ,('casco de seguridad blanco',1,200)
		  ,('lentes de seguridad transparente',1,200)
		  ,('lentes de sol de seguridad',1,200)
		  ,('camisa de seguridad',1,200)
		  ,('pantalon de seguridad',1,200)
		  ,('protector de orejas',1,100)
		  ,('arnes de seguridad',1,20)
		  ,('cubre boca',1,100);
PRINT 'equipamiento table done...';


PRINT 'Insert data into the Empleado table...';

INSERT INTO [Usuario].[base_Empleado]
           ([ID_CARGO],[ID_PERSONA],[FECHA_CONTR],[GENERO],[NRO_SEGURO],[ESTADO_SEGURO])
     VALUES
           (3,3,getdate(),'masculino','2547841',1)
		  ,(1,2,getdate(),'masculino','5543553',1)
		  ,(2,4,getdate(),'masculino','9987455',1)
		  ,(4,1,getdate(),'masculino','2214557',1)
		  ,(3,5,getdate(),'masculino','9987112',1)
		  ,(3,6,getdate(),'masculino','3354887',1)
		  ,(3,7,getdate(),'masculino','9988774',1)
		  ,(5,8,getdate(),'masculino','8527417',1)
		  ,(6,9,getdate(),'masculino','3647418',1)
		  ,(7,10,getdate(),'masculino','6587497',1)
		  ,(8,11,getdate(),'masculino','5587412',1);



PRINT 'Empleado table done...';

PRINT 'Insert data into the asignacion_equipamiento table...';

INSERT INTO [Equipamientos].[base_Asignacion_Equipamiento]
           ([ID_EQUIPAMIENTO],[ID_EMPLEADO],[CANTIDAD],[FECHA_ASIG])
     VALUES
           (3,1,1,getdate())
		  ,(3,2,2,getdate())
		  ,(2,1,1,getdate())
		  ,(5,5,1,getdate())
		  ,(8,4,1,getdate());

PRINT 'asignacion_equipamiento table done...';


PRINT 'Insert data into the Ausentismo table...';
INSERT INTO [Incidentes].[base_Ausentismo]
           ([ID_EMPLEADO],[CAUSA],[FECHA_INIC],[FECHA_FIN],[DIAS_AUS],[HORAS_AUS],[OBSERVACION])
     VALUES
           (1,'enfermedad',getdate()-1,getdate(),1,0,'')
		  ,(2,'enfermedad',getdate()-3,getdate(),2,0,'');
PRINT 'Ausentismo table done...';

select * from Incidentes.Ausentismo

PRINT 'Insert data into the Incidente table...';
INSERT INTO [Incidentes].[base_Incidente]
           ([ID_TIPO_ACC],[ID_LESION],[FECHA_INCIDENTE],[JORNADA],[SITIO_INCID],[TIPO_INCID],[MUERTE],[DESCRIPTION])
     VALUES
           (2,2,getdate()-5,'diurna','lugar de obra',1,0,'Al realizar las obras de excavacion de cimientos cayo de manera brusca resultado bastante golpeada el area de las piernas, debido a que sus botas resvalaron')
		  ,(2,3,getdate()-7,'horas extra','almacenes',1,0,'Durante el inventario por una mala manipulacion de equipamiento sufrio una fractura de hueso en los brazos');
PRINT 'Incidente table done...';

PRINT 'Insert data into the Incidente_Empleado table...';

INSERT INTO [Incidentes].[base_Incidente_Empleado]
           ([ID_INCIDENTE],[ID_EMPLEADO])
     VALUES
           (1,1)
		  ,(2,5);

PRINT 'Incidente_empleado table done...';

PRINT 'Insert data into the Proyecto table...';

INSERT INTO [Proyectos].[base_Proyecto]
           ([NOMBRE],[RESPONSABLE],[CIUDAD],[PROVINCIA],[DIRECCION])
     VALUES
           ('Construccion de viviendas en sacaba',3,'sacaba','sacaba','C. Sucre s/n')
		  ,('Construccion de plazuela vecinal',3,'Cochabamba','Cercado','Final ameria oeste');
GO


PRINT 'Proyecto table done...';

PRINT 'Insert data into the Proyecto_Empleado table...';

INSERT INTO [Proyectos].[base_Proyecto_Empleado]
           ([ID_PROYECTO],[ID_EMPLEADO])
     VALUES
           (1,1)
		  ,(1,2)
		  ,(1,3)
		  ,(1,4)
		  ,(2,3)
		  ,(2,6)
		  ,(2,1)
		  ,(2,7);

PRINT 'Proyecto_Empleado table done...';
COMMIT TRANSACTION;