# Actividad de exploración — Gestión de gimnasios

Temática asignada: **gestión de gimnasios**. Proyecto: **GymCore**, una plataforma
que administra varias empresas de gimnasios, cada una con múltiples sedes.

---

## 1.) Conceptos importantes y relevantes en la temática

Para la gestión de una red de gimnasios se deben considerar los siguientes conceptos:

- **Empresa o cadena:** Organización propietaria de los gimnasios (por ejemplo Smart Fit o Bodytech). Es el nivel más alto del dominio: una misma plataforma puede administrar varias empresas, y la información de una no debe mezclarse con la de otra.
- **Usuarios o clientes:** Personas registradas en el gimnasio. De ellas se almacenan datos personales, información de contacto, estado de afiliación y restricciones médicas relevantes.
- **Membresías:** Acuerdos que permiten a los clientes acceder al gimnasio bajo una discriminación. Pueden ser mensuales, trimestrales, semestrales o anuales; también pueden ser por membresías de estudiante, membresía VIP o cliente natural.
- **Planes y tarifas:** Precio a pagar asociado a cada membresía, de acuerdo a la duración, beneficios, límites de uso y promociones. Un plan también define **qué sedes cubre**: hay planes válidos en una sola sede y planes válidos en toda la red.
- **Pagos y facturación:** Registro de pagos, fechas de vencimiento, métodos de pago, descuentos, saldos pendientes y comprobantes.
- **Tipos de pago:** Ya sea pago en efectivo, transferencias bancarias o tarjeta.
- **Servicios:** Actividades ofrecidas por el gimnasio, por ejemplo: cardio, clases grupales, valoración física y entrenamiento personalizado.
- **Sedes y espacios:** Instalaciones donde se prestan los servicios, como zonas de pesas, salones de clases, áreas de cardio, vestidores y consultorios.
- **Horarios:** Franjas de funcionamiento del gimnasio y disponibilidad de espacios, servicios y entrenadores.
- **Reservas:** Inscripciones de los clientes a clases, valoraciones o sesiones especiales. Permiten controlar los cupos disponibles y las cancelaciones.
- **Sesiones especiales:** Actividades que requieren programación individual o condiciones particulares, como entrenamientos personalizados, evaluaciones físicas o asesorías nutricionales.
- **Entrenadores de planta:** Profesionales disponibles durante determinados turnos para orientar de manera general a los clientes y supervisar el uso adecuado de los equipos.
- **Entrenadores personales:** Profesionales contratados para acompañar de forma individual a un cliente mediante sesiones, objetivos y planes de entrenamiento específicos.
- **Equipamiento:** Máquinas, pesas y demás elementos utilizados para entrenar. Se debe conocer su ubicación, estado y disponibilidad.
- **Mantenimiento de equipos:** Consulta sobre el estado y mantenimiento de los equipos, así como su tiempo de último mantenimiento.
- **Control de acceso y asistencia:** Registro de entradas y salidas de los clientes para validar membresías activas, conocer la frecuencia de uso y controlar la capacidad del gimnasio.
- **Aforo:** Número máximo de personas permitido en una sede, espacio o clase durante una franja horaria.
- **Personal administrativo:** Empleados responsables de la atención al cliente, el registro de membresías, los pagos y la operación general del gimnasio.
- **Cuentas de plataforma, roles y permisos:** Credenciales con las que clientes y empleados ingresan al sistema, y control de qué puede hacer cada quien según su rol.

---

## 2.) Tendencias actuales en dichos conceptos

### 2.1 Tendencias del negocio

**Membresías flexibles y segmentadas.** Actualmente se presentan las membresías como una opción popular mediante la cual el gimnasio ofrece servicios y tarifas a elección y comodidad del cliente. Por dar un ejemplo: Bodytech ofrece una membresía *hora naranja* para entrenar en una franja horaria especial —"lunes a jueves de 11:00 am a 4:00 pm y de 8:30 pm al cierre"— para acomodarse a las preferencias horarias del usuario. Smart Fit segmenta por nivel de beneficios con sus planes Fit, Smart y Black, cuyas tarifas en 2026 van desde $69.900 hasta $119.900 mensuales.

**Modelo low-cost de alto volumen.** Smart Fit llegó a Colombia en 2016 y hoy supera las 200 sedes en el país. Con tarifas bajas, el margen por cliente es reducido, de modo que el negocio depende de automatizar la operación y de medir con precisión la ocupación de cada sede.

