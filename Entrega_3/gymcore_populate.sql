USE gymcore;

-- Datos de prueba de GymCore. Correr despues de gymcore.sql.
-- Fecha de referencia de los datos: 2026-11-01.

-- EMPRESA
INSERT INTO Empresa (Nit_Empresa, Nombre_Empresa, Telefono_Empresa, Sitio_Web)
VALUES
  ("900123456-7", "Iron Fit S.A.S.", "6076345120", "www.ironfit.com.co"),
  ("900234567-1", "Pulso Gym S.A.S.", "6016482233", "www.pulsogym.co"),
  ("900345678-4", "Titan Training Center", "6044125587", "www.titantraining.co"),
  ("900456789-2", "Forma Vital S.A.S.", "6023389410", "www.formavital.com.co"),
  ("900567890-5", "Zona Activa Fitness", "6053567788", NULL),
  ("901012345-8", "Andes Fitness Club", "6068896012", "www.andesfitness.co"),
  ("901123456-3", "Energia Total Gym", "6076971144", NULL),
  ("901234567-9", "Vertice Box S.A.S.", "6013224590", "www.verticebox.co");

-- SERVICIO
INSERT INTO Servicio (Cod_Servicio, Nombre_Servicio, Descripcion_Servicio, Modalidad, Requiere_Reserva, Requisito)
VALUES
  (1, "Zona de pesas", "Acceso libre a máquinas y peso libre", "Presencial", FALSE, NULL),
  (2, "Spinning", "Clase grupal de ciclismo indoor", "Presencial", TRUE, "Llevar toalla y botella de agua"),
  (3, "Yoga", "Clase de yoga para todos los niveles", "Hibrida", TRUE, "Llevar mat propio"),
  (4, "Entrenamiento funcional", "Circuitos de fuerza y resistencia", "Presencial", TRUE, NULL),
  (5, "Natación", "Uso de la piscina con carriles libres", "Presencial", TRUE, "Gorro y gafas obligatorios"),
  (6, "Valoración física", "Medición de composición corporal con un entrenador", "Presencial", TRUE, "Asistir en ayunas"),
  (7, "Pilates", "Clase de pilates en colchoneta", "Virtual", TRUE, NULL),
  (8, "Cardio", "Acceso a caminadoras, elípticas y bicicletas", "Presencial", FALSE, NULL),
  (9, "Crossfit", "Entrenamiento de alta intensidad", "Presencial", TRUE, "Valoración física previa");

-- ROL
INSERT INTO Rol (Cod_Rol, Nombre_Rol, Descripcion_Rol, Ambito)
VALUES
  (1, "Superadministrador", "Administra toda la plataforma y todas las empresas", "Plataforma"),
  (2, "Soporte técnico", "Atiende las incidencias de la plataforma", "Plataforma"),
  (3, "Gerente de empresa", "Gestiona las sedes, los planes y el personal de su empresa", "Empresa"),
  (4, "Contador", "Consulta los pagos y la facturación de la empresa", "Empresa"),
  (5, "Administrador de sede", "Gestiona la operación diaria de una sede", "Sede"),
  (6, "Recepcionista", "Registra accesos, afiliaciones y pagos", "Sede"),
  (7, "Entrenador", "Gestiona sesiones y valoraciones de clientes", "Sede"),
  (8, "Cliente", "Consulta su membresía y reserva sesiones", "Empresa"),
  (9, "Mantenimiento", "Registra los reportes de mantenimiento de los equipos", "Sede");

-- PERMISO
INSERT INTO Permiso (Cod_Permiso, Modulo, Accion, Descripcion_Permiso)
VALUES
  (1, "Membresias", "Crear", "Registrar nuevas membresías"),
  (2, "Membresias", "Consultar", "Ver las membresías y su estado"),
  (3, "Membresias", "Actualizar", "Renovar o suspender membresías"),
  (4, "Pagos", "Crear", "Registrar pagos"),
  (5, "Pagos", "Consultar", "Ver el historial de pagos"),
  (6, "Pagos", "Eliminar", "Anular pagos registrados"),
  (7, "Sesiones", "Crear", "Programar sesiones"),
  (8, "Sesiones", "Consultar", "Ver las sesiones y sus reservas"),
  (9, "Equipamiento", "Actualizar", "Cambiar el estado de los equipos"),
  (10, "Empleados", "Crear", "Registrar personal"),
  (11, "Reservas", "Crear", "Reservar cupo en una sesión");

