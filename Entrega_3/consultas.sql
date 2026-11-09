-- 1 Clientes y su plan
select distinct NC.Nombre_Cliente as "Nombre", AC.Apellido_Cliente as "Apellido", TC.Telefono_Cliente as "Telefono", P.Nombre_Plan as "Plan"
from apellidos_cliente AC 
inner join telefonos_cliente TC on TC.Documento_Cliente = AC.Documento_Cliente
inner join Nombres_Cliente NC on NC.Documento_Cliente = TC.Documento_Cliente
inner join cliente C on C.Documento_Cliente = NC.Documento_Cliente
inner join Membresia M on M.Documento_Cliente = C.Documento_Cliente
inner join Plan P on P.Cod_Plan = M.Cod_Plan;

-- 2 Ingresos por plan
select Pl.Nombre_Plan as "Plan", sum(P.Monto) as "Total recaudado"
from Plan Pl
inner join Membresia M on M.Cod_Plan = Pl.Cod_Plan
inner join Pago P on P.Cod_Membresia = M.Cod_Membresia
where P.Estado_Pago = "Aprobado"
group by Pl.Nombre_Plan
order by sum(P.Monto) desc;

-- 3 Ingresos por empresa
select Em.Nombre_Empresa as "Empresa", sum(P.Monto) as "Total facturado" 
from Empresa Em
inner join Plan Pl on Em.Nit_Empresa = Pl.Nit_Empresa
inner join Membresia M on M.Cod_Plan = Pl.Cod_Plan
inner join Pago P on P.Cod_Membresia = M.Cod_Membresia
where P.Estado_Pago = "Aprobado"
group by Em.Nombre_Empresa
order by sum(P.Monto) desc;

-- 4 Sedes mas visitadas
select S.Nombre_Sede as "Sede", count(*) as "Cantidad de visitas"
from Sede S 
inner join Acceso A on A.Cod_Sede = S.Cod_Sede
group by S.Nombre_Sede;


--5. Top de horas mas transcurrida
SELECT HOUR(Fecha_Hora_Entrada) AS Hora,
       COUNT(*) AS Total_Accesos
FROM Acceso
GROUP BY HOUR(Fecha_Hora_Entrada)
ORDER BY Total_Accesos DESC
LIMIT 5;

--6. Ocupacion de sesiones
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

--7. Entrenador con mas sesiones
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

--8. Equipos que requieren matenimiento
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

--9. Top 5 clientes mas fieles, por la fecha de antiguedad y que sigan asistiendo para darles un premio
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

--10. Membresias a punto de vencer
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
