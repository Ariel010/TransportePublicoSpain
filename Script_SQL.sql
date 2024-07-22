Use transporte_publico;

#Verificar el contenido de las tablas:
SELECT * FROM rutas LIMIT 10;
SELECT * FROM tipos_transporte LIMIT 10;
SELECT * FROM regiones LIMIT 10;
SELECT * FROM viajes LIMIT 10;

#Contar el número de registros 
SELECT COUNT(*) FROM viajes;

#Distribución de viajes por tipo de transporte:
CREATE VIEW  viajes_por_tipo_de_transporte AS
SELECT t.Tipo_Transporte, COUNT(v.ID_Viaje) AS Numero_Viajes FROM viajes v
JOIN tipos_transporte t 
ON v.ID_Tipo_Transporte = t.ID_Tipo_Transporte
GROUP BY t.Tipo_Transporte;

#Número de pasajeros por región:
CREATE VIEW  pasajeros_por_region AS
SELECT r.Region, SUM(v.Numero_Pasajeros) AS Total_Pasajeros
FROM viajes v
JOIN regiones r ON v.ID_Region = r.ID_Region
GROUP BY r.Region;

#Duración promedio de viajes por hora:
CREATE VIEW  promedio_de_viajes_por_hora AS
SELECT Hora, ROUND(AVG(Duracion_Viaje_Minutos), 2) AS Duracion_Promedio
FROM viajes
GROUP BY Hora
ORDER BY Hora;

#Duración promedio de los viajes por ruta:
CREATE VIEW  promedio_de_los_viajes_por_ruta AS
SELECT ru.Ruta, ROUND(AVG(v.Duracion_Viaje_Minutos),2) AS Duracion_Promedio
FROM viajes v
JOIN rutas ru ON v.ID_Ruta = ru.ID_Ruta
GROUP BY ru.Ruta;

#Duración promedio de los viajes por tipo de transporte:
SELECT t.Tipo_Transporte, ROUND(AVG(v.Duracion_Viaje_Minutos), 2) AS Duracion_Promedio
FROM viajes v
JOIN tipos_transporte t ON v.ID_Tipo_Transporte = t.ID_Tipo_Transporte
GROUP BY t.Tipo_Transporte;

#Número de pasajeros por tipo de transporte:
SELECT t.Tipo_Transporte, SUM(v.Numero_Pasajeros) AS Total_Pasajeros
FROM viajes v
JOIN tipos_transporte t ON v.ID_Tipo_Transporte = t.ID_Tipo_Transporte
GROUP BY t.Tipo_Transporte;


#Retraso promedio por tipo de transporte:
SELECT t.Tipo_Transporte, ROUND(AVG(v.Retraso_Minutos),2) AS Retraso_Promedio
FROM viajes v
JOIN tipos_transporte t ON v.ID_Tipo_Transporte = t.ID_Tipo_Transporte
GROUP BY t.Tipo_Transporte;

#Retraso promedio por hora:
CREATE VIEW  retraso_promedio_por_hora AS
SELECT Hora, ROUND(AVG(Retraso_Minutos), 2) AS Retraso_Promedio
FROM viajes
GROUP BY Hora
ORDER BY Hora;

#Retraso promedio por región:
SELECT r.Region, ROUND(AVG(v.Retraso_Minutos), 2) AS Retraso_Promedio
FROM viajes v
JOIN regiones r ON v.ID_Region = r.ID_Region
GROUP BY r.Region;


#Número de viajes por día de la semana:
CREATE VIEW  viajes_por_dia_de_la_semana AS
SELECT v.Dia_Semana, COUNT(v.ID_Viaje) AS Numero_Viajes
FROM viajes v
GROUP BY v.Dia_Semana
ORDER BY FIELD(v.Dia_Semana, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');

#Número de viajes por mes:  # Mes de Marzo solo hay 11 dias
SELECT v.Mes, COUNT(v.ID_Viaje) AS Numero_Viajes
FROM viajes v
GROUP BY v.Mes
ORDER BY v.Mes;

#Número de viajes por hora del día:   # lo que seria la frecuencia de viajes por hora
CREATE VIEW  viajes_por_hora_del_dia AS
SELECT v.Hora, COUNT(v.ID_Viaje) AS Numero_Viajes
FROM viajes v
GROUP BY v.Hora
ORDER BY v.Hora;

#Número de pasajeros por hora:
CREATE VIEW  numero_de_pasajeros_por_hora AS
SELECT Hora, SUM(Numero_Pasajeros) AS Total_Pasajeros
FROM viajes
GROUP BY Hora
ORDER BY Hora;

CREATE VIEW  tabla_global AS
SELECT * FROM viajes








