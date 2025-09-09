-- SELECIONAR TODA A TABELA 
SELECT *
FROM uber_database

-- DISTANCIA MÉDIA PERCORRIDA POR CORRIDA. 
SELECT AVG(Ride_Distance) AS distancia_media_km
FROM uber_database
WHERE Ride_Distance IS NOT NULL;

-- RECEITA TOTAL E MÉDIA POR CORRIDA.
SELECT 
	SUM(Booking_Value) AS receita_total,
	AVG(Booking_Value) AS valor_medio_corrida
FROM uber_database
WHERE Booking_Value IS NOT NULL;

-- DISTRIBUIÇÃO POR METODO DE PAGAMENTO.
SELECT Payment_method, COUNT(*) AS qtd_corridas
FROM uber_database
WHERE Payment_Method IS NOT NULL
GROUP BY Payment_Method
ORDER BY qtd_corridas DESC;

-- CORRIDAS CANCELADAS PELO MOTORISTA E MOTIVOS.
SELECT Driver_Cancellation_Reason, COUNT(*) AS qtd_cancelamentos
FROM uber_database
WHERE Driver_Cancellation_Reason IS NOT NULL 
GROUP BY Driver_Cancellation_Reason 
ORDER BY qtd_cancelamentos DESC;

-- CORRIDAS INCOMPLETAS E MOTIVOS.
SELECT Incomplete_Rides_Reason, COUNT(*) AS qtd_incompletas
FROM uber_database
WHERE Incomplete_Rides_Reason IS NOT NULL 
GROUP BY Incomplete_Rides_Reason 
ORDER BY qtd_incompletas DESC;

-- AVALIAÇÃO MÉDIA DE MOTORISTAS E CLIENTES. 
SELECT 
	AVG(Driver_Ratings) AS media_motoristas,
	AVG(Customer_Rating) AS media_clientes
FROM uber_database
WHERE Driver_Ratings IS NOT NULL
AND Customer_Rating IS NOT NULL;

-- RELAÇÃO ENTRE VALOR DA CORRIDA E DISTÂNCIA. 
SELECT 
	Ride_Distance AS distancia_corrida,
	Booking_Value AS valor_corrida
FROM uber_database
WHERE Ride_Distance IS NOT NULL
AND Booking_Value IS NOT NULL
ORDER BY Ride_Distance DESC; 

-- QUANTIDADE TOTAL DE CORRIDAS.
SELECT COUNT(*) AS total_corridas
FROM uber_database

-- DISTRIBUIÇÃO DE CORRIDAS POR STATUS.
SELECT Booking_Status, COUNT(*) AS qtd_corridas
FROM uber_database
GROUP BY Booking_Status 
ORDER BY qtd_corridas DESC;

-- TIPOS DE VEICULOS MAIS USADOS.
SELECT Vehicle_Type, COUNT(*) AS qtd_corridas
FROM uber_database
GROUP BY Vehicle_Type
ORDER BY qtd_corridas DESC; 

-- LOCAIS DE PARTIDA MAIS FREQUENTES.
SELECT TOP 10 Pickup_Location, COUNT(*) AS qtd_partidas
FROM uber_database
GROUP BY Pickup_Location 
ORDER BY qtd_partidas DESC;

-- LOCAIS DE DESTINO MAIS FREQUENTES. 
SELECT TOP 10 Drop_Location, COUNT(*) AS qtd_destinos
FROM uber_database
GROUP BY Drop_Location 
ORDER BY qtd_destinos DESC; 

-- CANCELAMENTO POR CLIENTE.
SELECT Customer_ID, COUNT(*) AS qtd_cancelamentos
FROM uber_database
WHERE Cancelled_Rides_by_Customer IS NOT NULL 
GROUP BY Customer_ID 
ORDER BY qtd_cancelamentos DESC;

-- TEMPO MÉDIO DE ESPERA POR TIPO DE VEICULO.
SELECT Vehicle_Type, AVG(Avg_VTAT) AS tempo_medio_espera 
FROM uber_database
WHERE Avg_VTAT IS NOT NULL
GROUP BY  Vehicle_Type 
ORDER BY tempo_medio_espera DESC; 
