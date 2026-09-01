# Bases de Datos I — UIS

Repositorio de entregas de la asignatura **Bases de Datos I** de la Universidad
Industrial de Santander.

El proyecto del curso es **GymCore**, el diseño de una base de datos para una
plataforma que administra **varias empresas de gimnasios**, cada una con
**múltiples sedes**: membresías, control de acceso, servicios, personal,
equipamiento y facturación sobre un mismo modelo de datos.

---

## Integrantes

| Nombre completo | Código |
|-----------------|--------|
| Javier Steben Santana Blanco | 2251641 |
| Andrés Felipe Pilonieta Forero | 2250170 |
| Samuel Jose Niño Solano | 2250177 |
| José Alejandro Pinzón Forero | 2251257 |
| Juan Pablo Rueda Angarita | 2250160 |

---

## Estructura del repositorio

```
.
├── Entrega_1/                      Modelo conceptual (E-R)
│   ├── Actividad_de_Exploracion/   Actividad previa: conceptos y exploración del dominio
│   ├── Diagramas/                  Diagramas .drawio y sus exportaciones
│   └── Entrega_Final_01/           ► DOCUMENTO ENTREGABLE de la Entrega 1
├── Entrega_2/                      Modelo lógico (pendiente)
├── Entrega_3/                      Modelo físico e implementación (pendiente)
└── README.md
```

> `Trabajos/` contiene ejercicios y material de estudio personal. Está en el
> `.gitignore` a propósito: **no forma parte de las entregas**.

---

## Entregas

| Entrega | Contenido | Estado |
|---------|-----------|--------|
| [Entrega 1](Entrega_1/) | Contexto, tendencias, análisis de herramientas y **modelo E-R** | ✅ Completa |
| [Entrega 2](Entrega_2/) | Modelo lógico relacional y normalización | 🔲 Pendiente |
| [Entrega 3](Entrega_3/) | Modelo físico, DDL, carga de datos y consultas | 🔲 Pendiente |

**Documento a evaluar de la Entrega 1:**
[`Entrega_1/Entrega_Final_01/README.md`](Entrega_1/Entrega_Final_01/README.md)

---

## Cómo abrir los diagramas

Los modelos están en formato `.drawio`. Se pueden abrir con:

- **draw.io / diagrams.net en línea** — <https://app.diagrams.net> → *File → Open from → Device*
- **Aplicación de escritorio** — [drawio-desktop](https://github.com/jgraph/drawio-desktop)
- **VS Code** — extensión *Draw.io Integration* (`hediet.vscode-drawio`)

Cada diagrama tiene su exportación en `.png` o `.jpg` al lado, para verlo sin
instalar nada.

---

## Convenciones del repositorio

- Cada carpeta de entrega tiene su propio `README.md` que explica qué contiene.
- Los nombres de archivo van en `Snake_Case` y sin tildes.
- El diagrama editable (`.drawio`) es la **fuente de verdad**; la imagen exportada
  se regenera a partir de él y nunca se edita a mano.
- Los nombres de entidades, atributos y relaciones del modelo se escriben en
  español, en mayúsculas para entidades y con la primera letra en mayúscula para
  atributos.
