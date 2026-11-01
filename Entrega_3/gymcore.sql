-- CREACION DE LA BASE DE DATOS: borra la anterior y arranca de cero --

DROP DATABASE IF EXISTS gymcore;
CREATE DATABASE gymcore;
USE gymcore;

-- COSAS QUE PUDE CREAR DE PRIMERO --

CREATE TABLE Empresa(
    Nit_Empresa VARCHAR(15),
    Nombre_Empresa VARCHAR(100) NOT NULL UNIQUE,
    Telefono_Empresa VARCHAR(15) NOT NULL,
    Sitio_Web VARCHAR(255),
    PRIMARY KEY (Nit_Empresa)
);

CREATE TABLE Servicio(
    Cod_Servicio INT AUTO_INCREMENT,
    Nombre_Servicio VARCHAR(50) NOT NULL,
    Descripcion_Servicio TEXT,
    Modalidad ENUM('Presencial', 'Virtual', 'Hibrida') NOT NULL DEFAULT 'Presencial',
    Requiere_Reserva BOOLEAN NOT NULL DEFAULT FALSE,
    Requisito VARCHAR(255),
    PRIMARY KEY (Cod_Servicio)
);

CREATE TABLE Rol(
    Cod_Rol INT AUTO_INCREMENT,
    Nombre_Rol VARCHAR(30) NOT NULL,
    Descripcion_Rol TEXT,
    Ambito ENUM('Plataforma', 'Empresa', 'Sede') NOT NULL,
    PRIMARY KEY (Cod_Rol)
);

CREATE TABLE Permiso(
    Cod_Permiso INT AUTO_INCREMENT,
    Modulo VARCHAR(30) NOT NULL,
    Accion ENUM('Crear', 'Consultar', 'Actualizar', 'Eliminar') NOT NULL,
    Descripcion_Permiso VARCHAR(255),
    PRIMARY KEY (Cod_Permiso)
);


-- SECCION DE EMPRESA, SEDES Y OFERTA DE SERVICIOS --

CREATE TABLE Sede(
    Cod_Sede INT AUTO_INCREMENT,
    Nombre_Sede VARCHAR(50) NOT NULL,
    Ciudad VARCHAR(40) NOT NULL,
    Direccion VARCHAR(150) NOT NULL,
    Telefono_Sede VARCHAR(15),
    Aforo_Max_Sede SMALLINT UNSIGNED,
    Nit_Empresa VARCHAR(15) NOT NULL,
    PRIMARY KEY (Cod_Sede),
    FOREIGN KEY (Nit_Empresa) REFERENCES Empresa(Nit_Empresa)
);

CREATE TABLE Plan(
    Cod_Plan INT AUTO_INCREMENT,
    Nombre_Plan VARCHAR(50) NOT NULL,
    Tipo_Plan VARCHAR(40),
    Duracion_Meses TINYINT UNSIGNED NOT NULL,
    Precio DECIMAL(12, 2) NOT NULL,
    Franja_Horaria VARCHAR(100),
    Nit_Empresa VARCHAR(15) NOT NULL,
    PRIMARY KEY (Cod_Plan),
    FOREIGN KEY (Nit_Empresa) REFERENCES Empresa(Nit_Empresa)
);

CREATE TABLE Espacio(
    Cod_Espacio INT AUTO_INCREMENT,
    Tipo_Espacio VARCHAR(30) NOT NULL,
    Aforo_Espacio SMALLINT UNSIGNED,
    Cod_Sede INT NOT NULL,
    PRIMARY KEY (Cod_Espacio),
    FOREIGN KEY (Cod_Sede) REFERENCES Sede(Cod_Sede)
);

CREATE TABLE Equipamiento(
    Serial VARCHAR(50),
    Nombre_Equipamiento VARCHAR(50) NOT NULL,
    Marca VARCHAR(40),
    Modelo VARCHAR(40),
    Estado_Equipamiento ENUM('Operativo', 'En mantenimiento', 'Fuera de servicio', 'Dado de baja') NOT NULL DEFAULT 'Operativo',
    Fecha_Compra DATE,
    Cod_Espacio INT NOT NULL,
    PRIMARY KEY (Serial),
    FOREIGN KEY (Cod_Espacio) REFERENCES Espacio(Cod_Espacio)
);

CREATE TABLE Mantenimiento (
    N_Reporte INT AUTO_INCREMENT,
    Fecha_Mantenimiento DATE NOT NULL,
    Descripcion_Mantenimiento TEXT,
    Costo DECIMAL(12, 2),
    Serial VARCHAR(50),
    PRIMARY KEY (N_Reporte, Serial),
    FOREIGN KEY (Serial) REFERENCES Equipamiento(Serial)
);


-- SECCION DE USUARIOS Y SEGURIDAD --

