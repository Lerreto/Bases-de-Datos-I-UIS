# Actividad de exploración

Actividad previa a la Entrega 1. Su objetivo fue **entender el dominio** antes de
dibujar una sola entidad: qué conceptos existen en la gestión de un gimnasio, cómo
se comporta hoy el mercado y qué herramientas ya resuelven el problema.

---

## Enunciado

La actividad pedía tres puntos:

1. Identificar los **conceptos importantes y relevantes** de la temática asignada.
2. Consultar las **tendencias actuales** en dichos conceptos.
3. Consultar y analizar **al menos 2 herramientas existentes en el mercado** para
   el problema o situación asignado.

**Temática asignada:** gestión de gimnasios.

---

## Archivos

| Archivo | Contenido |
|---------|-----------|
| [`Solucion.md`](Solucion.md) | Desarrollo de los tres puntos de la actividad, revisado y ampliado. |

### Estructura de `Solucion.md`

| Sección | Contenido |
|---------|-----------|
| 1 | Conceptos importantes y relevantes de la temática (19 conceptos del dominio) |
| 2 | Tendencias actuales: del negocio y tecnológicas |
| 3 | Análisis de PerfectGym, Mindbody y Trainingym, con cuadro comparativo |
| 4 | *Anexo* — motores de base de datos considerados para la implementación |

---

## Correcciones aplicadas

La primera versión de esta actividad tenía dos problemas de fondo. Ambos se
corrigieron:

**1. El punto 3 respondía a la pregunta equivocada.** El análisis comparaba
**MySQL y PostgreSQL**, que son *sistemas gestores de bases de datos* — tecnología
de implementación, no herramientas del dominio. Lo que pide el punto es analizar
**sistemas que ya resuelven la gestión de gimnasios**.

La corrección no fue borrar ese trabajo, sino **reubicarlo**: la comparación de
motores pasó al **anexo (sección 4)**, correctamente etiquetada como decisión de
implementación, y el punto 3 se rehizo analizando **PerfectGym, Mindbody y
Trainingym**, con un cuadro comparativo de 12 funcionalidades. La elección del
motor se retomará en la [Entrega 3](../../Entrega_3/).

**2. El punto 2 era demasiado breve.** Se conservaron los ejemplos originales —la
*hora naranja* de Bodytech y el peso de Nequi en los pagos digitales— y se
ampliaron a siete tendencias del negocio y tecnológicas, con fuentes citadas.

---

## Del ejercicio a la entrega final

Esta actividad es el **insumo del punto 1** del documento entregable. Al pasar a la
Entrega 1, el alcance creció: la exploración se hizo pensando en *un* gimnasio,
mientras que el proyecto final modela una **plataforma multi-empresa y
multi-sede**. Eso obligó a:

- introducir `EMPRESA` como entidad raíz del modelo;
- convertir `SEDE` en entidad débil, identificada por la empresa;
- agregar el subsistema de acceso a la plataforma (`USUARIO`, `ROL`, `PERMISO`,
  `BITÁCORA`).

Los conceptos de *empresa o cadena* y de *cuentas de plataforma* se incorporaron al
punto 1 de `Solucion.md` para que quede alineado con el modelo final.

---

## Documento final

👉 [`../Entrega_Final_01/README.md`](../Entrega_Final_01/README.md)
