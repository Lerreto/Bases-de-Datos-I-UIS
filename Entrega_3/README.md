# Entrega 3 — Modelo físico e implementación

Tercera entrega del proyecto **GymCore**.

> 🔲 **Pendiente.** Esta carpeta se llenará cuando se publique el enunciado.

---

## Alcance previsto

Implementación del modelo lógico de la [Entrega 2](../Entrega_2/) sobre un motor
de base de datos real:

- Selección y justificación del SGBD. Punto de partida: el anexo
  [Motores de base de datos considerados](../Entrega_1/Actividad_de_Exploracion/Solucion.md#4-anexo--motores-de-base-de-datos-considerados-para-la-implementación)
  de la actividad de exploración (MySQL vs. PostgreSQL).
- Scripts **DDL**: creación de tablas, claves, índices y restricciones.
- Scripts **DML**: carga de datos de prueba.
- Consultas **SQL** que respondan las preguntas de negocio planteadas en la
  Entrega 1 (ocupación por franja horaria, membresías por vencer, facturación por
  sede, equipos sin mantenimiento, clientes en riesgo de deserción).
- Vistas, procedimientos almacenados y disparadores para las reglas de integridad
  que no se pueden expresar en el modelo E-R.

---

## Estructura propuesta

```
Entrega_3/
├── SQL/
│   ├── 01_ddl.sql       Creación del esquema
│   ├── 02_datos.sql     Datos de prueba
│   └── 03_consultas.sql Consultas de negocio
├── Entrega_Final_03/    Documento entregable
└── README.md
```

---

## Punto de partida

- Modelo lógico: [`../Entrega_2/`](../Entrega_2/)
- Modelo E-R: [`../Entrega_1/Diagramas/Modelo_Entidad_Relacion.drawio`](../Entrega_1/Diagramas/Modelo_Entidad_Relacion.drawio)