-- SEDE
INSERT INTO Sede (Cod_Sede, Nombre_Sede, Ciudad, Direccion, Telefono_Sede, Aforo_Max_Sede, Nit_Empresa)
VALUES
  (1, "Cabecera", "Bucaramanga", "Calle 52 # 35-48", "6076345121", 250, "900123456-7"),
  (2, "Cañaveral", "Floridablanca", "Carrera 25 # 30-15", "6076345122", 180, "900123456-7"),
  (3, "Provenza", "Bucaramanga", "Calle 105 # 22-10", "6076345123", 150, "900123456-7"),
  (4, "Chapinero", "Bogotá", "Carrera 13 # 57-20", "6016482234", 300, "900234567-1"),
  (5, "El Poblado", "Medellín", "Calle 10 # 43D-25", "6044125588", 220, "900345678-4"),
  (6, "Granada", "Cali", "Avenida 9N # 15-40", "6023389411", 200, "900456789-2"),
  (7, "Alto Prado", "Barranquilla", "Carrera 53 # 76-110", "6053567789", 160, "900567890-5"),
  (8, "Circunvalar", "Pereira", "Avenida Circunvalar # 8-30", "6068896013", 140, "901012345-8"),
  (9, "Sotomayor", "Bucaramanga", "Carrera 29 # 45-12", "6076971145", 120, "901123456-3"),
  (10, "Usaquén", "Bogotá", "Calle 119 # 6-25", "6013224591", 90, "901234567-9");

-- PLAN
INSERT INTO Plan (Cod_Plan, Nombre_Plan, Tipo_Plan, Duracion_Meses, Precio, Franja_Horaria, Nit_Empresa)
VALUES
  (1, "Fit Mensual", "Basico", 1, 89900.00, "Lunes a domingo, horario completo", "900123456-7"),
  (2, "Black Trimestral", "Premium", 3, 299900.00, "Lunes a domingo, horario completo", "900123456-7"),
  (3, "Hora Valle", "Basico", 1, 59900.00, "Lunes a viernes de 10:00 a 16:00", "900123456-7"),
  (4, "Anual Total", "Premium", 12, 990000.00, "Lunes a domingo, horario completo", "900123456-7"),
  (5, "Pulso Mensual", "Basico", 1, 99900.00, "Lunes a sábado de 5:00 a 22:00", "900234567-1"),
  (6, "Titan Semestral", "Intermedio", 6, 480000.00, "Lunes a domingo, horario completo", "900345678-4"),
  (7, "Vital Estudiantil", "Estudiantil", 1, 69900.00, "Lunes a viernes de 6:00 a 14:00", "900456789-2"),
  (8, "Zona Mensual", "Basico", 1, 79900.00, "Lunes a sábado de 5:00 a 21:00", "900567890-5"),
  (9, "Andes Trimestral", "Intermedio", 3, 249900.00, "Lunes a domingo, horario completo", "901012345-8"),
  (10, "Box Mensual", "Premium", 1, 149900.00, "Lunes a viernes de 5:00 a 21:00", "901234567-9"),
  (11, "Energia Mensual", "Basico", 1, 74900.00, "Lunes a sábado de 5:00 a 22:00", "901123456-3");

-- ESPACIO
INSERT INTO Espacio (Cod_Espacio, Tipo_Espacio, Aforo_Espacio, Cod_Sede)
VALUES
  (1, "Zona de pesas", 80, 1),
  (2, "Zona de cardio", 60, 1),
  (3, "Salón de spinning", 30, 1),
  (4, "Salón de yoga", 25, 1),
  (5, "Zona de pesas", 60, 2),
  (6, "Salón funcional", 30, 2),
  (7, "Piscina", 40, 3),
  (8, "Consultorio de valoración", 4, 3),
  (9, "Zona de pesas", 100, 4),
  (10, "Box de crossfit", 20, 10),
  (11, "Zona de pesas", 70, 5);

-- EQUIPAMIENTO
INSERT INTO Equipamiento (Serial, Nombre_Equipamiento, Marca, Modelo, Estado_Equipamiento, Fecha_Compra, Cod_Espacio)
VALUES
  ("LF-PC-2023-0141", "Prensa de piernas", "Life Fitness", "Signature", "Operativo", "2023-02-15", 1),
  ("TG-SM-2022-0877", "Máquina Smith", "Technogym", "Pure Strength", "Operativo", "2022-08-10", 1),
  ("MX-RK-2024-0032", "Rack de sentadillas", "Matrix", "Magnum", "En mantenimiento", "2024-01-20", 1),
  ("LF-TR-2021-1290", "Caminadora", "Life Fitness", "Integrity", "Fuera de servicio", "2021-05-03", 2),
  ("PC-EL-2023-0455", "Elíptica", "Precor", "EFX 885", "Operativo", "2023-03-22", 2),
  ("KS-BK-2022-0711", "Bicicleta de spinning", "Keiser", "M3i", "Operativo", "2022-11-05", 3),
  ("KS-BK-2022-0712", "Bicicleta de spinning", "Keiser", "M3i", "En mantenimiento", "2022-11-05", 3),
  ("C2-RW-2020-0098", "Remo", "Concept2", "RowErg", "Dado de baja", "2020-06-18", 6),
  ("RG-KB-2024-0210", "Set de kettlebells", "Rogue", "Competition", "Operativo", "2024-04-02", 10),
  ("TG-SM-2023-0921", "Máquina Smith", "Technogym", "Pure Strength", "Operativo", "2023-09-12", 9);

