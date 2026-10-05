# GymCore — Modelo relacional normalizado

**Entrega 2 — Bases de Datos I**
Universidad Industrial de Santander · Escuela de Ingeniería de Sistemas e Informática

> A partir del modelo E-R de la primera entrega (con las cardinalidades
> corregidas), construimos el **modelo relacional** de GymCore: **28 tablas**
> con su llave primaria, sus llaves foráneas y el tipo de dato de cada columna,
> normalizado **hasta la quinta forma normal (5FN)**.

---

## Integrantes del grupo

| # | Nombre completo | Código |
|---|-----------------|--------|
| 1 | Javier Steben Santana Blanco | 2251641 |
| 2 | Andrés Felipe Pilonieta Forero | 2250170 |
| 3 | Samuel Jose Niño Solano | 2250177 |
| 4 | José Alejandro Pinzón Forero | 2251257 |
| 5 | Juan Pablo Rueda Angarita | 2250160 |

---

## Archivos

| Archivo | Ruta | Descripción |
|---------|------|-------------|
| Modelo relacional | [`Entrega_2/Modelo_Relacional/Modelo_Relacional.xlsx`](./Modelo_Relacional.xlsx) | Hoja *Modelo Relacional*: las 28 tablas con llave, atributo y tipo de dato. Hoja *Llaves foráneas*: cada FK con la tabla y columna a la que apunta y la relación del diagrama E-R de la que sale. |
| Informe de normalización (PDF) | [`Entrega_2/Modelo_Relacional/Informe_Normalizacion.pdf`](./Informe_Normalizacion.pdf) | Informe de aplicación de los pasos de normalización. |
| Informe de normalización (editable) | [`Entrega_2/Modelo_Relacional/Informe_Normalizacion.docx`](./Informe_Normalizacion.docx) | Versión editable del informe. |
| Diagrama E-R corregido | [`Entrega_2/Modelo_E-R/`](../Modelo_E-R/) | Diagrama del que partimos y nota sobre el cambio de cardinalidades. |

---

## Contenido

