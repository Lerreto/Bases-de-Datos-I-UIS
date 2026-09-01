# Entrega 1 — Modelo conceptual (E-R)

Primera entrega del proyecto **GymCore**: una plataforma que administra varias
empresas de gimnasios, cada una con múltiples sedes.

Esta entrega cubre el **modelo conceptual**: entender el dominio, revisar el
estado del arte y traducirlo a un modelo entidad-relación.

---

## 📄 Documento entregable

👉 **[`Entrega_Final_01/README.md`](Entrega_Final_01/README.md)**

Ese es el documento que se evalúa. Contiene los cuatro puntos exigidos:

| # | Sección |
|---|---------|
| 1 | Contexto del problema trabajado en la actividad de exploración |
| 2 | Consulta de tendencias actuales en el área del proyecto |
| 3 | Consulta de herramientas o sistemas similares con su análisis de funcionalidades |
| 4 | Modelo E-R del proyecto (cardinalidad y E-R extendido) |

Además del título del proyecto y los nombres y códigos de los integrantes.

---

## Estructura de la carpeta

```
Entrega_1/
├── Actividad_de_Exploracion/
│   ├── README.md          Enunciado, contexto y correcciones aplicadas
│   └── Solucion.md        Desarrollo de los 3 puntos de la actividad
├── Diagramas/
│   ├── README.md                       Inventario y notación de los diagramas
│   ├── Primera_Propuesta.jpg           Bosquejo inicial hecho a mano
│   ├── Modelo_Entidad_Relacion.drawio  Modelo E-R final (editable)
│   └── Modelo_Entidad_Relacion.png     Modelo E-R final (exportado)
├── Entrega_Final_01/
│   └── README.md          ► Documento entregable
└── README.md
```

---

## Recorrido de la entrega

1. **Actividad de exploración** — se levantaron los conceptos del dominio de un
   gimnasio: clientes, membresías, planes, pagos, servicios, sedes, horarios,
   reservas, entrenadores, equipamiento y control de acceso.
2. **Primera propuesta** — bosquejo inicial del modelo
   ([`Diagramas/Primera_Propuesta.jpg`](Diagramas/Primera_Propuesta.jpg)).
3. **Ampliación del alcance** — el problema pasó de "un gimnasio" a "una
   plataforma que administra varias cadenas de gimnasios", lo que introdujo
   `EMPRESA` como entidad raíz y convirtió a `SEDE` en entidad débil.
4. **Modelo E-R final** — 19 entidades, 24 relaciones y una especialización total
   y disjunta, en notación de Chen.

---

## Estado

| Elemento | Estado |
|----------|--------|
| Punto 1 — Contexto del problema | ✅ |
| Punto 2 — Tendencias actuales | ✅ |
| Punto 3 — Herramientas similares | ✅ |
| Punto 4 — Modelo E-R | ✅ |
| Diagrama `.drawio` + `.png` | ✅ |