-- MANTENIMIENTO
INSERT INTO Mantenimiento (N_Reporte, Fecha_Mantenimiento, Descripcion_Mantenimiento, Costo, Serial)
VALUES
  (1, "2025-03-10", "Cambio de cables y poleas", 350000.00, "TG-SM-2022-0877"),
  (2, "2025-06-02", "Lubricación de la banda y ajuste del motor", 220000.00, "LF-TR-2021-1290"),
  (3, "2025-11-15", "Revisión general preventiva", 150000.00, "LF-PC-2023-0141"),
  (4, "2026-01-20", "Falla del motor de la banda, pendiente de repuesto", 1200000.00, "LF-TR-2021-1290"),
  (5, "2026-02-14", "Ajuste de la resistencia magnética", 180000.00, "KS-BK-2022-0711"),
  (6, "2026-05-08", "Revisión del sistema de tracción: daño irreparable", 90000.00, "C2-RW-2020-0098"),
  (7, "2026-09-30", "Cambio de rodamientos", 260000.00, "PC-EL-2023-0455"),
  (8, "2026-10-25", "Soldadura de un soporte de los ganchos", 310000.00, "MX-RK-2024-0032"),
  (9, "2026-10-28", "Cambio de la correa de transmisión", 140000.00, "KS-BK-2022-0712");

-- USUARIO
-- Las contrasenas de prueba se guardan con SHA2 solo para el ejemplo.
-- Usuarios 1 a 16: empleados. Usuarios 17 a 24: clientes.
INSERT INTO Usuario (Cod_Usuario, Correo_Usuario, Hash_Contrasena, Estado_Usuario, Fecha_Registro, Ultimo_Ingreso, Cod_Rol, Rol_Vigente, Fecha_Asignacion_Rol)
VALUES
  (1, "carlos.mantilla@ironfit.com.co", SHA2("GymCore*01", 256), "Activo", "2022-01-10", "2026-10-30 05:40:00", 7, TRUE, "2022-01-10"),
  (2, "laura.duarte@ironfit.com.co", SHA2("GymCore*02", 256), "Activo", "2021-03-15", "2026-10-31 06:10:00", 7, TRUE, "2021-03-15"),
  (3, "daniela.ortiz@ironfit.com.co", SHA2("GymCore*03", 256), "Activo", "2023-06-01", "2026-10-29 06:30:00", 7, TRUE, "2023-06-01"),
  (4, "jhon.castro@ironfit.com.co", SHA2("GymCore*04", 256), "Activo", "2022-09-20", "2026-10-28 17:05:00", 7, TRUE, "2022-09-20"),
  (5, "martha.uribe@ironfit.com.co", SHA2("GymCore*05", 256), "Activo", "2019-02-11", "2026-10-30 07:15:00", 7, TRUE, "2019-02-11"),
  (6, "andres.moreno@pulsogym.co", SHA2("GymCore*06", 256), "Activo", "2024-01-08", "2026-10-31 05:50:00", 7, TRUE, "2024-01-08"),
  (7, "valentina.herrera@verticebox.co", SHA2("GymCore*07", 256), "Activo", "2023-11-14", "2026-10-30 17:30:00", 7, TRUE, "2023-11-14"),
  (8, "santiago.restrepo@titantraining.co", SHA2("GymCore*08", 256), "Activo", "2022-04-04", "2026-10-31 16:45:00", 7, TRUE, "2022-04-04"),
  (9, "jorge.pabon@ironfit.com.co", SHA2("GymCore*09", 256), "Activo", "2018-07-01", "2026-10-31 08:02:45", 3, TRUE, "2018-07-01"),
  (10, "paola.sanabria@ironfit.com.co", SHA2("GymCore*10", 256), "Activo", "2020-02-17", "2026-10-30 09:12:00", 4, TRUE, "2020-02-17"),
  (11, "karen.becerra@ironfit.com.co", SHA2("GymCore*11", 256), "Activo", "2023-03-06", "2026-10-31 05:55:03", 6, TRUE, "2023-03-06"),
  (12, "miguel.suarez@ironfit.com.co", SHA2("GymCore*12", 256), "Activo", "2024-05-13", "2026-10-31 05:48:00", 6, TRUE, "2024-05-13"),
  (13, "diana.ardila@ironfit.com.co", SHA2("GymCore*13", 256), "Activo", "2021-08-23", "2026-10-30 08:20:00", 5, TRUE, "2023-02-01"),
  (14, "oscar.pena@ironfit.com.co", SHA2("GymCore*14", 256), "Activo", "2022-10-03", "2026-10-29 07:00:00", 9, TRUE, "2022-10-03"),
  (15, "natalia.gomez@ironfit.com.co", SHA2("GymCore*15", 256), "Activo", "2019-11-18", "2026-10-31 07:58:12", 1, TRUE, "2019-11-18"),
  (16, "camila.torres@pulsogym.co", SHA2("GymCore*16", 256), "Activo", "2025-01-20", "2026-10-30 06:00:00", 6, TRUE, "2025-01-20"),
  (17, "juan.perez98@gmail.com", SHA2("GymCore*17", 256), "Activo", "2026-01-15", "2026-10-27 05:58:00", 8, TRUE, "2026-01-15"),
  (18, "maria.fernanda.lopez@hotmail.com", SHA2("GymCore*18", 256), "Activo", "2026-10-05", "2026-10-31 20:40:51", 8, TRUE, "2026-10-05"),
  (19, "sebastian.rincon04@gmail.com", SHA2("GymCore*19", 256), "Activo", "2026-09-01", "2026-10-30 21:14:09", 8, TRUE, "2026-09-01"),
  (20, "gloria.mendoza@yahoo.com", SHA2("GymCore*20", 256), "Activo", "2026-08-01", "2026-10-20 10:05:00", 8, TRUE, "2026-08-01"),
  (21, "andres.cardenas@outlook.com", SHA2("GymCore*21", 256), "Inactivo", "2026-09-15", "2026-09-16 19:22:00", 8, FALSE, "2026-09-15"),
  (22, "juliana.vargas@gmail.com", SHA2("GymCore*22", 256), "Bloqueado", "2026-10-01", "2026-10-15 06:40:00", 8, TRUE, "2026-10-01"),
  (23, "felipe.ochoa@gmail.com", SHA2("GymCore*23", 256), "Activo", "2026-06-01", "2026-11-01 06:30:22", 8, TRUE, "2026-06-01"),
  (24, "isabella.rojas@gmail.com", SHA2("GymCore*24", 256), "Activo", "2026-10-12", "2026-10-30 17:45:00", 8, TRUE, "2026-10-12");

