# Entrega 2 — Modelo lógico

Segunda entrega del proyecto **GymCore**.

> 🔲 **Pendiente.** Esta carpeta se llenará cuando se publique el enunciado.

---

## Alcance previsto

Traducción del modelo conceptual de la [Entrega 1](../Entrega_1/) a un **modelo
lógico relacional**:

- Paso del modelo E-R a tablas.
- Resolución de las relaciones N:M (`Cubre`, `Incluye`, `Presta`, `Posee`,
  `Otorga`, `Reserva`) mediante tablas intermedias.
- Tratamiento de las entidades débiles (`SEDE`, `ESPACIO`, `ACCESO`,
  `MANTENIMIENTO`, `BITÁCORA`) con claves primarias compuestas.
- Tratamiento de la especialización `EMPLEADO` → `ENTRENADOR` / `ADMINISTRATIVO`.
- Tratamiento de los atributos compuestos, multivaluados y derivados.
- Definición de claves primarias, foráneas y restricciones de integridad.
- Normalización hasta 3FN.

---

## Estructura propuesta

```
Entrega_2/
├── Diagramas/          Modelo relacional
├── Entrega_Final_02/   Documento entregable
└── README.md
```

---

## Punto de partida

- Modelo E-R: [`../Entrega_1/Diagramas/Modelo_Entidad_Relacion.drawio`](../Entrega_1/Diagramas/Modelo_Entidad_Relacion.drawio)
- Documento base: [`../Entrega_1/Entrega_Final_01/README.md`](../Entrega_1/Entrega_Final_01/README.md)