**Expansión multi-sede y multi-país.** Bodytech opera más de 170 sedes entre Colombia y Chile, con cerca de 300.000 afiliados. Esto obliga a que el sistema soporte varias sedes, varias ciudades y reglas de cobertura distintas según el plan contratado.

**Pagos digitales.** Otra tendencia común en estos últimos años es pagar la mayoría de servicios o productos por transferencia bancaria. Según la revista *Semana*, con 27 millones de usuarios Nequi supera a Bancolombia en número de clientes, por lo cual se considera pertinente ofrecer también este tipo de servicio a los usuarios. El método de pago, entonces, debe ser un dato estructurado y no un texto libre.

**Retención por encima de captación.** El indicador que hoy siguen las cadenas no es cuántos clientes entran, sino cuántos se van (*churn*). Esto exige guardar el historial de asistencia de cada cliente, no solo el estado de su membresía.

### 2.2 Tendencias tecnológicas

**Control de acceso biométrico.** La huella dactilar, el reconocimiento facial y el código QR están reemplazando al carné físico en los torniquetes. Cada ingreso genera un registro con fecha y hora exactas, que sirve tanto para validar la membresía como para medir la asistencia.

**Aplicaciones móviles para el socio.** Reserva de clases, consulta de saldo, renovación de la membresía y recordatorios automáticos desde el celular. Esto implica que el cliente necesita una cuenta de usuario dentro de la plataforma.

**Dispositivos wearables.** Relojes y pulseras inteligentes monitorean la actividad física del usuario y aportan datos que pueden cruzarse con los del gimnasio.

**Personalización basada en datos.** Recomendación automática de rutinas y de clases a partir del historial del cliente. Sin un historial almacenado, no hay personalización posible.

**Inteligencia artificial aplicada a la retención.** Predicción del abandono de clientes y de la ocupación por franja horaria, calculada sobre los registros de acceso y de reservas.

**Realidad virtual y aumentada.** Clases inmersivas y ciclo indoor interactivo, que se comportan como servicios con una modalidad propia dentro del catálogo.

**Analítica operativa.** Tableros de ocupación, facturación y uso de equipos, consultados por sede y en tiempo real.

---

## 3.) Consultar y analizar al menos 2 herramientas existentes en el mercado para el problema o situación asignado

Se analizaron tres plataformas comerciales que ya resuelven la gestión de gimnasios, escogidas para cubrir distintos perfiles del mercado: cadena grande, ecosistema consolidado y producto con presencia en habla hispana.

### Herramienta 1: PerfectGym

Plataforma de nivel *enterprise* diseñada específicamente para **cadenas y clubes multi-sede**. Es la referencia más cercana al problema planteado en este proyecto.

**Funcionalidades**

- Gestión del ciclo de vida completo de la membresía: venta, renovación, congelación y cancelación.
- Facturación recurrente automatizada y conciliación de pagos.
- Control de acceso integrado con torniquetes y lectores biométricos.
- Programación de clases con gestión de cupos y listas de espera.
- CRM y analítica orientada a la retención de clientes.
- Aplicación móvil de marca blanca para el socio.
- Administración centralizada de la cadena, con reportes por sede.

### Herramienta 2: Mindbody

Una de las plataformas más consolidadas del sector del fitness y el bienestar, orientada a operadores grandes y multi-sede. Su fortaleza es el ecosistema de integraciones y el mercado de reservas para el usuario final.

**Funcionalidades**

- Agenda y reservas de clases y de servicios individuales.
- Gestión de membresías, paquetes de sesiones y bonos.
- Procesamiento de pagos y punto de venta.
- Módulo de marketing y campañas de retención.
- Amplio catálogo de integraciones con aplicaciones de terceros.
- Reportes de negocio por local.

### Herramienta 3: Trainingym

Plataforma con fuerte presencia en el mercado hispanohablante, orientada a la experiencia del socio y a la personalización mediante inteligencia artificial.

**Funcionalidades**

- Aplicación del socio con rutinas personalizadas y recomendaciones automáticas.
- Seguimiento del progreso y valoraciones físicas.
- Gestión de membresías, reservas y comunicación con el cliente.
- Analítica de uso y de satisfacción.
- Check-in digital y control de aforo.

### Análisis comparativo