-- BITACORA
INSERT INTO Bitacora (Fecha_Hora_Ingreso, Direccion_IP, Dispositivo, Resultado, Cod_Usuario)
VALUES
  ("2026-10-31 07:58:12", "192.168.10.15", "Chrome 141 / Windows 11", "Exitoso", 15),
  ("2026-10-31 08:02:45", "192.168.10.22", "Firefox 144 / Ubuntu 24.04", "Exitoso", 9),
  ("2026-10-31 05:55:03", "192.168.10.30", "Chrome 141 / Windows 10", "Exitoso", 11),
  ("2026-10-31 06:10:00", "192.168.10.41", "App GymCore 2.3 / Android 15", "Exitoso", 2),
  ("2026-10-30 21:14:09", "190.85.33.17", "App GymCore 2.3 / Android 15", "Exitoso", 19),
  ("2026-10-31 20:40:51", "2800:e2:5c80:1a2::7", "App GymCore 2.3 / iOS 26", "Exitoso", 18),
  ("2026-10-29 22:01:10", "186.30.91.200", "Safari / iOS 26", "Fallido", 22),
  ("2026-10-29 22:01:48", "186.30.91.200", "Safari / iOS 26", "Fallido", 22),
  ("2026-10-29 22:02:30", "186.30.91.200", "Safari / iOS 26", "Fallido", 22),
  ("2026-10-29 22:03:05", "186.30.91.200", "Safari / iOS 26", "Bloqueado", 22),
  ("2026-11-01 06:30:22", "191.95.140.8", "App GymCore 2.3 / Android 14", "Exitoso", 23);

