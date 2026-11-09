USE gymcore;


-- ------------------------------------------------------------------
-- 1. Clientes y su plan
-- Qué hace: une a cada cliente con sus nombres, apellidos, teléfonos
--           y el plan de sus membresías.
-- Para qué sirve: tener a la mano el contacto de los clientes junto
--                 con el plan que tienen contratado.
-- ------------------------------------------------------------------
select distinct NC.Nombre_Cliente as "Nombre", AC.Apellido_Cliente as "Apellido", TC.Telefono_Cliente as "Telefono", P.Nombre_Plan as "Plan"
from Apellidos_Cliente AC
inner join Telefonos_Cliente TC on TC.Documento_Cliente = AC.Documento_Cliente
inner join Nombres_Cliente NC on NC.Documento_Cliente = TC.Documento_Cliente
inner join Cliente C on C.Documento_Cliente = NC.Documento_Cliente
inner join Membresia M on M.Documento_Cliente = C.Documento_Cliente
inner join Plan P on P.Cod_Plan = M.Cod_Plan;


-- ------------------------------------------------------------------
-- 2. Ingresos por plan
-- Qué hace: suma los pagos aprobados de cada plan y los ordena de
--           mayor a menor recaudo.
-- Para qué sirve: saber qué planes dejan más dinero para decidir
--                 cuáles promocionar o replantear.
-- ------------------------------------------------------------------
select Pl.Nombre_Plan as "Plan", sum(P.Monto) as "Total recaudado"
from Plan Pl
inner join Membresia M on M.Cod_Plan = Pl.Cod_Plan
inner join Pago P on P.Cod_Membresia = M.Cod_Membresia
where P.Estado_Pago = "Aprobado"
group by Pl.Nombre_Plan
order by sum(P.Monto) desc;


-- ------------------------------------------------------------------
-- 3. Ingresos por empresa
-- Qué hace: suma los pagos aprobados de los planes de cada empresa y
--           las ordena de mayor a menor facturación.
-- Para qué sirve: comparar cuánto factura cada empresa de gimnasios
--                 dentro de la plataforma.
-- ------------------------------------------------------------------
select Em.Nombre_Empresa as "Empresa", sum(P.Monto) as "Total facturado"
from Empresa Em
inner join Plan Pl on Em.Nit_Empresa = Pl.Nit_Empresa
inner join Membresia M on M.Cod_Plan = Pl.Cod_Plan
inner join Pago P on P.Cod_Membresia = M.Cod_Membresia
where P.Estado_Pago = "Aprobado"
group by Em.Nombre_Empresa
order by sum(P.Monto) desc;


-- ------------------------------------------------------------------
-- 4. Sedes más visitadas
-- Qué hace: cuenta los accesos registrados en cada sede. Las sedes
--           sin ningún acceso no aparecen.
-- Para qué sirve: identificar las sedes con más movimiento para
--                 repartir personal y equipos según la demanda.
-- ------------------------------------------------------------------
select S.Nombre_Sede as "Sede", count(*) as "Cantidad de visitas"
from Sede S
inner join Acceso A on A.Cod_Sede = S.Cod_Sede
group by S.Nombre_Sede;


-- ------------------------------------------------------------------
-- 5. Top de horas más concurridas
-- Qué hace: agrupa los accesos por la hora de entrada y muestra las
--           cinco horas con más ingresos.
-- Para qué sirve: conocer las horas pico para programar clases y
--                 turnos del personal.
-- ------------------------------------------------------------------
SELECT HOUR(Fecha_Hora_Entrada) AS Hora,
       COUNT(*) AS Total_Accesos
FROM Acceso
GROUP BY HOUR(Fecha_Hora_Entrada)
ORDER BY Total_Accesos DESC
LIMIT 5;


-- ------------------------------------------------------------------
-- 6. Ocupación de sesiones
-- Qué hace: muestra por sesión los cupos reservados (sin contar las
--           reservas canceladas) y los cupos libres. El LEFT JOIN
--           conserva las sesiones que no tienen reservas.
-- Para qué sirve: ver qué clases están llenas o vacías para abrir más
--                 horarios o reorganizar las que tienen poca demanda.
-- ------------------------------------------------------------------
SELECT s.Cod_Sesion,
       sv.Nombre_Servicio,
       s.Fecha_Sesion,
       s.Hora_Inicio,
       s.Cupo_Max,
       COUNT(sc.Documento_Cliente) AS Cupos_Reservados,
       s.Cupo_Max - COUNT(sc.Documento_Cliente) AS Cupos_Libres
FROM Sesion s
JOIN Servicio sv ON sv.Cod_Servicio = s.Cod_Servicio
LEFT JOIN Sesion_Cliente sc
       ON sc.Cod_Sesion = s.Cod_Sesion
      AND sc.Estado_Reserva <> 'Cancelada'
GROUP BY s.Cod_Sesion, sv.Nombre_Servicio, s.Fecha_Sesion, s.Hora_Inicio, s.Cupo_Max
ORDER BY s.Fecha_Sesion, s.Hora_Inicio;


