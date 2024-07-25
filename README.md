## Análisis del Transporte en España

### Descripción General
Este proyecto tiene como objetivo analizar y buscar posibles puntos a mejorar en el sistema de transporte público en España. Utilizando herramientas de análisis de datos como Power BI, Python y SQL, exploramos diversos aspectos de la red de transporte para identificar posibles áreas de mejora. El objetivo es proporcionar insights que ayuden a optimizar rutas, reducir retrasos y mejorar la eficiencia y satisfacción del usuario.

### Componentes del Proyecto

Análisis en Python (Transporte.ipynb): Un NoteBook de Jupyter que realiza limpieza, transformación y análisis de los datos de transporte. Se calculan y visualizan métricas clave como el retraso promedio, número de viajes por día y cantidad de pasajeros.

Script SQL (Script_SQL.sql): Consultas SQL que extraen, agregan y analizan datos de la base de datos de transporte. Estas consultas son esenciales para generar los conjuntos de datos utilizados tanto en el dashboard de Power BI como en el análisis en Python.

Visualización en Power BI: Un dashboard interactivo que proporciona una vista comprensiva de los datos de transporte, incluyendo el número de viajes, retrasos, tipos de transporte y distribución regional.

### Conjuntos de Datos

El proyecto utiliza los siguientes conjuntos de datos:

#Regiones: Información sobre las diferentes regiones de España.
#Rutas: Detalles de las diversas rutas de transporte.
#Tipo de Transporte: Listado de los tipos de transporte disponibles.
#Viajes: Registros de cada viaje, incluyendo la fecha, hora, tipo de transporte y cualquier retraso experimentado.

#### Dashboard de Power BI
El dashboard de Power BI incluye varias visualizaciones clave:

#Número de Viajes por Día de la Semana: Resalta la distribución de los viajes a lo largo de los días, identificando los tiempos de mayor demanda.
#Análisis de Retrasos por Tipo de Transporte: Muestra los retrasos promedio por tipo de transporte.
#Uso Regional: Muestra el número de viajes por región.
#Métricas de Pasajeros y Viajes: Proporciona insights sobre el número de pasajeros y la duración de los viajes, ayudando en la planificación de la capacidad.

#### NoteBook de Python
El NoteBook de Jupyter incluye:

#Carga y Limpieza de Datos: Prepara el conjunto de datos para el análisis, manejando valores faltantes y corrigiendo tipos de datos.
#Estadísticas Descriptivas: Calcula estadísticas básicas para entender la distribución de variables clave.
#Visualizaciones: Utiliza bibliotecas como Matplotlib y Seaborn para crear gráficos que complementan el dashboard de Power BI.
#Análisis Avanzado: Realiza análisis más profundos, como la correlación entre retrasos y rutas o tiempos específicos.

#### Script SQL
El script SQL (Script_SQL.sql) contiene consultas para:

#Agregación de Datos de Viajes: Resume el número de viajes y retrasos por día de la semana, tipo de transporte y región.
#Extracción de Métricas Clave: Recupera métricas importantes como el tiempo promedio de retraso y la cantidad de pasajeros.
#Creación de Vistas: Construye vistas de base de datos que simplifican el acceso a los datos agregados utilizados en los análisis de Python y Power BI.

### Instalación y Uso

#Power BI: Abre el archivo visualizacion.pbix en Power BI Desktop para explorar el dashboard interactivo.

#Python: Ejecuta el NoteBook Transporte.ipynb en Jupyter para realizar el análisis de datos. Asegúrate de tener instaladas las bibliotecas necesarias (pandas, numpy, matplotlib, seaborn).

#SQL: Ejecuta el archivo Script_SQL.sql en tu entorno SQL para generar las vistas y datos agregados necesarios.

### Conclusión
Este proyecto proporciona un análisis comprensivo del sistema de transporte público en España, utilizando Power BI para la visualización, Python para el análisis detallado de datos y SQL para la consulta eficiente de datos. Los insights obtenidos podrian ayudar a los planificadores de transporte y a los responsables de políticas a tomar decisiones informadas para mejorar la eficiencia y la fiabilidad de la red de transporte.