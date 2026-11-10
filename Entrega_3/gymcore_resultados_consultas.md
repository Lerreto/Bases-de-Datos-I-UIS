# Resultados de las consultas — GymCore

Salida de las 10 consultas de [`gymcore_consultas.sql`](gymcore_consultas.sql)
sobre los datos de [`gymcore_populate.sql`](gymcore_populate.sql), ejecutadas el
10 de noviembre de 2026 en MariaDB 13. El detalle de cada consulta está en el
[README de la entrega](README.md#consultas).

> **Nota:** las consultas 9 y 10 dependen de la fecha actual (`CURDATE()`), así
> que al correrlas otro día darán otros resultados.

---

## 1. Clientes y su plan

Une a cada cliente con sus nombres, apellidos, teléfonos y el plan de sus membresías.

<details>
<summary>Ver las 38 filas</summary>

| Nombre | Apellido | Telefono | Plan |
|---|---|---|---|
| Alejandro | Castellanos | 3189012345 | Fit Mensual |
| Mateo | Castellanos | 3189012345 | Fit Mensual |
| Alejandro | Pinto | 3189012345 | Fit Mensual |
| Mateo | Pinto | 3189012345 | Fit Mensual |
| Hernando | Pico | 3190123456 | Anual Total |
| Hernando | Pico | 3190123456 | Hora Valle |
| Hernando | Serrano | 3190123456 | Anual Total |
| Hernando | Serrano | 3190123456 | Hora Valle |
| David | Gómez | 3001234567 | Anual Total |
| Juan | Gómez | 3001234567 | Anual Total |
| David | Gómez | 6076432100 | Anual Total |
| Juan | Gómez | 6076432100 | Anual Total |
| David | Pérez | 3001234567 | Anual Total |
| Juan | Pérez | 3001234567 | Anual Total |
| David | Pérez | 6076432100 | Anual Total |
| Juan | Pérez | 6076432100 | Anual Total |
| Fernanda | Ardila | 3112345678 | Fit Mensual |
| María | Ardila | 3112345678 | Fit Mensual |
| Fernanda | López | 3112345678 | Fit Mensual |
| María | López | 3112345678 | Fit Mensual |
| Sebastián | Rincón | 3223456789 | Black Trimestral |
| Sebastián | Silva | 3223456789 | Black Trimestral |
| Gloria | Mendoza | 3134567890 | Hora Valle |
| Inés | Mendoza | 3134567890 | Hora Valle |
| Gloria | Mendoza | 6076358899 | Hora Valle |
| Inés | Mendoza | 6076358899 | Hora Valle |
| Gloria | Prada | 3134567890 | Hora Valle |
| Inés | Prada | 3134567890 | Hora Valle |
| Gloria | Prada | 6076358899 | Hora Valle |
| Inés | Prada | 6076358899 | Hora Valle |
| Andrés | Cárdenas | 3045678901 | Black Trimestral |
| Andrés | Ruiz | 3045678901 | Black Trimestral |
| Juliana | Lozano | 3156789012 | Pulso Mensual |
| Juliana | Vargas | 3156789012 | Pulso Mensual |
| Felipe | Ochoa | 3007890123 | Titan Semestral |
| Felipe | Restrepo | 3007890123 | Titan Semestral |
| Isabella | Cárdenas | 3178901234 | Box Mensual |
| Isabella | Rojas | 3178901234 | Box Mensual |

</details>

## 2. Ingresos por plan

Suma los pagos aprobados de cada plan, de mayor a menor.

| Plan | Total recaudado |
|---|---:|
| Anual Total | 1980000.00 |
| Black Trimestral | 599800.00 |
| Titan Semestral | 480000.00 |
| Fit Mensual | 179800.00 |
| Box Mensual | 149900.00 |
| Hora Valle | 119800.00 |
| Pulso Mensual | 99900.00 |

## 3. Ingresos por empresa

Suma los pagos aprobados de los planes de cada empresa, de mayor a menor.

| Empresa | Total facturado |
|---|---:|
| Iron Fit S.A.S. | 2879400.00 |
| Titan Training Center | 480000.00 |
| Vertice Box S.A.S. | 149900.00 |
| Pulso Gym S.A.S. | 99900.00 |

## 4. Sedes más visitadas

Cuenta los accesos registrados en cada sede.

| Sede | Cantidad de visitas |
|---|---:|
| Cabecera | 5 |
| Cañaveral | 2 |
| Chapinero | 1 |
| El Poblado | 1 |
| Provenza | 3 |
| Usaquén | 1 |

## 5. Top de horas más concurridas

Muestra las cinco horas del día con más ingresos.

| Hora | Total_Accesos |
|---:|---:|
| 6 | 3 |
| 18 | 2 |
| 10 | 2 |
| 8 | 1 |
| 5 | 1 |

## 6. Ocupación de sesiones

Muestra los cupos reservados y libres de cada sesión, sin contar las reservas canceladas.

| Cod_Sesion | Nombre_Servicio | Fecha_Sesion | Hora_Inicio | Cupo_Max | Cupos_Reservados | Cupos_Libres |
|---:|---|---|---|---:|---:|---:|
| 9 | Yoga | 2026-10-29 | 07:00:00 | 20 | 1 | 19 |
| 8 | Spinning | 2026-10-30 | 19:00:00 | 30 | 2 | 28 |
| 1 | Spinning | 2026-11-03 | 06:00:00 | 25 | 2 | 23 |
| 7 | Crossfit | 2026-11-03 | 18:00:00 | 15 | 1 | 14 |
| 2 | Spinning | 2026-11-03 | 19:00:00 | 30 | 1 | 29 |
| 3 | Yoga | 2026-11-04 | 07:00:00 | 20 | 1 | 19 |
| 5 | Natación | 2026-11-04 | 08:00:00 | 15 | 0 | 15 |
| 4 | Entrenamiento funcional | 2026-11-05 | 18:00:00 | 25 | 1 | 24 |
| 6 | Valoración física | 2026-11-07 | 09:00:00 | 1 | 1 | 0 |

## 7. Entrenadores con más sesiones

Lista a los entrenadores por sesiones dictadas, con sus asistencias.

| Documento_Empleado | Nombre_Empleado | Especialidad | Total_Sesiones | Total_Asistencias |
|---|---|---|---:|---:|
| 1095812233 | Laura Marcela Duarte Pinto | Spinning | 3 | 1 |
| 1102345987 | Daniela Sofía Ortiz Gómez | Yoga y pilates | 2 | 1 |
| 63542118 | Martha Cecilia Uribe Vargas | Natación | 2 | 0 |
| 1032478901 | Valentina Herrera Quintero | Crossfit | 1 | 0 |
| 1098765001 | Jhon Fredy Castro León | Entrenamiento funcional | 1 | 0 |

## 8. Equipos que requieren mantenimiento

Lista los equipos no operativos con su ubicación y el costo acumulado de reparaciones.

| Serial | Nombre_Equipamiento | Estado_Equipamiento | Tipo_Espacio | Nombre_Sede | Costo_Total_Reparaciones |
|---|---|---|---|---|---:|
| LF-TR-2021-1290 | Caminadora | Fuera de servicio | Zona de cardio | Cabecera | 1420000.00 |
| MX-RK-2024-0032 | Rack de sentadillas | En mantenimiento | Zona de pesas | Cabecera | 310000.00 |
| KS-BK-2022-0712 | Bicicleta de spinning | En mantenimiento | Salón de spinning | Cabecera | 140000.00 |
| C2-RW-2020-0098 | Remo | Dado de baja | Salón funcional | Cañaveral | 90000.00 |

## 9. Top 5 de clientes más fieles

Muestra los cinco clientes más antiguos con al menos un acceso en los últimos 30 días.

| Documento_Cliente | Nombres | Apellidos | Cliente_Desde | Dias_Antiguedad | Total_Membresias | Total_Accesos | Ultimo_Acceso |
|---|---|---|---|---:|---:|---:|---|
| 1098745612 | David Juan | Gómez Pérez | 2026-01-15 | 299 | 1 | 3 | 2026-10-31 08:00:00 |
| 1037456123 | Felipe | Ochoa Restrepo | 2026-06-01 | 162 | 1 | 1 | 2026-10-31 17:20:00 |
| 37896541 | Gloria Inés | Mendoza Prada | 2026-08-01 | 101 | 2 | 2 | 2026-10-29 10:30:00 |
| 1102789456 | Sebastián | Rincón Silva | 2026-09-01 | 70 | 1 | 2 | 2026-10-30 19:00:00 |
| 1020789654 | Juliana | Lozano Vargas | 2026-10-01 | 40 | 1 | 1 | 2026-10-30 06:00:00 |

## 10. Membresías a punto de vencer

Lista las membresías activas que terminan en los próximos 15 días.

| Documento_Cliente | Nombres | Apellidos | Nombre_Plan | Fecha_Fin | Dias_Restantes |
|---|---|---|---|---|---:|
| 1032156987 | Isabella | Cárdenas Rojas | Box Mensual | 2026-11-12 | 2 |
| 37896541 | Gloria Inés | Mendoza Prada | Hora Valle | 2026-11-20 | 10 |
| 1099234567 | Alejandro Mateo | Castellanos Pinto | Fit Mensual | 2026-11-25 | 15 |