1. [Paso del modelo E-R al modelo relacional](#1-paso-del-modelo-e-r-al-modelo-relacional)
2. [Modelo relacional](#2-modelo-relacional)
3. [Normalización](#3-normalización)

---

## 1. Paso del modelo E-R al modelo relacional

Antes de normalizar, transformamos el diagrama E-R en tablas con estas reglas:

| Elemento del E-R | Cómo lo pasamos a tablas | Ejemplo |
|------------------|--------------------------|---------|
| Entidad | Una tabla con su llave primaria (PK). | `Empresa`, `Cliente` |
| Relación 1:N | La llave foránea (FK) va en la tabla del lado con cardinalidad 1:1. | `Sede` recibe `Nit_Empresa` |
| Relación 1:1 | La FK va en el lado de participación total. | `Empleado` y `Cliente` reciben `Cod_Usuario` |
| Relación N:M | Una tabla intermedia cuya PK son las FK de las dos entidades, con los atributos propios de la relación. | `Servicio_Plan` (`Cupo_Mensual`, `Costo_Adicional`) |
| Entidad débil | PK compuesta por la llave de la entidad de la que depende y su atributo discriminante. | `Acceso`, `Mantenimiento`, `Bitacora` |
| Especialización | Una tabla por subtipo, cuya PK es a la vez FK hacia el supertipo. | `Entrenador`, `Administrativo` |
| Atributos de una relación 1:N | Van en la tabla que recibe la FK. | `Usuario` (`Fecha_Asignacion_Rol`, `Rol_Vigente`) |

También unificamos los nombres de las columnas: sin tildes ni ñ, con palabras
separadas por guion bajo y con el nombre de la entidad en los atributos que se
repetían (`Nombre_Sede`, `Estado_Pago`, `Documento_Cliente`). Cada FK se llama
igual que la PK a la que apunta, salvo `Documento_Entrenador` en `Sesion`, que
nombramos así para dejar claro que solo puede ser un entrenador.

---

## 2. Modelo relacional

El modelo completo, con el tipo de dato de cada columna, está en
[`Modelo_Relacional.xlsx`](./Modelo_Relacional.xlsx). Aquí lo resumimos en
notación de esquema: la **PK va en negrita** y las FK van en *cursiva*.

**Dominios utilizados:** `int`, `bigint`, `float`, `string`, `boolean`,
`date`, `time` y `datetime`.

### 2.1 Empresa, sedes y oferta de servicios

| Tabla | Esquema |
|-------|---------|
| **Empresa** | (**Nit_Empresa**, Nombre_Empresa, Telefono_Empresa, Sitio_Web) |
| **Sede** | (**Cod_Sede**, Nombre_Sede, Ciudad, Direccion, Telefono_Sede, Aforo_Max_Sede, *Nit_Empresa*) |
| **Plan** | (**Cod_Plan**, Nombre_Plan, Tipo_Plan, Duracion_Meses, Precio, Franja_Horaria, *Nit_Empresa*) |
| **Servicio** | (**Cod_Servicio**, Nombre_Servicio, Descripcion_Servicio, Modalidad, Requiere_Reserva, Requisito) |
| **Espacio** | (**Cod_Espacio**, Tipo_Espacio, Aforo_Espacio, *Cod_Sede*) |
| **Equipamiento** | (**Serial**, Nombre_Equipamiento, Marca, Modelo, Estado_Equipamiento, Fecha_Compra, *Cod_Espacio*) |
| **Mantenimiento** | (***Serial***, **N_Reporte**, Fecha_Mantenimiento, Descripcion_Mantenimiento, Costo) |
| **Sesion** | (**Cod_Sesion**, Fecha_Sesion, Hora_Inicio, Hora_Fin, Cupo_Max, *Cod_Servicio*, *Cod_Espacio*, *Documento_Entrenador*) |

### 2.2 Clientes, membresías y pagos

| Tabla | Esquema |
|-------|---------|
| **Cliente** | (**Documento_Cliente**, Fecha_Nacimiento, Correo_Cliente, RH, *Cod_Usuario*) |
| **Nombres_Cliente** | (**Nombre_Cliente**, ***Documento_Cliente***) |
| **Apellidos_Cliente** | (**Apellido_Cliente**, ***Documento_Cliente***) |
| **Telefonos_Cliente** | (**Telefono_Cliente**, ***Documento_Cliente***) |
| **Restricciones_Cliente** | (**Restriccion**, ***Documento_Cliente***) |
| **Membresia** | (**Cod_Membresia**, Fecha_Inicio, Fecha_Fin, Estado_Membresia, *Documento_Cliente*, *Cod_Plan*) |
| **Pago** | (**N_Factura**, Fecha_Pago, Monto, Metodo_Pago, Estado_Pago, *Cod_Membresia*, *Documento_Empleado*) |
| **Acceso** | (***Cod_Membresia***, **Fecha_Hora_Entrada**, Fecha_Hora_Salida, *Cod_Sede*) |

### 2.3 Personal

| Tabla | Esquema |
|-------|---------|
| **Empleado** | (**Documento_Empleado**, Nombre_Empleado, Telefono_Empleado, Fecha_Ingreso, Salario, *Cod_Sede*, *Cod_Usuario*) |
| **Entrenador** | (***Documento_Empleado***, Especialidad) |
| **Administrativo** | (***Documento_Empleado***, Area) |

### 2.4 Usuarios y seguridad

| Tabla | Esquema |
|-------|---------|
| **Usuario** | (**Cod_Usuario**, Correo_Usuario, Hash_Contrasena, Estado_Usuario, Fecha_Registro, Ultimo_Ingreso, *Cod_Rol*, Rol_Vigente, Fecha_Asignacion_Rol) |
| **Bitacora** | (***Cod_Usuario***, **Fecha_Hora_Ingreso**, Direccion_IP, Dispositivo, Resultado) |
| **Rol** | (**Cod_Rol**, Nombre_Rol, Descripcion_Rol, Ambito) |
| **Permiso** | (**Cod_Permiso**, Modulo, Accion, Descripcion_Permiso) |

### 2.5 Tablas de relaciones muchos a muchos (N:M)

| Tabla | Esquema | Relación del E-R |
|-------|---------|------------------|
| **Sede_Plan** | (***Cod_Sede***, ***Cod_Plan***) | Cubre |
| **Servicio_Plan** | (***Cod_Servicio***, ***Cod_Plan***, Cupo_Mensual, Costo_Adicional) | Incluye |
| **Servicio_Sede** | (***Cod_Servicio***, ***Cod_Sede***, Horario) | Presta |
| **Sesion_Cliente** | (***Cod_Sesion***, ***Documento_Cliente***, Fecha_Reserva, Estado_Reserva) | Reserva |
| **Rol_Permiso** | (***Cod_Rol***, ***Cod_Permiso***) | Otorga |

---

## 3. Normalización

El paso a paso de cada forma normal, con ejemplos de antes y después, está en el
[informe de normalización](./Informe_Normalizacion.pdf). Este es el resumen:

| Forma normal | ¿Cumple? | Qué hicimos |
|--------------|:--------:|-------------|
| **1FN** | ✅ | Pasamos los atributos multivaluados del cliente (nombres, apellidos, teléfonos y restricciones) a tablas propias y verificamos que todas las tablas tengan PK. |
| **2FN** | ✅ | Revisamos las tablas con llave compuesta y verificamos que sus atributos dependan de toda la llave. Por ejemplo, no guardamos `Nombre_Servicio` en `Servicio_Plan`. |
| **3FN** | ✅ | Eliminamos dependencias transitivas: `Pago` guarda `Documento_Empleado` pero no el documento del cliente, que se obtiene a través de la membresía. Las tablas solo guardan FK hacia otras entidades, nunca sus datos descriptivos. |
| **FNBC** | ✅ | Comprobamos que los determinantes adicionales (`Correo_Usuario`, `Cod_Usuario` en `Empleado` y `Cliente`, `Modulo` + `Accion`) son llaves candidatas. |
| **4FN** | ✅ | Dejamos los atributos multivaluados independientes en tablas separadas para no generar combinaciones repetidas. |
| **5FN** | ✅ | Resolvimos el triángulo `Plan`–`Sede`–`Servicio` con tres tablas binarias (`Sede_Plan`, `Servicio_Plan`, `Servicio_Sede`) que al unirse no generan combinaciones falsas. |
| **6FN** | ❌ | Decidimos no aplicarla: pasaríamos de 28 a más de 90 tablas y las consultas necesitarían demasiados JOIN sin aportar beneficios para la aplicación. |

**Conclusión:** nuestro modelo relacional final tiene **28 tablas** y cumple
**hasta la quinta forma normal**, que consideramos la forma normal adecuada para
el proyecto.