-- EMPLEADO
INSERT INTO Empleado (Documento_Empleado, Nombre_Empleado, Telefono_Empleado, Fecha_Ingreso, Salario, Cod_Sede, Cod_Usuario)
VALUES
  ("1098654321", "Carlos Andrés Mantilla Rojas", "3104567890", "2022-01-10", 2600000.00, 1, 1),
  ("1095812233", "Laura Marcela Duarte Pinto", "3157781234", "2021-03-15", 2500000.00, 1, 2),
  ("1102345987", "Daniela Sofía Ortiz Gómez", "3009871122", "2023-06-01", 2400000.00, 1, 3),
  ("1098765001", "Jhon Fredy Castro León", "3186654433", "2022-09-20", 2450000.00, 2, 4),
  ("63542118", "Martha Cecilia Uribe Vargas", "3112239876", "2019-02-11", 2700000.00, 3, 5),
  ("1020456789", "Andrés Felipe Moreno Salazar", "3205543210", "2024-01-08", 2800000.00, 4, 6),
  ("1032478901", "Valentina Herrera Quintero", "3014456677", "2023-11-14", 3000000.00, 10, 7),
  ("1037612345", "Santiago Restrepo Mejía", "3128890011", "2022-04-04", 2650000.00, 5, 8),
  ("91478523", "Jorge Enrique Pabón Serrano", "3153321100", "2018-07-01", 6500000.00, 1, 9),
  ("1098701234", "Paola Andrea Sanabria Rey", "3166678899", "2020-02-17", 3800000.00, 1, 10),
  ("1099876543", "Karen Julieth Becerra Díaz", "3176612345", "2023-03-06", 1850000.00, 1, 11),
  ("1097123456", "Miguel Ángel Suárez Prada", "3134456789", "2024-05-13", 1850000.00, 2, 12),
  ("1100954321", "Diana Carolina Ardila Mora", "3142233445", "2021-08-23", 3200000.00, 3, 13),
  ("1095432178", "Óscar Iván Peña Delgado", "3191122334", "2022-10-03", 2100000.00, 1, 14),
  ("1098800112", "Natalia Gómez Arenas", "3017788990", "2019-11-18", 5200000.00, 1, 15),
  ("1018456321", "Camila Torres Beltrán", "3108899776", "2025-01-20", 1850000.00, 4, 16);

-- ENTRENADOR
INSERT INTO Entrenador (Documento_Empleado, Especialidad)
VALUES
  ("1098654321", "Fuerza y acondicionamiento"),  -- Carlos Mantilla
  ("1095812233", "Spinning"),                    -- Laura Duarte
  ("1102345987", "Yoga y pilates"),              -- Daniela Ortiz
  ("1098765001", "Entrenamiento funcional"),     -- Jhon Castro
  ("63542118", "Natación"),                      -- Martha Uribe
  ("1020456789", "Musculación"),                 -- Andrés Moreno
  ("1032478901", "Crossfit"),                    -- Valentina Herrera
  ("1037612345", "Hipertrofia");                 -- Santiago Restrepo

-- ADMINISTRATIVO
INSERT INTO Administrativo (Documento_Empleado, Area)
VALUES
  ("91478523", "Gerencia"),                  -- Jorge Pabón
  ("1098701234", "Contabilidad"),            -- Paola Sanabria
  ("1099876543", "Recepción"),               -- Karen Becerra
  ("1097123456", "Recepción"),               -- Miguel Suárez
  ("1100954321", "Administración de sede"),  -- Diana Ardila
  ("1095432178", "Mantenimiento"),           -- Óscar Peña
  ("1098800112", "Sistemas"),                -- Natalia Gómez
  ("1018456321", "Recepción");               -- Camila Torres

-- CLIENTE
-- Los dos ultimos no tienen cuenta en la plataforma (afiliacion presencial).
INSERT INTO Cliente (Documento_Cliente, Fecha_Nacimiento, Correo_Cliente, RH, Cod_Usuario)
VALUES
  ("1098745612", "1998-04-12", "juan.perez98@gmail.com", "O+", 17),
  ("1095678234", "2001-09-30", "maria.fernanda.lopez@hotmail.com", "A+", 18),
  ("1102789456", "2004-01-22", "sebastian.rincon04@gmail.com", "O-", 19),
  ("37896541", "1975-06-08", "gloria.mendoza@yahoo.com", "B+", 20),
  ("1098123789", "1995-12-03", "andres.cardenas@outlook.com", "A-", 21),
  ("1020789654", "1990-03-17", "juliana.vargas@gmail.com", "O+", 22),
  ("1037456123", "1988-07-25", "felipe.ochoa@gmail.com", "AB+", 23),
  ("1032156987", "1999-10-11", "isabella.rojas@gmail.com", "B-", 24),
  ("1099234567", "2006-05-19", NULL, "O+", NULL),
  ("13845672", "1968-02-27", "hernando.pico@gmail.com", "A+", NULL);