CREATE TABLE Usuario (
    Cod_Usuario INT AUTO_INCREMENT,
    Correo_Usuario VARCHAR(150) NOT NULL UNIQUE,
    Hash_Contrasena VARCHAR(255) NOT NULL,
    Estado_Usuario ENUM('Activo', 'Inactivo', 'Bloqueado') NOT NULL DEFAULT 'Activo',
    Fecha_Registro DATE NOT NULL,
    Ultimo_Ingreso DATETIME,
    Cod_Rol INT NOT NULL,
    Rol_Vigente BOOLEAN NOT NULL DEFAULT TRUE,
    Fecha_Asignacion_Rol DATE,
    PRIMARY KEY (Cod_Usuario),
    FOREIGN KEY (Cod_Rol) REFERENCES Rol(Cod_Rol)
);

CREATE TABLE Bitacora (
    Fecha_Hora_Ingreso DATETIME,
    Direccion_IP VARCHAR(45) NOT NULL,
    Dispositivo VARCHAR(255),
    Resultado ENUM('Exitoso', 'Fallido', 'Bloqueado') NOT NULL,
    Cod_Usuario INT,
    PRIMARY KEY (Fecha_Hora_Ingreso, Cod_Usuario),
    FOREIGN KEY (Cod_Usuario) REFERENCES Usuario(Cod_Usuario)
);


-- SECCION DE PERSONAL --

CREATE TABLE Empleado(
    Documento_Empleado VARCHAR(15),
    Nombre_Empleado VARCHAR(100) NOT NULL,
    Telefono_Empleado VARCHAR(15),
    Fecha_Ingreso DATE NOT NULL,
    Salario DECIMAL(12, 2) NOT NULL,
    Cod_Sede INT NOT NULL,
    Cod_Usuario INT NOT NULL UNIQUE,
    PRIMARY KEY (Documento_Empleado),
    FOREIGN KEY (Cod_Sede) REFERENCES Sede(Cod_Sede),
    FOREIGN KEY (Cod_Usuario) REFERENCES Usuario(Cod_Usuario)
);

CREATE TABLE Entrenador(
    Documento_Empleado VARCHAR(15),
    Especialidad VARCHAR(40),
    PRIMARY KEY (Documento_Empleado),
    FOREIGN KEY (Documento_Empleado) REFERENCES Empleado(Documento_Empleado)
);

CREATE TABLE Administrativo(
    Documento_Empleado VARCHAR(15),
    Area VARCHAR(40),
    PRIMARY KEY (Documento_Empleado),
    FOREIGN KEY (Documento_Empleado) REFERENCES Empleado(Documento_Empleado)
);


-- SECCION CLIENTES, MEMBRESIAS Y PAGOS --

CREATE TABLE Cliente(
    Documento_Cliente VARCHAR(15),
    Fecha_Nacimiento DATE,
    Correo_Cliente VARCHAR(150),
    RH ENUM('O+', 'O-', 'A+', 'A-', 'B+', 'B-', 'AB+', 'AB-'),
    Cod_Usuario INT UNIQUE,
    PRIMARY KEY (Documento_Cliente),
    FOREIGN KEY (Cod_Usuario) REFERENCES Usuario(Cod_Usuario)
);

CREATE TABLE Membresia(
    Cod_Membresia INT AUTO_INCREMENT,
    Fecha_Inicio DATE NOT NULL,
    Fecha_Fin DATE NOT NULL,
    Estado_Membresia ENUM('Activa', 'Vencida', 'Suspendida', 'Cancelada') NOT NULL DEFAULT 'Activa',
    Documento_Cliente VARCHAR(15) NOT NULL,
    Cod_Plan INT NOT NULL,
    PRIMARY KEY (Cod_Membresia),
    FOREIGN KEY (Documento_Cliente) REFERENCES Cliente(Documento_Cliente),
    FOREIGN KEY (Cod_Plan) REFERENCES Plan(Cod_Plan)
);

CREATE TABLE Pago(
    N_Factura INT AUTO_INCREMENT,
    Fecha_Pago DATE NOT NULL,
    Monto DECIMAL(12, 2) NOT NULL,
    Metodo_Pago ENUM('Efectivo', 'Tarjeta Debito', 'Tarjeta Credito', 'Transferencia', 'Nequi', 'Daviplata', 'PSE') NOT NULL,
    Estado_Pago ENUM('Pendiente', 'Aprobado', 'Rechazado', 'Anulado') NOT NULL DEFAULT 'Pendiente',
    Cod_Membresia INT NOT NULL,
    Documento_Empleado VARCHAR(15),
    PRIMARY KEY (N_Factura),
    FOREIGN KEY (Cod_Membresia) REFERENCES Membresia(Cod_Membresia),
    FOREIGN KEY (Documento_Empleado) REFERENCES Empleado(Documento_Empleado)
);