-- ------------------------------------------------------------------
-- 7. Entrenadores con más sesiones
-- Qué hace: lista a los entrenadores que han dictado sesiones, con su
--           total de sesiones y de asistencias, de mayor a menor.
-- Para qué sirve: medir la carga de trabajo de cada entrenador y
--                 cuántos clientes asisten realmente a sus clases.
-- ------------------------------------------------------------------
SELECT en.Documento_Empleado,
       emp.Nombre_Empleado,
       en.Especialidad,
       COUNT(DISTINCT s.Cod_Sesion) AS Total_Sesiones,
       COUNT(CASE WHEN sc.Estado_Reserva = 'Asistio' THEN 1 END) AS Total_Asistencias
FROM Entrenador en
JOIN Empleado emp ON emp.Documento_Empleado = en.Documento_Empleado
JOIN Sesion s ON s.Documento_Entrenador = en.Documento_Empleado
LEFT JOIN Sesion_Cliente sc ON sc.Cod_Sesion = s.Cod_Sesion
GROUP BY en.Documento_Empleado, emp.Nombre_Empleado, en.Especialidad
ORDER BY Total_Sesiones DESC, Total_Asistencias DESC;


-- ------------------------------------------------------------------
-- 8. Equipos que requieren mantenimiento
-- Qué hace: lista los equipos que no están operativos, con su espacio,
--           su sede y lo que se ha gastado en repararlos.
-- Para qué sirve: priorizar las reparaciones y decidir si conviene
--                 seguir arreglando un equipo o reemplazarlo.
-- ------------------------------------------------------------------
SELECT eq.Serial,
       eq.Nombre_Equipamiento,
       eq.Estado_Equipamiento,
       es.Tipo_Espacio,
       sd.Nombre_Sede,
       COALESCE(SUM(m.Costo), 0) AS Costo_Total_Reparaciones
FROM Equipamiento eq
JOIN Espacio es ON es.Cod_Espacio = eq.Cod_Espacio
JOIN Sede sd ON sd.Cod_Sede = es.Cod_Sede
LEFT JOIN Mantenimiento m ON m.Serial = eq.Serial
WHERE eq.Estado_Equipamiento IN ('En mantenimiento', 'Fuera de servicio', 'Dado de baja')
GROUP BY eq.Serial, eq.Nombre_Equipamiento, eq.Estado_Equipamiento,
         es.Tipo_Espacio, sd.Nombre_Sede
ORDER BY Costo_Total_Reparaciones DESC;


-- ------------------------------------------------------------------
-- 9. Top 5 de clientes más fieles
-- Qué hace: toma a los clientes con al menos un acceso en los últimos
--           30 días y muestra los cinco con más antigüedad.
-- Para qué sirve: elegir a quién darle un premio de fidelidad, sin
--                 incluir a clientes antiguos que ya no asisten.
-- ------------------------------------------------------------------
SELECT c.Documento_Cliente,
       (SELECT GROUP_CONCAT(Nombre_Cliente SEPARATOR ' ')
          FROM Nombres_Cliente
         WHERE Documento_Cliente = c.Documento_Cliente) AS Nombres,
       (SELECT GROUP_CONCAT(Apellido_Cliente SEPARATOR ' ')
          FROM Apellidos_Cliente
         WHERE Documento_Cliente = c.Documento_Cliente) AS Apellidos,
       MIN(m.Fecha_Inicio) AS Cliente_Desde,
       DATEDIFF(CURDATE(), MIN(m.Fecha_Inicio)) AS Dias_Antiguedad,
       COUNT(DISTINCT m.Cod_Membresia) AS Total_Membresias,
       COUNT(ac.Fecha_Hora_Entrada) AS Total_Accesos,
       MAX(ac.Fecha_Hora_Entrada) AS Ultimo_Acceso
FROM Cliente c
JOIN Membresia m ON m.Documento_Cliente = c.Documento_Cliente
JOIN Acceso ac ON ac.Cod_Membresia = m.Cod_Membresia
GROUP BY c.Documento_Cliente
HAVING MAX(ac.Fecha_Hora_Entrada) >= CURDATE() - INTERVAL 30 DAY
ORDER BY Dias_Antiguedad DESC
LIMIT 5;


-- ------------------------------------------------------------------
-- 10. Membresías a punto de vencer
-- Qué hace: lista las membresías activas que terminan en los próximos
--           15 días y cuántos días les quedan.
-- Para qué sirve: contactar a esos clientes a tiempo para que renueven.
-- ------------------------------------------------------------------
SELECT c.Documento_Cliente,
       (SELECT GROUP_CONCAT(Nombre_Cliente SEPARATOR ' ')
          FROM Nombres_Cliente
         WHERE Documento_Cliente = c.Documento_Cliente) AS Nombres,
       (SELECT GROUP_CONCAT(Apellido_Cliente SEPARATOR ' ')
          FROM Apellidos_Cliente
         WHERE Documento_Cliente = c.Documento_Cliente) AS Apellidos,
       p.Nombre_Plan,
       m.Fecha_Fin,
       DATEDIFF(m.Fecha_Fin, CURDATE()) AS Dias_Restantes
FROM Membresia m
JOIN Cliente c ON c.Documento_Cliente = m.Documento_Cliente
JOIN Plan p ON p.Cod_Plan = m.Cod_Plan
WHERE m.Estado_Membresia = 'Activa'
  AND m.Fecha_Fin BETWEEN CURDATE() AND CURDATE() + INTERVAL 15 DAY
ORDER BY m.Fecha_Fin;
