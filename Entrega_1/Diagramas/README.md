# Diagramas — Entrega 1

Modelos gráficos del proyecto **GymCore**.

---

## Inventario

| Archivo | Tipo | Descripción |
|---------|------|-------------|
| [`Modelo_Entidad_Relacion.drawio`](Modelo_Entidad_Relacion.drawio) | Editable | **Modelo E-R final** en notación de Chen. Fuente de verdad del modelo. |
| [`Modelo_Entidad_Relacion.png`](Modelo_Entidad_Relacion.png) | Imagen | Exportación del modelo final, para verlo sin instalar nada. |
| [`Primera_Propuesta.jpg`](Primera_Propuesta.jpg) | Imagen | Bosquejo inicial hecho durante la actividad de exploración. Se conserva como registro de la evolución del diseño. |

---


## Notación utilizada

El modelo está en **notación de Chen**. La leyenda va embebida en el propio
diagrama; se reproduce aquí como referencia rápida:

| Símbolo | Significado |
|---------|-------------|
| Rectángulo | Entidad fuerte |
| Rectángulo doble | Entidad débil |
| Rombo | Relación |
| Rombo doble | Relación identificadora (de una entidad débil) |
| Óvalo | Atributo |
| Óvalo con texto **subrayado** | Atributo clave (PK) |
| Óvalo con subrayado **punteado** | Clave parcial (de una entidad débil) |
| Óvalo doble | Atributo multivaluado |
| Óvalo punteado | Atributo derivado (calculado) |
| Triángulo `ISA` | Especialización / generalización |
| `(d)` | Especialización disjunta |
| `1`, `N`, `M` sobre las líneas | Cardinalidad de la relación |

---

## Contenido del modelo E-R

- **19 entidades** — 14 fuertes y 5 débiles (`SEDE`, `ESPACIO`, `ACCESO`,
  `MANTENIMIENTO`, `BITÁCORA`).
- **24 relaciones** — 4 de ellas con atributos propios.
- **1 especialización** total y disjunta: `EMPLEADO` → `ENTRENADOR` /
  `ADMINISTRATIVO`.
- Un **subsistema de plataforma** (`USUARIO`, `ROL`, `PERMISO`, `BITÁCORA`),
  señalado con un recuadro en el diagrama.

