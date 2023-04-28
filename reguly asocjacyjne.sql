USE mgr;
--define parameters
DECLARE @param1_co float;
DECLARE @param2_co float;
DECLARE @param1_temp float;
DECLARE @param2_temp float;
DECLARE @rules_count float;
DECLARE @confidence_t float;
DECLARE @database_count float;
SET @param1_co = '0';
SET @param2_co = '400';
SET @param1_temp = '10';
SET @param2_temp = '24';
--@rules_count = count X,Y = (CO AND TEMP)
SET @rules_count = (SELECT  count(*) from [dbo].[air_pollution] P inner join  [dbo].[air_weather] W on P.id_station=W.id_station where 	P.id_station=W.id_station and W.id_measurement = P.id_measurement AND (P.co>=@param1_co AND P.co<=@param2_co)AND (W.temp>=@param1_temp AND W.temp<=@param2_temp))
--@confidence_t = count X = (CO)
SET @confidence_t = (SELECT count(*) from [dbo].[air_pollution] P inner join  [dbo].[air_weather] W on P.id_station=W.id_station where 	P.id_station=W.id_station and W.id_measurement = P.id_measurement AND (P.co>=@param1_co AND P.co<=@param2_co))
SET @database_count = (SELECT  count(*) from [dbo].[air_pollution] P inner join  [dbo].[air_weather] W on P.id_station=W.id_station where P.id_station=W.id_station and W.id_measurement = P.id_measurement)


select TOP 1
T.regula,
T.support,
T.confidence,
pm10_PARAM = '<'+CAST(MIN(T.pm10)as varchar)+'; '+CAST(MAX(T.pm10)as varchar)+'>',
pm25_PARAM = '<'+CAST(MIN(T.pm2_5)as varchar)+'; '+CAST(MAX(T.pm2_5)as varchar)+'>',
nh3_PARAM = '<'+CAST(MIN(T.nh3)as varchar)+'; '+CAST(MAX(T.nh3)as varchar)+'>',
no_PARAM = '<'+CAST(MIN(T.no)as varchar)+'; '+CAST(MAX(T.no)as varchar)+'>',
no2_PARAM = '<'+CAST(MIN(T.no2)as varchar)+'; '+CAST(MAX(T.no2)as varchar)+'>',
o3_PARAM = '<'+CAST(MIN(T.o3)as varchar)+'; '+CAST(MAX(T.o3)as varchar)+'>',
so2_PARAM = '<'+CAST(MIN(T.so2)as varchar)+'; '+CAST(MAX(T.so2)as varchar)+'>',
T.database_count 
from(
	select
		P.id_measurement,
		P.co,
		P.nh3,
		P.no,
		P.no2,
		P.o3,
		P.pm10,
		P.pm2_5,
		P.so2,
		W.humidity,
		W.temp,
		W.pressure,
		W.id_station,
		support = CAST(ROUND((@rules_count/@database_count)*100,2) as varchar)+'%' ,
		regula = 'CO<'+CAST(@param1_co AS varchar)+';'+CAST(@param2_co as varchar)+'>, '+'TEMP<'+CAST(@param1_temp as varchar)+';'+CAST(@param2_temp as varchar)+'>',
		confidence = CAST(ROUND((@rules_count/@confidence_t)*100,2) as varchar) + '%',
		rules_count = @rules_count,
		database_count = @database_count,
		confidence_t = @confidence_t
	from [dbo].[air_pollution] P
		inner join  [dbo].[air_weather] W on P.id_station=W.id_station
	where 
		P.id_station=W.id_station and W.id_measurement = P.id_measurement AND
		(P.co>=@param1_co AND P.co<=@param2_co) AND
		(W.temp>=@param1_temp AND W.temp<=@param2_temp)
	group by
		P.id_measurement,
		P.co,
		P.nh3,
		P.no,
		P.no2,
		P.o3,
		P.pm10,
		P.pm2_5,
		P.so2,
		W.humidity,
		W.temp,
		W.pressure,
		W.id_station
		) T 
group by 
T.regula,
T.support,
T.confidence,
T.database_count 