-- MEMBRESIA
INSERT INTO Membresia (Cod_Membresia, Fecha_Inicio, Fecha_Fin, Estado_Membresia, Documento_Cliente, Cod_Plan)
VALUES
  (1, "2026-01-15", "2027-01-15", "Activa", "1098745612", 4),       -- Juan Pérez, Anual Total
  (2, "2026-10-05", "2026-11-05", "Activa", "1095678234", 1),       -- María López, Fit Mensual
  (3, "2026-09-01", "2026-12-01", "Activa", "1102789456", 2),       -- Sebastián Rincón, Black Trimestral
  (4, "2026-08-01", "2026-09-01", "Vencida", "37896541", 3),        -- Gloria Mendoza, Hora Valle
  (5, "2026-10-20", "2026-11-20", "Activa", "37896541", 3),         -- Gloria Mendoza, renovación
  (6, "2026-09-15", "2026-12-15", "Suspendida", "1098123789", 2),   -- Andrés Cárdenas, por lesión
  (7, "2026-10-01", "2026-11-01", "Activa", "1020789654", 5),       -- Juliana Vargas, Pulso Mensual
  (8, "2026-06-01", "2026-12-01", "Activa", "1037456123", 6),       -- Felipe Ochoa, Titan Semestral
  (9, "2026-10-12", "2026-11-12", "Activa", "1032156987", 10),      -- Isabella Rojas, Box Mensual
  (10, "2026-03-01", "2026-04-01", "Cancelada", "1099234567", 1),   -- Mateo Castellanos
  (11, "2026-10-25", "2026-11-25", "Activa", "1099234567", 1),      -- Mateo Castellanos, se afilió de nuevo
  (12, "2025-10-20", "2026-10-20", "Vencida", "13845672", 4),       -- Hernando Pico, Anual Total
  (13, "2026-10-28", "2026-11-28", "Activa", "13845672", 3);        -- Hernando Pico, Hora Valle

-- PAGO
-- Documento_Empleado en NULL = pago hecho en linea, sin pasar por recepcion.
INSERT INTO Pago (N_Factura, Fecha_Pago, Monto, Metodo_Pago, Estado_Pago, Cod_Membresia, Documento_Empleado)
VALUES
  (1, "2026-01-15", 990000.00, "Tarjeta Credito", "Aprobado", 1, "1099876543"),
  (2, "2026-10-05", 89900.00, "Nequi", "Aprobado", 2, NULL),
  (3, "2026-09-01", 299900.00, "PSE", "Aprobado", 3, NULL),
  (4, "2026-08-01", 59900.00, "Efectivo", "Aprobado", 4, "1100954321"),
  (5, "2026-10-20", 59900.00, "Daviplata", "Aprobado", 5, NULL),
  (6, "2026-09-15", 299900.00, "Tarjeta Debito", "Aprobado", 6, "1097123456"),
  (7, "2026-10-01", 99900.00, "Transferencia", "Aprobado", 7, "1018456321"),
  (8, "2026-06-01", 480000.00, "Tarjeta Credito", "Rechazado", 8, NULL),
  (9, "2026-06-01", 480000.00, "Tarjeta Debito", "Aprobado", 8, NULL),
  (10, "2026-10-12", 149900.00, "Nequi", "Aprobado", 9, NULL),
  (11, "2026-03-01", 89900.00, "Efectivo", "Anulado", 10, "1099876543"),
  (12, "2026-10-25", 89900.00, "Efectivo", "Aprobado", 11, "1097123456"),
  (13, "2025-10-20", 990000.00, "Transferencia", "Aprobado", 12, "1099876543"),
  (14, "2026-10-28", 59900.00, "Nequi", "Pendiente", 13, NULL);

-- ACCESO
-- La sede de cada acceso esta entre las que cubre el plan de la membresia.
INSERT INTO Acceso (Fecha_Hora_Entrada, Fecha_Hora_Salida, Cod_Membresia, Cod_Sede)
VALUES
  ("2026-10-27 06:05:00", "2026-10-27 07:40:00", 1, 1),
  ("2026-10-29 18:10:00", "2026-10-29 19:30:00", 1, 2),
  ("2026-10-31 08:00:00", "2026-10-31 09:05:00", 1, 3),
  ("2026-10-28 05:30:00", "2026-10-28 06:45:00", 2, 1),
  ("2026-10-29 06:50:00", "2026-10-29 08:10:00", 3, 1),
  ("2026-10-30 19:00:00", "2026-10-30 20:15:00", 3, 1),
  ("2026-08-12 10:15:00", "2026-08-12 11:30:00", 4, 3),
  ("2026-10-29 10:30:00", "2026-10-29 11:45:00", 5, 3),
  ("2026-10-30 06:00:00", "2026-10-30 07:10:00", 7, 4),
  ("2026-10-31 17:20:00", "2026-10-31 18:50:00", 8, 5),
  ("2026-10-30 18:00:00", "2026-10-30 19:00:00", 9, 10),
  ("2026-11-01 07:15:00", NULL, 11, 2),                    -- todavia esta adentro
  ("2026-09-18 09:00:00", "2026-09-18 10:10:00", 12, 1);