| Funcionalidad | PerfectGym | Mindbody | Trainingym |
|---------------|:----------:|:--------:|:----------:|
| Multi-empresa (varias cadenas) | ✗ | ✗ | ✗ |
| Multi-sede | ✔ | ✔ | ✔ |
| Gestión de membresías y planes | ✔ | ✔ | ✔ |
| Cobertura del plan por sede | ✔ | Parcial | Parcial |
| Pagos y facturación | ✔ | ✔ | ✔ |
| Control de acceso / torniquete | ✔ | Parcial | ✔ |
| Reserva de clases y cupos | ✔ | ✔ | ✔ |
| Gestión de espacios y aforo | ✔ | Parcial | ✔ |
| Inventario y mantenimiento de equipos | ✔ | ✗ | Parcial |
| Gestión de personal por sede | ✔ | ✔ | ✔ |
| Roles y permisos | ✔ | ✔ | ✔ |
| Aplicación móvil del socio | ✔ | ✔ | ✔ |

*Parcial* indica que la plataforma cubre la funcionalidad de forma limitada o mediante integración con un tercero.

### Conclusiones

1. **Ninguna de las plataformas revisadas administra varias empresas.** Todas asumen un único operador con varias sedes. Poder gestionar varias cadenas sobre una misma base de datos es lo que diferencia a GymCore, y explica que la entidad `EMPRESA` sea la raíz del modelo.
2. **El control de acceso y el inventario de equipos son el punto débil del mercado.** Solo las plataformas de nivel *enterprise* los cubren bien; incluirlos desde el modelo es una decisión deliberada del proyecto.
3. **Todas separan el producto comercial de la instancia contratada**, es decir, el *plan* de la *membresía*. El modelo del proyecto replica esa separación.
4. **La reserva no es un simple vínculo entre cliente y clase:** lleva datos propios como la fecha y el estado. Eso justifica modelarla como una relación con atributos.

---

## 4.) Anexo — Motores de base de datos considerados para la implementación

> Este anexo **no responde al punto 3**. Las herramientas del punto 3 son sistemas
> que resuelven el problema del dominio (la gestión de gimnasios); los motores que
> siguen son la tecnología con la que se implementará el modelo. Se dejan
> documentados aquí porque la decisión se retomará en la **Entrega 3**.

**Opción 1: MySQL**

MySQL es uno de los sistemas gestores de bases de datos relacionales más utilizados en el mundo. Es de código abierto, ofrece un buen rendimiento y es ampliamente empleado en aplicaciones web y sistemas de gestión empresarial.

**Características**
- Base de datos relacional.
- Utiliza el lenguaje SQL.
- Soporta claves primarias y foráneas.
- Permite transacciones e integridad referencial.
- Compatible con múltiples sistemas operativos.
- Gratuito en su edición Community.

**Opción 2: PostgreSQL**

PostgreSQL es un sistema gestor de bases de datos relacionales de código abierto reconocido por su robustez, seguridad y cumplimiento de los estándares SQL.

**Características**
- Alta estabilidad.
- Soporte para transacciones complejas.
- Integridad de datos avanzada.
- Excelente manejo de grandes volúmenes de información.
- Permite funciones, procedimientos almacenados y disparadores (triggers).

**Lectura para el proyecto.** Varias reglas de negocio de GymCore no se pueden expresar en el modelo E-R y deberán implementarse como restricciones activas: que un acceso solo sea válido si el plan cubre esa sede, o que el cupo de una sesión no supere el aforo del espacio. El soporte de disparadores y procedimientos almacenados es, por tanto, un criterio de peso al momento de elegir el motor.

---

## Referencias

- Trainingym. *Tendencias tecnológicas en la industria del fitness.* <https://blog.trainingym.com/tendencias-tecnologicas-en-la-industria-del-fitness>
- Resamania. *13 tendencias fitness 2026 que los gimnasios deben conocer.* <https://resamania.es/blog/tendencias-fitness/>
- G2. *Evaluation of the 8 Best Gym Management Software (2026).* <https://learn.g2.com/best-gym-management-software>
- 1Club. *Best Gym Management Software 2026 — Compare 10 Leading Platforms.* <https://1club.ai/blog/best-gym-management-software-2026>
- El Colombiano. *Smart Fit y Bodytech mandan en el mercado de gimnasios en Colombia.* <https://www.elcolombiano.com/negocios/smart-fit-bodytech-mandan-en-mercado-de-gimnasios-en-colombia-CC21988208>
- El Tiempo. *¿Cuánto vale inscribirse al gimnasio en 2026? Tarifas de Bodytech, Spinning Center y Smart Fit.* <https://www.eltiempo.com/cultura/gente/cuanto-vale-inscribirse-al-gimnasio-en-2026-estas-son-las-tarifas-de-bodytech-spinning-center-y-smartfit-3522055>
- Bodytech Colombia. *Sitio oficial.* <https://bodytech.com.co/>
