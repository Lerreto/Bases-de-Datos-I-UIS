# Entrega 3 — Base de datos en SQL y consultas

Tercera entrega del proyecto **GymCore**: una plataforma que administra varias
empresas de gimnasios, cada una con múltiples sedes.

En esta entrega construimos en SQL el modelo relacional de la segunda entrega
(**28 tablas**), lo cargamos con datos de prueba (**al menos 8 registros por
tabla**) y escribimos **10 consultas** pertinentes al negocio.

---

## Organización

| # | Archivo | Contenido |
|---|---------|-----------|
| 1 | [`gymcore.sql`](gymcore.sql) | Esquema: crea la base de datos y sus 28 tablas. |
| 2 | [`gymcore_populate.sql`](gymcore_populate.sql) | Carga de datos de prueba en todas las tablas. |
| 3 | [`gymcore_consultas.sql`](gymcore_consultas.sql) | Las 10 consultas, cada una con lo que hace y para qué sirve. |

---

## Cómo ejecutarlo

Los archivos se corren en el orden de la tabla anterior:

```bash
mysql -u root -p < gymcore.sql
mysql -u root -p < gymcore_populate.sql
mysql -u root -p -t < gymcore_consultas.sql
```

> **Atención:** `gymcore.sql` borra la base de datos `gymcore` si ya existe y
> la crea de cero.

---

## Consultas

| # | Consulta | Qué hace | Para qué sirve |
|---|----------|----------|----------------|
| 1 | Clientes y su plan | Une a cada cliente con sus nombres, apellidos, teléfonos y el plan de sus membresías. | Tener a la mano el contacto de los clientes junto con su plan. |
| 2 | Ingresos por plan | Suma los pagos aprobados de cada plan, de mayor a menor. | Saber qué planes dejan más dinero para promocionarlos o replantearlos. |
| 3 | Ingresos por empresa | Suma los pagos aprobados de los planes de cada empresa, de mayor a menor. | Comparar cuánto factura cada empresa dentro de la plataforma. |
| 4 | Sedes más visitadas | Cuenta los accesos registrados en cada sede. | Repartir personal y equipos según la demanda de cada sede. |
| 5 | Top de horas más concurridas | Muestra las cinco horas del día con más ingresos. | Programar clases y turnos del personal según las horas pico. |
| 6 | Ocupación de sesiones | Muestra los cupos reservados y libres de cada sesión, sin contar las reservas canceladas. | Abrir más horarios o reorganizar las clases con poca demanda. |
| 7 | Entrenadores con más sesiones | Lista a los entrenadores por sesiones dictadas, con sus asistencias. | Medir la carga de trabajo y la asistencia real a sus clases. |
| 8 | Equipos que requieren mantenimiento | Lista los equipos no operativos con su ubicación y el costo acumulado de reparaciones. | Priorizar reparaciones y decidir si conviene reemplazar un equipo. |
| 9 | Top 5 de clientes más fieles | Muestra los cinco clientes más antiguos con al menos un acceso en los últimos 30 días. | Elegir a quién premiar sin incluir a clientes que ya no asisten. |
| 10 | Membresías a punto de vencer | Lista las membresías activas que terminan en los próximos 15 días. | Contactar a esos clientes a tiempo para que renueven. |

> **Nota:** las consultas 9 y 10 dependen de la fecha actual (`CURDATE()`). Los
> datos de prueba tienen como referencia noviembre de 2026, así que con el
> tiempo estas dos consultas dejarán de devolver resultados.

---

## Guía de la presentación

Dónde está cada punto que pide la presentación final:

| # | Punto | Dónde está |
|---|-------|------------|
| 1 | Análisis de la situación | [Entrega 1, sección 1](../Entrega_1/Entrega_Final_01/README.md) |
| 2 | Modelo Entidad-Relación | [Diagrama corregido](../Entrega_2/Modelo_E-R/Modelo_Entidad_Relacion_Corregido.jpg) |
| 3 | Modelo relacional y normalización | [Entrega 2, modelo relacional](../Entrega_2/Modelo_Relacional/README.md) |
| 4 | Base de datos en SQL (esquema) | [`gymcore.sql`](gymcore.sql) |
| 5 | Carga de datos | [`gymcore_populate.sql`](gymcore_populate.sql) |
| 6 | 10 consultas | [`gymcore_consultas.sql`](gymcore_consultas.sql) |