-- NOMBRES CLIENTE
INSERT INTO Nombres_Cliente (Nombre_Cliente, Documento_Cliente)
VALUES
  ("Juan", "1098745612"), ("David", "1098745612"),
  ("María", "1095678234"), ("Fernanda", "1095678234"),
  ("Sebastián", "1102789456"),
  ("Gloria", "37896541"), ("Inés", "37896541"),
  ("Andrés", "1098123789"),
  ("Juliana", "1020789654"),
  ("Felipe", "1037456123"),
  ("Isabella", "1032156987"),
  ("Mateo", "1099234567"), ("Alejandro", "1099234567"),
  ("Hernando", "13845672");

-- APELLIDOS CLIENTE
INSERT INTO Apellidos_Cliente (Apellido_Cliente, Documento_Cliente)
VALUES
  ("Pérez", "1098745612"), ("Gómez", "1098745612"),
  ("López", "1095678234"), ("Ardila", "1095678234"),
  ("Rincón", "1102789456"), ("Silva", "1102789456"),
  ("Mendoza", "37896541"), ("Prada", "37896541"),
  ("Cárdenas", "1098123789"), ("Ruiz", "1098123789"),
  ("Vargas", "1020789654"), ("Lozano", "1020789654"),
  ("Ochoa", "1037456123"), ("Restrepo", "1037456123"),
  ("Rojas", "1032156987"), ("Cárdenas", "1032156987"),
  ("Castellanos", "1099234567"), ("Pinto", "1099234567"),
  ("Pico", "13845672"), ("Serrano", "13845672");

-- TELEFONOS CLIENTE
INSERT INTO Telefonos_Cliente (Telefono_Cliente, Documento_Cliente)
VALUES
  ("3001234567", "1098745612"), ("6076432100", "1098745612"),
  ("3112345678", "1095678234"),
  ("3223456789", "1102789456"),
  ("3134567890", "37896541"), ("6076358899", "37896541"),
  ("3045678901", "1098123789"),
  ("3156789012", "1020789654"),
  ("3007890123", "1037456123"),
  ("3178901234", "1032156987"),
  ("3189012345", "1099234567"),
  ("3190123456", "13845672");

-- RESTRICCIONES CLIENTE
INSERT INTO Restricciones_Cliente (Restriccion, Documento_Cliente)
VALUES
  ("Lesión de rodilla derecha", "1098745612"),
  ("Asma leve", "1095678234"),
  ("Hipertensión controlada", "37896541"),
  ("Hernia discal lumbar", "37896541"),
  ("Tendinitis en el hombro izquierdo", "1098123789"),
  ("Escoliosis leve", "1020789654"),
  ("Alergia al látex", "1037456123"),
  ("Diabetes tipo 2", "13845672"),
  ("Hipertensión controlada", "13845672");

-- SESION
-- El cupo de cada sesion no supera el aforo del espacio.
INSERT INTO Sesion (Cod_Sesion, Fecha_Sesion, Hora_Inicio, Hora_Fin, Cupo_Max, Cod_Servicio, Cod_Espacio, Documento_Entrenador)
VALUES
  (1, "2026-11-03", "06:00:00", "07:00:00", 25, 2, 3, "1095812233"),  -- Spinning, Laura Duarte
  (2, "2026-11-03", "19:00:00", "20:00:00", 30, 2, 3, "1095812233"),  -- Spinning, Laura Duarte
  (3, "2026-11-04", "07:00:00", "08:00:00", 20, 3, 4, "1102345987"),  -- Yoga, Daniela Ortiz
  (4, "2026-11-05", "18:00:00", "19:00:00", 25, 4, 6, "1098765001"),  -- Funcional, Jhon Castro
  (5, "2026-11-04", "08:00:00", "09:00:00", 15, 5, 7, "63542118"),    -- Natación, Martha Uribe
  (6, "2026-11-07", "09:00:00", "09:30:00", 1, 6, 8, "63542118"),     -- Valoración, Martha Uribe
  (7, "2026-11-03", "18:00:00", "19:00:00", 15, 9, 10, "1032478901"), -- Crossfit, Valentina Herrera
  (8, "2026-10-30", "19:00:00", "20:00:00", 30, 2, 3, "1095812233"),  -- Spinning, ya paso
  (9, "2026-10-29", "07:00:00", "08:00:00", 20, 3, 4, "1102345987");  -- Yoga, ya paso