CREATE TABLE Acceso(
    Fecha_Hora_Entrada DATETIME,
    Fecha_Hora_Salida DATETIME,
    Cod_Membresia INT,
    Cod_Sede INT NOT NULL,
    PRIMARY KEY (Fecha_Hora_Entrada, Cod_Membresia),
    FOREIGN KEY (Cod_Membresia) REFERENCES Membresia(Cod_Membresia),
    FOREIGN KEY (Cod_Sede) REFERENCES Sede(Cod_Sede)
);

CREATE TABLE Nombres_Cliente(
    Nombre_Cliente VARCHAR(30),
    Documento_Cliente VARCHAR(15),
    PRIMARY KEY (Nombre_Cliente, Documento_Cliente),
    FOREIGN KEY (Documento_Cliente) REFERENCES Cliente(Documento_Cliente)
);

CREATE TABLE Apellidos_Cliente(
    Apellido_Cliente VARCHAR(30),
    Documento_Cliente VARCHAR(15),
    PRIMARY KEY (Apellido_Cliente, Documento_Cliente),
    FOREIGN KEY (Documento_Cliente) REFERENCES Cliente(Documento_Cliente)
);

CREATE TABLE Telefonos_Cliente(
    Telefono_Cliente VARCHAR(15),
    Documento_Cliente VARCHAR(15),
    PRIMARY KEY (Telefono_Cliente, Documento_Cliente),
    FOREIGN KEY (Documento_Cliente) REFERENCES Cliente(Documento_Cliente)
);

CREATE TABLE Restricciones_Cliente(
    Restriccion VARCHAR(100),
    Documento_Cliente VARCHAR(15),
    PRIMARY KEY (Restriccion, Documento_Cliente),
    FOREIGN KEY (Documento_Cliente) REFERENCES Cliente(Documento_Cliente)
);


-- LA QUE HACIA FALTA --

CREATE TABLE Sesion(
    Cod_Sesion INT AUTO_INCREMENT,
    Fecha_Sesion DATE NOT NULL,
    Hora_Inicio TIME NOT NULL,
    Hora_Fin TIME NOT NULL,
    Cupo_Max TINYINT UNSIGNED NOT NULL,
    Cod_Servicio INT NOT NULL,
    Cod_Espacio INT NOT NULL,
    Documento_Entrenador VARCHAR(15) NOT NULL,
    PRIMARY KEY (Cod_Sesion),
    FOREIGN KEY (Cod_Servicio) REFERENCES Servicio(Cod_Servicio),
    FOREIGN KEY (Cod_Espacio) REFERENCES Espacio(Cod_Espacio),
    FOREIGN KEY (Documento_Entrenador) REFERENCES Entrenador(Documento_Empleado)
);


-- TABLAS DE RELACIONES MUCHOS A MUCHOS --

CREATE TABLE Sede_Plan (
    Cod_Sede INT,
    Cod_Plan INT,
    PRIMARY KEY (Cod_Sede, Cod_Plan),
    FOREIGN KEY (Cod_Sede) REFERENCES Sede(Cod_Sede),
    FOREIGN KEY (Cod_Plan) REFERENCES Plan(Cod_Plan)
);

CREATE TABLE Servicio_Plan (
    Cod_Servicio INT,
    Cod_Plan INT,
    Cupo_Mensual SMALLINT UNSIGNED,
    Costo_Adicional DECIMAL(12, 2) NOT NULL DEFAULT 0,
    PRIMARY KEY (Cod_Servicio, Cod_Plan),
    FOREIGN KEY (Cod_Servicio) REFERENCES Servicio(Cod_Servicio),
    FOREIGN KEY (Cod_Plan) REFERENCES Plan(Cod_Plan)
);

CREATE TABLE Servicio_Sede (
    Cod_Servicio INT,
    Cod_Sede INT,
    Horario VARCHAR(100),
    PRIMARY KEY (Cod_Servicio, Cod_Sede),
    FOREIGN KEY (Cod_Servicio) REFERENCES Servicio(Cod_Servicio),
    FOREIGN KEY (Cod_Sede) REFERENCES Sede(Cod_Sede)
);

CREATE TABLE Sesion_Cliente (
    Cod_Sesion INT,
    Documento_Cliente VARCHAR(15),
    Fecha_Reserva DATE NOT NULL,
    Estado_Reserva ENUM('Confirmada', 'Cancelada', 'Asistio', 'No asistio') NOT NULL DEFAULT 'Confirmada',
    PRIMARY KEY (Cod_Sesion, Documento_Cliente),
    FOREIGN KEY (Cod_Sesion) REFERENCES Sesion(Cod_Sesion),
    FOREIGN KEY (Documento_Cliente) REFERENCES Cliente(Documento_Cliente)
);

CREATE TABLE Rol_Permiso (
    Cod_Rol INT,
    Cod_Permiso INT,
    PRIMARY KEY (Cod_Rol, Cod_Permiso),
    FOREIGN KEY (Cod_Rol) REFERENCES Rol(Cod_Rol),
    FOREIGN KEY (Cod_Permiso) REFERENCES Permiso(Cod_Permiso)
);
