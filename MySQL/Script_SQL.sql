Use transporte_publico;

#Verificar el contenido de las tablas:
SELECT * FROM rutas LIMIT 10;
SELECT * FROM tipos_transporte LIMIT 10;
SELECT * FROM regiones LIMIT 10;
SELECT * FROM viajes LIMIT 10;

#Contar el número de registros 
SELECT COUNT(ID_Viaje) FROM viajes;

#Numero de viajes por transporte ## ESTA EN EL RANGO DE 24672 Y 24825
SELECT t.Tipo_Transporte, COUNT(v.ID_Viaje) AS Numero_Viajes FROM viajes v
JOIN tipos_transporte t 
ON v.ID_Tipo_Transporte = t.ID_Tipo_Transporte
GROUP BY t.Tipo_Transporte;    

#Numero de pasajeros por region  ## Madrid	781177 ES LA REGION CON MAS NUMERO DE PASAJEROS Y EL OTRO EXTREMO ES Sevilla 762084
SELECT r.Region, SUM(v.Numero_Pasajeros) AS Total_Pasajeros
FROM viajes v
JOIN regiones r ON v.ID_Region = r.ID_Region
GROUP BY r.Region ORDER BY Total_Pasajeros ASC;

#Duracion de viajes promedio por hora  ## lOS VIAJES CON DURACION PROMEDIO MAS GRANDES ESTAN EN UNA FRANJA HORARIA ENTRE LAS 20 HS Y LAS 6 HS
SELECT Hora, ROUND(AVG(Duracion_Viaje_Minutos), 2) AS Duracion_Promedio
FROM viajes
GROUP BY Hora
ORDER BY Duracion_Promedio ASC;

##Duracion de viajes promedio por ruta 
## LA Duracion_Promedio MAS GRANDES SE DAN EN LAS RUTAS:
														# Valencia - Sevilla	368.09
														# Barcelona - Valencia	368.27
														# Malaga - Sevilla	369.39
														# Barcelona - Bilbao	369.85
SELECT ru.Ruta, ROUND(AVG(v.Duracion_Viaje_Minutos),2) AS Duracion_Promedio
FROM viajes v
JOIN rutas ru ON v.ID_Ruta = ru.ID_Ruta
GROUP BY ru.Ruta order by Duracion_Promedio ASC;

#Duración promedio de los viajes por tipo de transporte: # EL AUTOBUS ES EL TIPO DE TRANSPORTE QUE QUE TIENE UNA DURACION PROMEDIO MAYOR DE SUS VIAJES
SELECT t.Tipo_Transporte, ROUND(AVG(v.Duracion_Viaje_Minutos), 2) AS Duracion_Promedio
FROM viajes v
JOIN tipos_transporte t ON v.ID_Tipo_Transporte = t.ID_Tipo_Transporte
GROUP BY t.Tipo_Transporte;

#Número de pasajeros por tipo de transporte: # EL MEDIO DE TRANSPORTE MAS USADO POR NUMERO DE PASAJEROS ES EL TRANVIA CON 1353163 FRENTE AL METRO QUE ES EL MENOS USADO CON 1342970
SELECT t.Tipo_Transporte, SUM(v.Numero_Pasajeros) AS Total_Pasajeros
FROM viajes v
JOIN tipos_transporte t ON v.ID_Tipo_Transporte = t.ID_Tipo_Transporte
GROUP BY t.Tipo_Transporte;

#Retraso promedio por tipo de transporte: ## LOS RETRASOS PROMEDIOS SON MUY SIMILARES Y VAN DESDE EL Tren CON 59.11 MINUTOS EN PROMEDIO HASTA EL Tranvía CON 59.44 MINUTOS.
SELECT t.Tipo_Transporte, ROUND(AVG(v.Retraso_Minutos),2) AS Retraso_Promedio
FROM viajes v
JOIN tipos_transporte t ON v.ID_Tipo_Transporte = t.ID_Tipo_Transporte
GROUP BY t.Tipo_Transporte;

#Retraso promedio por región: ## EL RETRASO MAYOR SE DAN EN Barcelona CON 59.57 MINUTOS Y EL MENOR EN Madrid CON 59.00 MINUTOS
SELECT r.Region, ROUND(AVG(v.Retraso_Minutos), 2) AS Retraso_Promedio
FROM viajes v
JOIN regiones r ON v.ID_Region = r.ID_Region
GROUP BY r.Region order by Retraso_Promedio DESC;

#Cantidad de viajes por semana ## todos los dias existen 14256 viajes al dia excepto los Saturday donde hay Saturday 13464.
SELECT v.Dia_Semana, COUNT(v.ID_Viaje) AS Numero_Viajes
FROM viajes v
GROUP BY v.Dia_Semana
ORDER BY FIELD(v.Dia_Semana, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');

#Número de viajes por mes:  # Mes de Marzo solo hay 11 dias
SELECT v.Mes, COUNT(v.ID_Viaje) AS Numero_Viajes
FROM viajes v
GROUP BY v.Mes
ORDER BY v.Mes;

#Viajes por hora ## de 0 hs a 9 hs hay 4158 viajes u 4098/4099 en el resto de franja horaria.
SELECT v.Hora, COUNT(v.ID_Viaje) AS Numero_Viajes
FROM viajes v
GROUP BY v.Hora
ORDER BY v.Hora;

#Pasajeros por hora ## en horario de o,2 y 4 hs se da la mayor cantidad de pasajeros con 227998, 228273 y 228887 respectivamente.
SELECT Hora, SUM(Numero_Pasajeros) AS Total_Pasajeros
FROM viajes
GROUP BY Hora
ORDER BY Total_Pasajeros asc;