-- SEDE PLAN
INSERT INTO Sede_Plan (Cod_Sede, Cod_Plan)
VALUES
  (1, 1), (2, 1),           -- Fit Mensual
  (1, 2), (2, 2), (3, 2),   -- Black Trimestral
  (3, 3),                   -- Hora Valle
  (1, 4), (2, 4), (3, 4),   -- Anual Total
  (4, 5),                   -- Pulso Mensual
  (5, 6),                   -- Titan Semestral
  (6, 7),                   -- Vital Estudiantil
  (7, 8),                   -- Zona Mensual
  (8, 9),                   -- Andes Trimestral
  (10, 10),                 -- Box Mensual
  (9, 11);                  -- Energia Mensual

-- SERVICIO PLAN
-- Cupo_Mensual en NULL = sin limite.
INSERT INTO Servicio_Plan (Cod_Servicio, Cod_Plan, Cupo_Mensual, Costo_Adicional)
VALUES
  (1, 1, NULL, 0.00),       -- Pesas en Fit Mensual
  (8, 1, NULL, 0.00),       -- Cardio en Fit Mensual
  (2, 1, 4, 15000.00),      -- Spinning en Fit Mensual, con recargo
  (1, 2, NULL, 0.00),       -- Pesas en Black Trimestral
  (2, 2, 12, 0.00),         -- Spinning en Black Trimestral
  (3, 2, 8, 0.00),          -- Yoga en Black Trimestral
  (6, 2, 1, 0.00),          -- Valoración en Black Trimestral
  (1, 3, NULL, 0.00),       -- Pesas en Hora Valle
  (4, 4, 12, 0.00),         -- Funcional en Anual Total
  (5, 4, NULL, 0.00),       -- Natación en Anual Total
  (9, 10, NULL, 0.00);      -- Crossfit en Box Mensual

-- SERVICIO SEDE
INSERT INTO Servicio_Sede (Cod_Servicio, Cod_Sede, Horario)
VALUES
  (1, 1, "Lunes a sábado 5:00-22:00; domingo 7:00-14:00"),
  (2, 1, "Lunes a viernes 6:00, 12:00 y 19:00"),
  (3, 1, "Martes y jueves 7:00 y 18:00"),
  (8, 1, "Lunes a sábado 5:00-22:00"),
  (1, 2, "Lunes a sábado 5:00-21:00"),
  (4, 2, "Lunes, miércoles y viernes 18:00"),
  (5, 3, "Lunes a viernes 6:00-20:00"),
  (6, 3, "Sábado 8:00-12:00"),
  (1, 4, "Lunes a sábado 5:00-22:00"),
  (1, 5, "Lunes a domingo 5:00-22:00"),
  (7, 6, "Lunes y miércoles 19:00, en línea"),
  (9, 10, "Lunes a viernes 6:00, 18:00 y 19:00");

-- SESION CLIENTE
INSERT INTO Sesion_Cliente (Cod_Sesion, Documento_Cliente, Fecha_Reserva, Estado_Reserva)
VALUES
  (1, "1095678234", "2026-10-31", "Confirmada"),   -- María López
  (1, "1102789456", "2026-10-31", "Confirmada"),   -- Sebastián Rincón
  (2, "1099234567", "2026-11-01", "Confirmada"),   -- Mateo Castellanos
  (3, "1102789456", "2026-11-01", "Confirmada"),   -- Sebastián Rincón
  (4, "1098745612", "2026-10-30", "Confirmada"),   -- Juan Pérez
  (5, "1098745612", "2026-10-31", "Cancelada"),    -- Juan Pérez
  (6, "1102789456", "2026-10-28", "Confirmada"),   -- Sebastián Rincón
  (7, "1032156987", "2026-10-31", "Confirmada"),   -- Isabella Rojas
  (8, "1102789456", "2026-10-27", "Asistio"),      -- Sebastián Rincón
  (8, "1095678234", "2026-10-28", "No asistio"),   -- María López
  (9, "1102789456", "2026-10-27", "Asistio");      -- Sebastián Rincón

-- ROL PERMISO
INSERT INTO Rol_Permiso (Cod_Rol, Cod_Permiso)
VALUES
  (1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (1, 6), (1, 7), (1, 8), (1, 9), (1, 10), (1, 11),  -- Superadministrador
  (3, 2), (3, 5), (3, 8), (3, 10),                                                          -- Gerente de empresa
  (4, 5),                                                                                   -- Contador
  (5, 1), (5, 2), (5, 3), (5, 4), (5, 7),                                                   -- Administrador de sede
  (6, 1), (6, 2), (6, 4),                                                                   -- Recepcionista
  (7, 7), (7, 8),                                                                           -- Entrenador
  (8, 2), (8, 8), (8, 11),                                                                  -- Cliente
  (9, 9);                                                                                   -- Mantenimiento
