CREATE PROCEDURE generate_rules
AS 
--clear association_rules table
DELETE FROM [dbo].[association_rules];
--config
DECLARE @elem_rules1 varchar(1); --how much elements rules do you want? 1 means yes 0 no
SET @elem_rules1 = '1' 
DECLARE @elem_rules2 varchar(1);
SET @elem_rules2 = '1'   
DECLARE @elem_rules3 varchar(1);
SET @elem_rules3 = '1'   
DECLARE @elem_rules4 varchar(1);
SET @elem_rules4 = '1'   
DECLARE @elem_rules5 varchar(1);
SET @elem_rules5 = '1'   
DECLARE @elem_rules6 varchar(1);
SET @elem_rules6 = '1'   
DECLARE @elem_rules7 varchar(1);
SET @elem_rules7 = '1'   
DECLARE @elem_rules8 varchar(1);
SET @elem_rules8 = '1'   
DECLARE @elem_rules9 varchar(1);
SET @elem_rules9 = '1'   
DECLARE @elem_rules10 varchar(1);
SET @elem_rules10 = '1'   
DECLARE @elem_rules11 varchar(1);
SET @elem_rules11 = '1'   

--define parameters for 1 elem rules
DECLARE @rules_count1 float;
DECLARE @confidence_t1 float;
DECLARE @database_count1 float;
DECLARE @param1_pm10 float;
DECLARE @param2_pm10 float;
SET @param1_pm10 = '100';
SET @param2_pm10 = '200';
--@rules_count = count X,Y = (CO AND TEMP)
SET @rules_count1 = (SELECT  count(*) from [dbo].[air_pollution] P inner join  [dbo].[air_weather] W on P.id_station=W.id_station where 	P.id_station=W.id_station and W.id_measurement = P.id_measurement AND (P.co>=@param1_pm10 AND P.co<=@param2_pm10))
--@confidence_t = count X = (CO)
SET @confidence_t1 = (SELECT count(*) from [dbo].[air_pollution] P inner join  [dbo].[air_weather] W on P.id_station=W.id_station where 	P.id_station=W.id_station and W.id_measurement = P.id_measurement AND (P.co>=@param1_pm10 AND P.co<=@param2_pm10))
SET @database_count1 = (SELECT  count(*) from [dbo].[air_pollution] P inner join  [dbo].[air_weather] W on P.id_station=W.id_station where P.id_station=W.id_station and W.id_measurement = P.id_measurement)

--define parameters for 2 elem rules
DECLARE @param1_co2 float;
DECLARE @param2_co2 float;
DECLARE @param1_temp2 float;
DECLARE @param2_temp2 float;
DECLARE @rules_count2 float;
DECLARE @confidence_t2 float;
DECLARE @database_count2 float;
SET @param1_co2 = '0';
SET @param2_co2 = '400';
SET @param1_temp2 = '10';
SET @param2_temp2 = '24';
--@rules_count = count X,Y = (CO AND TEMP)
SET @rules_count2 = (SELECT  count(*) from [dbo].[air_pollution] P inner join  [dbo].[air_weather] W on P.id_station=W.id_station where 	P.id_station=W.id_station and W.id_measurement = P.id_measurement AND (P.co>=@param1_co2 AND P.co<=@param2_co2)AND (W.temp>=@param1_temp2 AND W.temp<=@param2_temp2))
--@confidence_t = count X = (CO)
SET @confidence_t2 = (SELECT count(*) from [dbo].[air_pollution] P inner join  [dbo].[air_weather] W on P.id_station=W.id_station where 	P.id_station=W.id_station and W.id_measurement = P.id_measurement AND (P.co>=@param1_co2 AND P.co<=@param2_co2)AND (W.temp>=@param1_temp2 AND W.temp<=@param2_temp2))
SET @database_count2 = (SELECT  count(*) from [dbo].[air_pollution] P inner join  [dbo].[air_weather] W on P.id_station=W.id_station where P.id_station=W.id_station and W.id_measurement = P.id_measurement)

--define parameters for 3 elem rules
DECLARE @rules_count3 float;
DECLARE @confidence_t3 float;
DECLARE @database_count3 float;
DECLARE @param1_hum3 float;
DECLARE @param2_hum3 float;
DECLARE @param1_temp23 float;
DECLARE @param2_temp23 float;
DECLARE @param1_pm253 float;
DECLARE @param2_pm253 float;
SET @param1_hum3 = '70' ;
SET @param2_hum3 = '100' ;
SET @param1_temp23 = '0' ;
SET @param2_temp23 = '30' ;
SET @param1_pm253 = '0' ;
SET @param2_pm253 = '50';
--@rules_count = count X,Y = (CO AND TEMP)
SET @rules_count3 = (SELECT  count(*) from [dbo].[air_pollution] P inner join  [dbo].[air_weather] W on P.id_station=W.id_station where 	P.id_station=W.id_station and W.id_measurement = P.id_measurement AND (w.humidity>=@param1_hum3 AND W.humidity<=@param2_hum3)AND (W.temp>=@param1_temp23 AND W.temp<=@param2_temp23) AND (P.pm2_5>=@param1_pm253 AND P.pm2_5<=@param2_pm253))
--@confidence_t = count X = (CO)
SET @confidence_t3 = (SELECT count(*) from [dbo].[air_pollution] P inner join  [dbo].[air_weather] W on P.id_station=W.id_station where 	P.id_station=W.id_station and W.id_measurement = P.id_measurement AND (w.humidity>=@param1_hum3 AND W.humidity<=@param2_hum3))
SET @database_count3 = (SELECT  count(*) from [dbo].[air_pollution] P inner join  [dbo].[air_weather] W on P.id_station=W.id_station where P.id_station=W.id_station and W.id_measurement = P.id_measurement)

--define parameters for 4 elem rules
DECLARE @database_count4 float;
DECLARE @rules_count4 float;
DECLARE @confidence_t4 float;
DECLARE @param1_hum4 float;
DECLARE @param2_hum4 float;
DECLARE @param1_temp4 float;
DECLARE @param2_temp4 float;
DECLARE @param1_pm254 float;
DECLARE @param2_pm254 float;
DECLARE @param1_pm104 float;
DECLARE @param2_pm104 float;
SET @param1_pm104 ='0';
SET @param2_pm104 ='990';
SET @param1_hum4 = '0' ;
SET @param2_hum4 = '97' ;
SET @param1_temp4 = '0' ;
SET @param2_temp4 = '40' ;
SET @param1_pm254 = '0' ;
SET @param2_pm254 = '999';
--@rules_count = count X,Y = (CO AND TEMP)
SET @rules_count4 = (SELECT  count(*) from [dbo].[air_pollution] P inner join  [dbo].[air_weather] W on P.id_station=W.id_station where 	P.id_station=W.id_station and W.id_measurement = P.id_measurement AND (w.humidity>=@param1_hum4 AND W.humidity<=@param2_hum4)AND (W.temp>=@param1_temp4 AND W.temp<=@param2_temp4) AND (P.pm2_5>=@param1_pm254 AND P.pm2_5<=@param2_pm254))
--@confidence_t = count X = (CO)
SET @confidence_t4 = (SELECT count(*) from [dbo].[air_pollution] P inner join  [dbo].[air_weather] W on P.id_station=W.id_station where 	P.id_station=W.id_station and W.id_measurement = P.id_measurement AND (w.humidity>=@param1_hum4 AND W.humidity<=@param2_hum4))
SET @database_count4 = (SELECT  count(*) from [dbo].[air_pollution] P inner join  [dbo].[air_weather] W on P.id_station=W.id_station where P.id_station=W.id_station and W.id_measurement = P.id_measurement)

--define parameters for 5 elem rules
DECLARE @database_count5 float;
DECLARE @rules_count5 float;
DECLARE @confidence_t5 float;
DECLARE @param1_hum5 float;
DECLARE @param2_hum5 float;
DECLARE @param1_temp5 float;
DECLARE @param2_temp5 float;
DECLARE @param1_pm255 float;
DECLARE @param2_pm255 float;
DECLARE @param1_pm105 float;
DECLARE @param2_pm105 float;
DECLARE @param1_no5 float;
DECLARE @param2_no5 float;
SET @param1_pm105 ='0';
SET @param2_pm105 ='10';
SET @param1_hum5 = '0' ;
SET @param2_hum5 = '100' ;
SET @param1_temp5 = '-10' ;
SET @param2_temp5 = '5' ;
SET @param1_pm255 = '0' ;
SET @param2_pm255 = '50';
SET @param1_no5 = '0';
SET @param2_no5 = '98';
--@rules_count = count X,Y = (CO AND TEMP)
SET @rules_count5 = (SELECT  count(*) from [dbo].[air_pollution] P inner join  [dbo].[air_weather] W on P.id_station=W.id_station where 	P.id_station=W.id_station and W.id_measurement = P.id_measurement AND (w.humidity>=@param1_hum5 AND W.humidity<=@param2_hum5)AND (W.temp>=@param1_temp5 AND W.temp<=@param2_temp5) AND (P.pm2_5>=@param1_pm255 AND P.pm2_5<=@param2_pm255))
--@confidence_t = count X = (CO)
SET @confidence_t5 = (SELECT count(*) from [dbo].[air_pollution] P inner join  [dbo].[air_weather] W on P.id_station=W.id_station where 	P.id_station=W.id_station and W.id_measurement = P.id_measurement AND (w.humidity>=@param1_hum5 AND W.humidity<=@param2_hum5))
SET @database_count5 = (SELECT  count(*) from [dbo].[air_pollution] P inner join  [dbo].[air_weather] W on P.id_station=W.id_station where P.id_station=W.id_station and W.id_measurement = P.id_measurement)

--define parameters for 6 elem rules
DECLARE @database_count6 float;
DECLARE @rules_count6 float;
DECLARE @confidence_t6 float;
DECLARE @param1_hum6 float;
DECLARE @param2_hum6 float;
DECLARE @param1_temp6 float;
DECLARE @param2_temp6 float;
DECLARE @param1_pm256 float;
DECLARE @param2_pm256 float;
DECLARE @param1_pm106 float;
DECLARE @param2_pm106 float;
DECLARE @param1_no6 float;
DECLARE @param2_no6 float;
DECLARE @param1_no26 float;
DECLARE @param2_no26 float;
SET @param1_pm106 ='0';
SET @param2_pm106 ='50';
SET @param1_hum6 = '40' ;
SET @param2_hum6 = '100' ;
SET @param1_temp6 = '0' ;
SET @param2_temp6 = '15' ;
SET @param1_pm256 = '0' ;
SET @param2_pm256 = '300';
SET @param1_no6 = '0';
SET @param2_no6 = '300';
SET @param1_no26 = '50';
SET @param2_no26 = '99';
--@rules_count = count X,Y = (CO AND TEMP)
SET @rules_count6 = (SELECT  count(*) from [dbo].[air_pollution] P inner join  [dbo].[air_weather] W on P.id_station=W.id_station where 	P.id_station=W.id_station and W.id_measurement = P.id_measurement AND (w.humidity>=@param1_hum6 AND W.humidity<=@param2_hum6)AND (W.temp>=@param1_temp2 AND W.temp<=@param2_temp2) AND (P.pm2_5>=@param1_pm256 AND P.pm2_5<=@param2_pm256))
--@confidence_t = count X = (CO)
SET @confidence_t6 = (SELECT count(*) from [dbo].[air_pollution] P inner join  [dbo].[air_weather] W on P.id_station=W.id_station where 	P.id_station=W.id_station and W.id_measurement = P.id_measurement AND (w.humidity>=@param1_hum6 AND W.humidity<=@param2_hum6))
SET @database_count6 = (SELECT  count(*) from [dbo].[air_pollution] P inner join  [dbo].[air_weather] W on P.id_station=W.id_station where P.id_station=W.id_station and W.id_measurement = P.id_measurement)

--define parameters for 7 elem rules
DECLARE @database_count7 float;
DECLARE @rules_count7 float;
DECLARE @confidence_t7 float;
DECLARE @param1_hum7 float;
DECLARE @param2_hum7 float;
DECLARE @param1_temp7 float;
DECLARE @param2_temp7 float;
DECLARE @param1_pm257 float;
DECLARE @param2_pm257 float;
DECLARE @param1_pm107 float;
DECLARE @param2_pm107 float;
DECLARE @param1_no7 float;
DECLARE @param2_no7 float;
DECLARE @param1_no27 float;
DECLARE @param2_no27 float;
DECLARE @param1_o37 float;
DECLARE @param2_o37 float;
SET @param1_pm107 ='0';
SET @param2_pm107 ='50';
SET @param1_hum7 = '20' ;
SET @param2_hum7 = '80' ;
SET @param1_temp7 = '0' ;
SET @param2_temp7 = '25' ;
SET @param1_pm257 = '0' ;
SET @param2_pm257 = '30';
SET @param1_no7 = '0';
SET @param2_no7 = '100';
SET @param1_no27 = '80';
SET @param2_no27 = '125';
SET @param1_o37 = '0';
SET @param2_o37 = '1000';
--@rules_count = count X,Y = (CO AND TEMP)
SET @rules_count7 = (SELECT  count(*) from [dbo].[air_pollution] P inner join  [dbo].[air_weather] W on P.id_station=W.id_station where 	P.id_station=W.id_station and W.id_measurement = P.id_measurement AND (w.humidity>=@param1_hum7 AND W.humidity<=@param2_hum7)AND (W.temp>=@param1_temp7 AND W.temp<=@param2_temp7) AND (P.pm2_5>=@param1_pm257 AND P.pm2_5<=@param2_pm257))
--@confidence_t = count X = (CO)
SET @confidence_t7 = (SELECT count(*) from [dbo].[air_pollution] P inner join  [dbo].[air_weather] W on P.id_station=W.id_station where 	P.id_station=W.id_station and W.id_measurement = P.id_measurement AND (w.humidity>=@param1_hum7 AND W.humidity<=@param2_hum7))
SET @database_count7 = (SELECT  count(*) from [dbo].[air_pollution] P inner join  [dbo].[air_weather] W on P.id_station=W.id_station where P.id_station=W.id_station and W.id_measurement = P.id_measurement)

--define parameters for 8 elem rules
DECLARE @database_count8 float;
DECLARE @rules_count8 float;
DECLARE @confidence_t8 float;
DECLARE @param1_hum8 float;
DECLARE @param2_hum8 float;
DECLARE @param1_temp8 float;
DECLARE @param2_temp8 float;
DECLARE @param1_pm258 float;
DECLARE @param2_pm258 float;
DECLARE @param1_pm108 float;
DECLARE @param2_pm108 float;
DECLARE @param1_no8 float;
DECLARE @param2_no8 float;
DECLARE @param1_no28 float;
DECLARE @param2_no28 float;
DECLARE @param1_o38 float;
DECLARE @param2_o38 float;
DECLARE @param1_so28 float;
DECLARE @param2_so28 float;
SET @param1_pm108 ='0';
SET @param2_pm108 ='52';
SET @param1_hum8 = '38' ;
SET @param2_hum8 = '88' ;
SET @param1_temp8 = '3' ;
SET @param2_temp8 = '18' ;
SET @param1_pm258 = '1' ;
SET @param2_pm258 = '14';
SET @param1_no8 = '3';
SET @param2_no8 = '98';
SET @param1_no28 = '5';
SET @param2_no28 = '100';
SET @param1_o38 = '0';
SET @param2_o38 = '100';
SET @param1_so28 = '0';
SET @param2_so28 = '100';
--@rules_count = count X,Y = (CO AND TEMP)
SET @rules_count8 = (SELECT  count(*) from [dbo].[air_pollution] P inner join  [dbo].[air_weather] W on P.id_station=W.id_station where 	P.id_station=W.id_station and W.id_measurement = P.id_measurement AND (w.humidity>=@param1_hum8 AND W.humidity<=@param2_hum8)AND (W.temp>=@param1_temp8 AND W.temp<=@param2_temp8) AND (P.pm2_5>=@param1_pm258 AND P.pm2_5<=@param2_pm258))
--@confidence_t = count X = (CO)
SET @confidence_t8 = (SELECT count(*) from [dbo].[air_pollution] P inner join  [dbo].[air_weather] W on P.id_station=W.id_station where 	P.id_station=W.id_station and W.id_measurement = P.id_measurement AND (w.humidity>=@param1_hum8 AND W.humidity<=@param2_hum8))
SET @database_count8 = (SELECT  count(*) from [dbo].[air_pollution] P inner join  [dbo].[air_weather] W on P.id_station=W.id_station where P.id_station=W.id_station and W.id_measurement = P.id_measurement)

--define parameters for 9 elem rules
DECLARE @database_count9 float;
DECLARE @rules_count9 float;
DECLARE @confidence_t9 float;
DECLARE @param1_hum9 float;
DECLARE @param2_hum9 float;
DECLARE @param1_temp9 float;
DECLARE @param2_temp9 float;
DECLARE @param1_pm259 float;
DECLARE @param2_pm259 float;
DECLARE @param1_pm109 float;
DECLARE @param2_pm109 float;
DECLARE @param1_no9 float;
DECLARE @param2_no9 float;
DECLARE @param1_no29 float;
DECLARE @param2_no29 float;
DECLARE @param1_o39 float;
DECLARE @param2_o39 float;
DECLARE @param1_so29 float;
DECLARE @param2_so29 float;
DECLARE @param1_nh39 float;
DECLARE @param2_nh39 float;
SET @param1_pm109 ='13';
SET @param2_pm109 ='48';
SET @param1_hum9 = '22' ;
SET @param2_hum9 = '77' ;
SET @param1_temp9 = '0' ;
SET @param2_temp9 = '19' ;
SET @param1_pm259 = '9' ;
SET @param2_pm259 = '29';
SET @param1_no9 = '6';
SET @param2_no9 = '83';
SET @param1_no29 = '0';
SET @param2_no29 = '170';
SET @param1_o39 = '3';
SET @param2_o39 = '156';
SET @param1_so29 = '45';
SET @param2_so29 = '100';
SET @param1_nh39 = '0';
SET @param2_nh39 = '100';
--@rules_count = count X,Y = (CO AND TEMP)
SET @rules_count9 = (SELECT  count(*) from [dbo].[air_pollution] P inner join  [dbo].[air_weather] W on P.id_station=W.id_station where 	P.id_station=W.id_station and W.id_measurement = P.id_measurement AND (w.humidity>=@param1_hum9 AND W.humidity<=@param2_hum9)AND (W.temp>=@param1_temp9 AND W.temp<=@param2_temp9) AND (P.pm2_5>=@param1_pm259 AND P.pm2_5<=@param2_pm259))
--@confidence_t = count X = (CO)
SET @confidence_t9 = (SELECT count(*) from [dbo].[air_pollution] P inner join  [dbo].[air_weather] W on P.id_station=W.id_station where 	P.id_station=W.id_station and W.id_measurement = P.id_measurement AND (w.humidity>=@param1_hum9 AND W.humidity<=@param2_hum9))
SET @database_count9 = (SELECT  count(*) from [dbo].[air_pollution] P inner join  [dbo].[air_weather] W on P.id_station=W.id_station where P.id_station=W.id_station and W.id_measurement = P.id_measurement)
--define parameters for 10 elem rules
DECLARE @database_count10 float;
DECLARE @rules_count10 float;
DECLARE @confidence_t10 float;
DECLARE @param1_hum10 float;
DECLARE @param2_hum10 float;
DECLARE @param1_temp10 float;
DECLARE @param2_temp10 float;
DECLARE @param1_pm2510 float;
DECLARE @param2_pm2510 float;
DECLARE @param1_pm1010 float;
DECLARE @param2_pm1010 float;
DECLARE @param1_no10 float;
DECLARE @param2_no10 float;
DECLARE @param1_no210 float;
DECLARE @param2_no210 float;
DECLARE @param1_o310 float;
DECLARE @param2_o310 float;
DECLARE @param1_so210 float;
DECLARE @param2_so210 float;
DECLARE @param1_nh310 float;
DECLARE @param2_nh310 float;
DECLARE @param1_pressure10 float;
DECLARE @param2_pressure10 float;
SET @param1_pm1010 ='0';
SET @param2_pm1010 ='50';
SET @param1_hum10 = '12' ;
SET @param2_hum10 = '37' ;
SET @param1_temp10 = '-5' ;
SET @param2_temp10 = '30' ;
SET @param1_pm2510 = '0' ;
SET @param2_pm2510 = '29';
SET @param1_no10 = '0';
SET @param2_no10 = '100';
SET @param1_no210 = '0';
SET @param2_no210 = '100';
SET @param1_o310 = '0';
SET @param2_o310 = '100';
SET @param1_so210 = '0';
SET @param2_so210 = '100';
SET @param1_nh310 = '0';
SET @param2_nh310 = '100';
SET @param1_pressure10 = '0';
SET @param2_pressure10 = '999';
--@rules_count = count X,Y = (CO AND TEMP)
SET @rules_count10 = (SELECT  count(*) from [dbo].[air_pollution] P inner join  [dbo].[air_weather] W on P.id_station=W.id_station where 	P.id_station=W.id_station and W.id_measurement = P.id_measurement AND (w.humidity>=@param1_hum10 AND W.humidity<=@param2_hum10)AND (W.temp>=@param1_temp10 AND W.temp<=@param2_temp10) AND (P.pm2_5>=@param1_pm2510 AND P.pm2_5<=@param2_pm2510))
--@confidence_t = count X = (CO)
SET @confidence_t10 = (SELECT count(*) from [dbo].[air_pollution] P inner join  [dbo].[air_weather] W on P.id_station=W.id_station where 	P.id_station=W.id_station and W.id_measurement = P.id_measurement AND (w.humidity>=@param1_hum10 AND W.humidity<=@param2_hum10))
SET @database_count10 = (SELECT  count(*) from [dbo].[air_pollution] P inner join  [dbo].[air_weather] W on P.id_station=W.id_station where P.id_station=W.id_station and W.id_measurement = P.id_measurement)
--define parameters for 11 elem rules
DECLARE @database_count11 float;
DECLARE @rules_count11 float;
DECLARE @confidence_t11 float;
DECLARE @param1_hum11 float;
DECLARE @param2_hum11 float;
DECLARE @param1_temp11 float;
DECLARE @param2_temp11 float;
DECLARE @param1_pm2511 float;
DECLARE @param2_pm2511 float;
DECLARE @param1_pm1011 float;
DECLARE @param2_pm1011 float;
DECLARE @param1_no11 float;
DECLARE @param2_no11 float;
DECLARE @param1_no211 float;
DECLARE @param2_no211 float;
DECLARE @param1_o311 float;
DECLARE @param2_o311 float;
DECLARE @param1_so211 float;
DECLARE @param2_so211 float;
DECLARE @param1_nh311 float;
DECLARE @param2_nh311 float;
DECLARE @param1_pressure11 float;
DECLARE @param2_pressure11 float;
DECLARE @param1_co11 float;
DECLARE @param2_co11 float;
SET @param1_pm1011 ='0';
SET @param2_pm1011 ='50';
SET @param1_hum11 = '40' ;
SET @param2_hum11 = '100' ;
SET @param1_temp11 = '0' ;
SET @param2_temp11 = '15' ;
SET @param1_pm2511 = '0' ;
SET @param2_pm2511 = '29';
SET @param1_no11 = '0';
SET @param2_no11 = '700';
SET @param1_no211 = '0';
SET @param2_no211 = '700';
SET @param1_o311 = '0';
SET @param2_o311 = '700';
SET @param1_so211 = '0';
SET @param2_so211 = '700';
SET @param1_nh311 = '0';
SET @param2_nh311 = '700';
SET @param1_pressure11 = '1000';
SET @param2_pressure11 = '1200';
SET @param1_co11 = '0';
SET @param2_co11 = '2000';
--@rules_count = count X,Y = (CO AND TEMP)
SET @rules_count11 = (SELECT  count(*) from [dbo].[air_pollution] P inner join  [dbo].[air_weather] W on P.id_station=W.id_station where 	P.id_station=W.id_station and W.id_measurement = P.id_measurement AND (w.humidity>=@param1_hum11 AND W.humidity<=@param2_hum11)AND (W.temp>=@param1_temp11 AND W.temp<=@param2_temp11) AND (P.pm2_5>=@param1_pm2511 AND P.pm2_5<=@param2_pm2511))
--@confidence_t = count X = (CO)
SET @confidence_t11 = (SELECT count(*) from [dbo].[air_pollution] P inner join  [dbo].[air_weather] W on P.id_station=W.id_station where 	P.id_station=W.id_station and W.id_measurement = P.id_measurement AND (w.humidity>=@param1_hum11 AND W.humidity<=@param2_hum11))
SET @database_count11 = (SELECT  count(*) from [dbo].[air_pollution] P inner join  [dbo].[air_weather] W on P.id_station=W.id_station where P.id_station=W.id_station and W.id_measurement = P.id_measurement)




IF (@elem_rules1='1')
INSERT INTO [dbo].[association_rules] 
select TOP 1
elem = '1',
T1.regula,
T1.support,
T1.confidence,
pm25_PARAM = '<'+CAST(MIN(T1.pm2_5)as varchar)+'; '+CAST(MAX(T1.pm2_5)as varchar)+'>',
pm10_PARAM = NULL,
nh3_PARAM = '<'+CAST(MIN(T1.nh3)as varchar)+'; '+CAST(MAX(T1.nh3)as varchar)+'>',
no_PARAM = '<'+CAST(MIN(T1.no)as varchar)+'; '+CAST(MAX(T1.no)as varchar)+'>',
no2_PARAM = '<'+CAST(MIN(T1.no2)as varchar)+'; '+CAST(MAX(T1.no2)as varchar)+'>',
o3_PARAM = '<'+CAST(MIN(T1.o3)as varchar)+'; '+CAST(MAX(T1.o3)as varchar)+'>',
so2_PARAM = '<'+CAST(MIN(T1.so2)as varchar)+'; '+CAST(MAX(T1.so2)as varchar)+'>',
co_PARAM = '<'+CAST(MIN(T1.co)as varchar)+'; '+CAST(MAX(T1.co)as varchar)+'>',
humidity_PARAM = '<'+CAST(MIN(T1.humidity)as varchar)+'; '+CAST(MAX(T1.humidity)as varchar)+'>',
temperature_PARAM = '<'+CAST(MIN(T1.temp)as varchar)+'; '+CAST(MAX(T1.temp)as varchar)+'>',
pressure_PARAM = '<'+CAST(MIN(T1.pressure)as varchar)+'; '+CAST(MAX(T1.pressure)as varchar)+'>'
from (
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
		elem_count=1,
		support = CAST(ROUND((@rules_count1/@database_count1)*100,2) as varchar)+'%' ,
		regula = 'PM10<'+CAST(@param1_pm10 AS varchar)+';'+CAST(@param2_pm10 as varchar)+'>',
		confidence = CAST(ROUND((@rules_count1/@confidence_t1)*100,2) as varchar) + '%',
		rules_count = @rules_count1,
		database_count = @database_count1,
		confidence_t = @confidence_t1
	from [dbo].[air_pollution] P
		inner join  [dbo].[air_weather] W on P.id_station=W.id_station
	where 
		P.id_station=W.id_station and W.id_measurement = P.id_measurement AND
		(P.co>=@param1_pm10 AND P.co<=@param2_pm10)
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
	) T1
	group by
		T1.regula,
		T1.elem_count,
		T1.support,
		T1.confidence,
		T1.database_count

IF(@elem_rules2 = '1')
INSERT INTO [dbo].[association_rules] 
select TOP 1
elem = '2',
T.regula,
T.support,
T.confidence,
pm25_PARAM = '<'+CAST(MIN(T.pm2_5)as varchar)+'; '+CAST(MAX(T.pm2_5)as varchar)+'>',
pm10_PARAM = '<'+CAST(MIN(T.pm10)as varchar)+'; '+CAST(MAX(T.pm10)as varchar)+'>',
nh3_PARAM = '<'+CAST(MIN(T.nh3)as varchar)+'; '+CAST(MAX(T.nh3)as varchar)+'>',
no_PARAM = '<'+CAST(MIN(T.no)as varchar)+'; '+CAST(MAX(T.no)as varchar)+'>',
no2_PARAM = '<'+CAST(MIN(T.no2)as varchar)+'; '+CAST(MAX(T.no2)as varchar)+'>',
o3_PARAM = '<'+CAST(MIN(T.o3)as varchar)+'; '+CAST(MAX(T.o3)as varchar)+'>',
so2_PARAM = '<'+CAST(MIN(T.so2)as varchar)+'; '+CAST(MAX(T.so2)as varchar)+'>',
co_PARAM = NULL,
humidity_PARAM = '<'+CAST(MIN(T.humidity)as varchar)+'; '+CAST(MAX(T.humidity)as varchar)+'>',
temperature_PARAM = '<'+CAST(MIN(T.temp)as varchar)+'; '+CAST(MAX(T.temp)as varchar)+'>',
pressure_PARAM = '<'+CAST(MIN(T.pressure)as varchar)+'; '+CAST(MAX(T.pressure)as varchar)+'>'
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
		support = CAST(ROUND((@rules_count2/@database_count2)*100,2) as varchar)+'%' ,
		regula = 'CO<'+CAST(@param1_co2 AS varchar)+';'+CAST(@param2_co2 as varchar)+'>, '+'TEMP<'+CAST(@param1_temp2 as varchar)+';'+CAST(@param2_temp2 as varchar)+'>',
		confidence = CAST(ROUND((@rules_count2/@confidence_t2)*100,2) as varchar) + '%',
		rules_count = @rules_count2,
		database_count = @database_count2,
		confidence_t = @confidence_t2
	from [dbo].[air_pollution] P
		inner join  [dbo].[air_weather] W on P.id_station=W.id_station
	where 
		P.id_station=W.id_station and W.id_measurement = P.id_measurement AND
		(P.co>=@param1_co2 AND P.co<=@param2_co2) AND
		(W.temp>=@param1_temp2 AND W.temp<=@param2_temp2)
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


IF (@elem_rules3 = '1')
INSERT INTO association_rules
select TOP 1
elem = '3',
T3.regula,
T3.support,
T3.confidence,
pm25_PARAM = NULL,
pm10_PARAM = '<'+CAST(MIN(T3.pm10)as varchar)+'; '+CAST(MAX(T3.pm10)as varchar)+'>',
nh3_PARAM = '<'+CAST(MIN(T3.nh3)as varchar)+'; '+CAST(MAX(T3.nh3)as varchar)+'>',
no_PARAM = '<'+CAST(MIN(T3.no)as varchar)+'; '+CAST(MAX(T3.no)as varchar)+'>',
no2_PARAM = '<'+CAST(MIN(T3.no2)as varchar)+'; '+CAST(MAX(T3.no2)as varchar)+'>',
o3_PARAM = '<'+CAST(MIN(T3.o3)as varchar)+'; '+CAST(MAX(T3.o3)as varchar)+'>',
so2_PARAM = '<'+CAST(MIN(T3.so2)as varchar)+'; '+CAST(MAX(T3.so2)as varchar)+'>',
co_PARAM = '<'+CAST(MIN(T3.co)as varchar)+'; '+CAST(MAX(T3.co)as varchar)+'>',
humidity_PARAM = NULL,
temperature_PARAM = '<'+CAST(MIN(T3.temp)as varchar)+'; '+CAST(MAX(T3.temp)as varchar)+'>',
pressure_PARAM = '<'+CAST(MIN(T3.pressure)as varchar)+'; '+CAST(MAX(T3.pressure)as varchar)+'>'
from (	select
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
		elem_count=3,
		support = CAST(ROUND((@rules_count3/@database_count3)*100,2) as varchar)+'%' ,
		regula = 'humidity<'+CAST(@param1_hum3 AS varchar)+';'+CAST(@param2_hum3 as varchar)+'>, '+'TEMP<'+CAST(@param1_temp23 as varchar)+';'+CAST(@param2_temp23 as varchar)+'>, '+'PM2_5<'+CAST(@param1_pm253 as varchar)+';'+CAST(@param2_pm253 as varchar)+'>',
		confidence = CAST(ROUND((@rules_count3/@confidence_t3)*100,2) as varchar) + '%',
		rules_count = @rules_count3,
		database_count = @database_count3,
		confidence_t = @confidence_t3
	from [dbo].[air_pollution] P
		inner join  [dbo].[air_weather] W on P.id_station=W.id_station
	where 
		P.id_station=W.id_station and W.id_measurement = P.id_measurement AND
		(W.humidity>=@param1_hum3 AND W.humidity<=@param2_hum3) AND
		(W.temp>=@param1_temp23 AND W.temp<=@param2_temp23) AND
		(P.pm2_5>=@param1_pm253 AND P.pm2_5<=@param2_pm253)
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
		)T3
	group by
		T3.regula,
		T3.elem_count,
		T3.support,
		T3.confidence,
		T3.database_count


IF (@elem_rules4='1')
INSERT INTO association_rules
select TOP 1
elem = '4',
T4.regula,
T4.support,
T4.confidence,
pm25_PARAM = NULL,
pm10_PARAM = NULL,
nh3_PARAM = '<'+CAST(MIN(T4.nh3)as varchar)+'; '+CAST(MAX(T4.nh3)as varchar)+'>',
no_PARAM = '<'+CAST(MIN(T4.no)as varchar)+'; '+CAST(MAX(T4.no)as varchar)+'>',
no2_PARAM = '<'+CAST(MIN(T4.no2)as varchar)+'; '+CAST(MAX(T4.no2)as varchar)+'>',
o3_PARAM = '<'+CAST(MIN(T4.o3)as varchar)+'; '+CAST(MAX(T4.o3)as varchar)+'>',
so2_PARAM = '<'+CAST(MIN(T4.so2)as varchar)+'; '+CAST(MAX(T4.so2)as varchar)+'>',
co_PARAM = '<'+CAST(MIN(T4.co)as varchar)+'; '+CAST(MAX(T4.co)as varchar)+'>',
humidity_PARAM = NULL,
temperature_PARAM = NULL,
pressure_PARAM = '<'+CAST(MIN(T4.pressure)as varchar)+'; '+CAST(MAX(T4.pressure)as varchar)+'>'

from (
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
		elem_count=1,
		support = CAST(ROUND((@rules_count4/@database_count4)*100,2) as varchar)+'%' ,
		regula = 'humidity<'+CAST(@param1_hum4 AS varchar)+';'+CAST(@param2_hum4 as varchar)+'>, '+'TEMP<'+CAST(@param1_temp4 as varchar)+';'+CAST(@param2_temp4 as varchar)+'>, '+'PM2_5<'+CAST(@param1_pm254 as varchar)+';'+CAST(@param2_pm254 as varchar)+'>, '+'PM10<'+CAST(@param1_pm104 as varchar)+';'+CAST(@param2_pm104 as varchar)+'>',
		confidence = CAST(ROUND((@rules_count4/@confidence_t4)*100,2) as varchar) + '%',
		rules_count = @rules_count4,
		database_count = @database_count4,
		confidence_t = @confidence_t4
	from [dbo].[air_pollution] P
		inner join  [dbo].[air_weather] W on P.id_station=W.id_station
	where 
		P.id_station=W.id_station and W.id_measurement = P.id_measurement AND
		(W.humidity>=@param1_hum4 AND W.humidity<=@param2_hum4) AND
		(W.temp>=@param1_temp4 AND W.temp<=@param2_temp4) AND
		(P.pm2_5>=@param1_pm254 AND P.pm2_5<=@param2_pm254) AND
		(P.pm10>=@param1_pm104 AND P.pm10<=@param2_pm104)
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
	) T4
	group by
		T4.regula,
		T4.elem_count,
		T4.support,
		T4.confidence,
		T4.database_count

IF (@elem_rules5='1')
INSERT INTO association_rules
select TOP 1
elem = '5',
T5.regula,
T5.support,
T5.confidence,
pm25_PARAM = NULL,
pm10_PARAM = NULL,
nh3_PARAM = '<'+CAST(MIN(T5.nh3)as varchar)+'; '+CAST(MAX(T5.nh3)as varchar)+'>',
no_PARAM = NULL,
no2_PARAM = '<'+CAST(MIN(T5.no2)as varchar)+'; '+CAST(MAX(T5.no2)as varchar)+'>',
o3_PARAM = '<'+CAST(MIN(T5.o3)as varchar)+'; '+CAST(MAX(T5.o3)as varchar)+'>',
so2_PARAM = '<'+CAST(MIN(T5.so2)as varchar)+'; '+CAST(MAX(T5.so2)as varchar)+'>',
co_PARAM = '<'+CAST(MIN(T5.co)as varchar)+'; '+CAST(MAX(T5.co)as varchar)+'>',
humidity_PARAM = NULL,
temperature_PARAM = NULL,
pressure_PARAM = '<'+CAST(MIN(T5.pressure)as varchar)+'; '+CAST(MAX(T5.pressure)as varchar)+'>'

from (
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
		elem_count=1,
		support = CAST(ROUND((@rules_count5/@database_count5)*100,2) as varchar)+'%' ,
		regula = 'PM10<'+CAST(@param1_pm105 AS varchar)+';'+CAST(@param2_pm105 as varchar)+'>, ' +'humidity<'+CAST(@param1_hum5 AS varchar)+';'+CAST(@param2_hum5 as varchar)+'>, '+'TEMP<'+CAST(@param1_temp5 as varchar)+';'+CAST(@param2_temp5 as varchar)+'>, '+'PM2_5<'+CAST(@param1_pm255 as varchar)+';'+CAST(@param2_pm255 as varchar)+'>, '+'NO<'+CAST(@param1_no5 as varchar)+';'+CAST(@param2_no5 as varchar)+'>',
		confidence = CAST(ROUND((@rules_count5/@confidence_t5)*100,2) as varchar) + '%',
		rules_count = @rules_count5,
		database_count = @database_count5,
		confidence_t = @confidence_t5
	from [dbo].[air_pollution] P
		inner join  [dbo].[air_weather] W on P.id_station=W.id_station
	where 
		P.id_station=W.id_station and W.id_measurement = P.id_measurement AND
		(W.humidity>=@param1_hum5 AND W.humidity<=@param2_hum5) AND
		(W.temp>=@param1_temp5 AND W.temp<=@param2_temp5) AND
		(P.pm2_5>=@param1_pm255 AND P.pm2_5<=@param2_pm255) AND
		(P.pm10>=@param1_pm105 AND P.pm10<=@param2_pm105) AND
		(P.no>=@param1_no5 AND P.no<=@param2_no5)
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
	) T5
	group by
		T5.regula,
		T5.elem_count,
		T5.support,
		T5.confidence,
		T5.database_count

IF (@elem_rules6='1')
INSERT INTO association_rules
select TOP 1
elem = '6',
T6.regula,
T6.support,
T6.confidence,
pm25_PARAM = NULL,
pm10_PARAM = NULL,
nh3_PARAM = '<'+CAST(MIN(T6.nh3)as varchar)+'; '+CAST(MAX(T6.nh3)as varchar)+'>',
no_PARAM = NULL,
no2_PARAM = NULL,
o3_PARAM = '<'+CAST(MIN(T6.o3)as varchar)+'; '+CAST(MAX(T6.o3)as varchar)+'>',
so2_PARAM = '<'+CAST(MIN(T6.so2)as varchar)+'; '+CAST(MAX(T6.so2)as varchar)+'>',
co_PARAM = '<'+CAST(MIN(T6.co)as varchar)+'; '+CAST(MAX(T6.co)as varchar)+'>',
humidity_PARAM = NULL,
temperature_PARAM = NULL,
pressure_PARAM = '<'+CAST(MIN(T6.pressure)as varchar)+'; '+CAST(MAX(T6.pressure)as varchar)+'>'

from (
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
		elem_count=1,
		support = CAST(ROUND((@rules_count6/@database_count6)*100,2) as varchar)+'%' ,
		regula = 'PM10<'+CAST(@param1_pm106 AS varchar)+';'+CAST(@param2_pm106 as varchar)+'>, ' +'humidity<'+CAST(@param1_hum6 AS varchar)+';'+CAST(@param2_hum6 as varchar)+'>, '+'TEMP<'+CAST(@param1_temp6 as varchar)+';'+CAST(@param2_temp6 as varchar)+'>, '+'PM2_5<'+CAST(@param1_pm256 as varchar)+';'+CAST(@param2_pm256 as varchar)+'>, '+'NO<'+CAST(@param1_no6 as varchar)+';'+CAST(@param2_no6 as varchar)+'> ,'+'NO2<'+CAST(@param1_no26 as varchar)+';'+CAST(@param2_no26 as varchar)+'>',
		confidence = CAST(ROUND((@rules_count6/@confidence_t6)*100,2) as varchar) + '%',
		rules_count = @rules_count6,
		database_count = @database_count6,
		confidence_t = @confidence_t6
	from [dbo].[air_pollution] P
		inner join  [dbo].[air_weather] W on P.id_station=W.id_station
	where 
		P.id_station=W.id_station and W.id_measurement = P.id_measurement AND
		(W.humidity>=@param1_hum6 AND W.humidity<=@param2_hum6) AND
		(W.temp>=@param1_temp6 AND W.temp<=@param2_temp6) AND
		(P.pm2_5>=@param1_pm256 AND P.pm2_5<=@param2_pm256) AND
		(P.pm10>=@param1_pm106 AND P.pm10<=@param2_pm106) AND
		(P.no>=@param1_no6 AND P.no<=@param2_no6) AND
		(P.no2>=@param1_no26 AND P.no2<=@param2_no26)
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
	) T6
	group by
		T6.regula,
		T6.elem_count,
		T6.support,
		T6.confidence,
		T6.database_count

IF (@elem_rules7='1')
INSERT INTO association_rules
select TOP 1
elem = '7',
T7.regula,
T7.support,
T7.confidence,
pm25_PARAM = NULL,
pm10_PARAM = NULL,
nh3_PARAM = '<'+CAST(MIN(T7.nh3)as varchar)+'; '+CAST(MAX(T7.nh3)as varchar)+'>',
no_PARAM = NULL,
no2_PARAM = NULL,
o3_PARAM = NULL,
so2_PARAM = '<'+CAST(MIN(T7.so2)as varchar)+'; '+CAST(MAX(T7.so2)as varchar)+'>',
co_PARAM = '<'+CAST(MIN(T7.co)as varchar)+'; '+CAST(MAX(T7.co)as varchar)+'>',
humidity_PARAM = NULL,
temperature_PARAM = NULL,
pressure_PARAM = '<'+CAST(MIN(T7.pressure)as varchar)+'; '+CAST(MAX(T7.pressure)as varchar)+'>'

from (
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
		elem_count=1,
		support = CAST(ROUND((@rules_count6/@database_count6)*100,2) as varchar)+'%' ,
		regula = 'PM10<'+CAST(@param1_pm107 AS varchar)+';'+CAST(@param2_pm107 as varchar)+'>, ' +'humidity<'+CAST(@param1_hum7 AS varchar)+';'+CAST(@param2_hum7 as varchar)+'>, '+'TEMP<'+CAST(@param1_temp7 as varchar)+';'+CAST(@param2_temp7 as varchar)+'>, '+'PM2_5<'+CAST(@param1_pm257 as varchar)+';'+CAST(@param2_pm257 as varchar)+'>, '+'NO<'+CAST(@param1_no7 as varchar)+';'+CAST(@param2_no7 as varchar)+'> ,'+'NO2<'+CAST(@param1_no27 as varchar)+';'+CAST(@param2_no27 as varchar)+'> ,'+'O3<'+CAST(@param1_o37 as varchar)+';'+CAST(@param2_o37 as varchar)+'>',
		confidence = CAST(ROUND((@rules_count7/@confidence_t7)*100,2) as varchar) + '%',
		rules_count = @rules_count7,
		database_count = @database_count7,
		confidence_t = @confidence_t7
	from [dbo].[air_pollution] P
		inner join  [dbo].[air_weather] W on P.id_station=W.id_station
	where 
		P.id_station=W.id_station and W.id_measurement = P.id_measurement AND
		(W.humidity>=@param1_hum7 AND W.humidity<=@param2_hum7) AND
		(W.temp>=@param1_temp7 AND W.temp<=@param2_temp7) AND
		(P.pm2_5>=@param1_pm257 AND P.pm2_5<=@param2_pm257) AND
		(P.pm10>=@param1_pm107 AND P.pm10<=@param2_pm107) AND
		(P.no>=@param1_no7 AND P.no<=@param2_no7) AND
		(P.no2>=@param1_no27 AND P.no2<=@param2_no27) AND
		(P.o3>=@param1_o37 AND P.o3<=@param2_o37)
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
	) T7
	group by
		T7.regula,
		T7.elem_count,
		T7.support,
		T7.confidence,
		T7.database_count
		
IF (@elem_rules8='1')
INSERT INTO association_rules
select TOP 1
elem = '8',
T8.regula,
T8.support,
T8.confidence,
pm25_PARAM = NULL,
pm10_PARAM = NULL,
nh3_PARAM = '<'+CAST(MIN(T8.nh3)as varchar)+'; '+CAST(MAX(T8.nh3)as varchar)+'>',
no_PARAM = NULL,
no2_PARAM =  NULL,
o3_PARAM =  NULL,
so2_PARAM =  NULL,
co_PARAM = '<'+CAST(MIN(T8.co)as varchar)+'; '+CAST(MAX(T8.co)as varchar)+'>',
humidity_PARAM =  NULL,
temperature_PARAM =  NULL,
pressure_PARAM = '<'+CAST(MIN(T8.pressure)as varchar)+'; '+CAST(MAX(T8.pressure)as varchar)+'>'

from (
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
		elem_count=1,
		support = CAST(ROUND((@rules_count8/@database_count8)*100,2) as varchar)+'%' ,
		regula = 'PM10<'+CAST(@param1_pm108 AS varchar)+';'+CAST(@param2_pm108 as varchar)+'>, ' +'humidity<'+CAST(@param1_hum8 AS varchar)+';'+CAST(@param2_hum8 as varchar)+'>, '+'TEMP<'+CAST(@param1_temp8 as varchar)+';'+CAST(@param2_temp8 as varchar)+'>, '+'PM2_5<'+CAST(@param1_pm258 as varchar)+';'+CAST(@param2_pm258 as varchar)+'>, '+'NO<'+CAST(@param1_no8 as varchar)+';'+CAST(@param2_no8 as varchar)+'> ,'+'NO2<'+CAST(@param1_no28 as varchar)+';'+CAST(@param2_no28 as varchar)+'> ,'+'O3<'+CAST(@param1_o38 as varchar)+';'+CAST(@param2_o38 as varchar)+'> ,'+'SO2<'+CAST(@param1_so28 as varchar)+';'+CAST(@param2_so28 as varchar)+'>',
		confidence = CAST(ROUND((@rules_count8/@confidence_t8)*100,2) as varchar) + '%',
		rules_count = @rules_count8,
		database_count = @database_count8,
		confidence_t = @confidence_t8
	from [dbo].[air_pollution] P
		inner join  [dbo].[air_weather] W on P.id_station=W.id_station
	where 
		P.id_station=W.id_station and W.id_measurement = P.id_measurement AND
		(W.humidity>=@param1_hum8 AND W.humidity<=@param2_hum8) AND
		(W.temp>=@param1_temp8 AND W.temp<=@param2_temp8) AND
		(P.pm2_5>=@param1_pm258 AND P.pm2_5<=@param2_pm258) AND
		(P.pm10>=@param1_pm108 AND P.pm10<=@param2_pm108) AND
		(P.no>=@param1_no8 AND P.no<=@param2_no8) AND
		(P.no2>=@param1_no28 AND P.no2<=@param2_no28) AND
		(P.o3>=@param1_o38 AND P.o3<=@param2_o38) AND
		(P.so2>=@param1_so28 AND P.so2<=@param2_so28)
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
	) T8
	group by
		T8.regula,
		T8.elem_count,
		T8.support,
		T8.confidence,
		T8.database_count

IF (@elem_rules9='1')
INSERT INTO association_rules
select TOP 1
elem = '9',
T9.regula,
T9.support,
T9.confidence,
pm25_PARAM =  NULL,
pm10_PARAM =  NULL,
nh3_PARAM =  NULL,
no_PARAM =  NULL,
no2_PARAM =  NULL,
o3_PARAM =  NULL,
so2_PARAM =  NULL,
co_PARAM = '<'+CAST(MIN(T9.co)as varchar)+'; '+CAST(MAX(T9.co)as varchar)+'>',
humidity_PARAM =  NULL,
temperature_PARAM =  NULL,
pressure_PARAM = '<'+CAST(MIN(T9.pressure)as varchar)+'; '+CAST(MAX(T9.pressure)as varchar)+'>'

from (
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
		elem_count=1,
		support = CAST(ROUND((@rules_count9/@database_count9)*100,2) as varchar)+'%' ,
		regula = 'PM10<'+CAST(@param1_pm109 AS varchar)+';'+CAST(@param2_pm109 as varchar)+'>, ' +'humidity<'+CAST(@param1_hum9 AS varchar)+';'+CAST(@param2_hum9 as varchar)+'>, '+'TEMP<'+CAST(@param1_temp9 as varchar)+';'+CAST(@param2_temp9 as varchar)+'>, '+'PM2_5<'+CAST(@param1_pm259 as varchar)+';'+CAST(@param2_pm259 as varchar)+'>, '+'NO<'+CAST(@param1_no9 as varchar)+';'+CAST(@param2_no9 as varchar)+'> ,'+'NO2<'+CAST(@param1_no29 as varchar)+';'+CAST(@param2_no29 as varchar)+'> ,'+'O3<'+CAST(@param1_o39 as varchar)+';'+CAST(@param2_o39 as varchar)+'> ,'+'SO2<'+CAST(@param1_so29 as varchar)+';'+CAST(@param2_so29 as varchar)+'> ,'+'NH3<'+CAST(@param1_nh39 as varchar)+';'+CAST(@param2_nh39 as varchar)+'>',
		confidence = CAST(ROUND((@rules_count9/@confidence_t9)*100,2) as varchar) + '%',
		rules_count = @rules_count9,
		database_count = @database_count9,
		confidence_t = @confidence_t9
	from [dbo].[air_pollution] P
		inner join  [dbo].[air_weather] W on P.id_station=W.id_station
	where 
		P.id_station=W.id_station and W.id_measurement = P.id_measurement AND
		(W.humidity>=@param1_hum9 AND W.humidity<=@param2_hum9) AND
		(W.temp>=@param1_temp9 AND W.temp<=@param2_temp9) AND
		(P.pm2_5>=@param1_pm259 AND P.pm2_5<=@param2_pm259) AND
		(P.pm10>=@param1_pm109 AND P.pm10<=@param2_pm109) AND
		(P.no>=@param1_no9 AND P.no<=@param2_no9) AND
		(P.no2>=@param1_no29 AND P.no2<=@param2_no29) AND
		(P.o3>=@param1_o39 AND P.o3<=@param2_o39) AND
		(P.so2>=@param1_so29 AND P.so2<=@param2_so29) AND
		(P.nh3>=@param1_nh39 AND P.nh3<=@param2_nh39)
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
	) T9
	group by
		T9.regula,
		T9.elem_count,
		T9.support,
		T9.confidence,
		T9.database_count

IF (@elem_rules10='1')
INSERT INTO association_rules
select TOP 1
elem = '10',
T10.regula,
T10.support,
T10.confidence,
pm25_PARAM =  NULL,
pm10_PARAM = NULL,
nh3_PARAM =  NULL,
no_PARAM =  NULL,
no2_PARAM =  NULL,
o3_PARAM =  NULL,
so2_PARAM =  NULL,
co_PARAM = '<'+CAST(MIN(T10.co)as varchar)+'; '+CAST(MAX(T10.co)as varchar)+'>',
humidity_PARAM =  NULL,
temperature_PARAM =  NULL,
pressure_PARAM =  NULL

from (
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
		elem_count=1,
		support = CAST(ROUND((@rules_count10/@database_count10)*100,2) as varchar)+'%' ,
		regula = 'PM10<'+CAST(@param1_pm1010 AS varchar)+';'+CAST(@param2_pm1010 as varchar)+'>, ' +'humidity<'+CAST(@param1_hum10 AS varchar)+';'+CAST(@param2_hum10 as varchar)+'>, '+'TEMP<'+CAST(@param1_temp10 as varchar)+';'+CAST(@param2_temp10 as varchar)+'>, '+'PM2_5<'+CAST(@param1_pm2510 as varchar)+';'+CAST(@param2_pm2510 as varchar)+'>, '+'NO<'+CAST(@param1_no10 as varchar)+';'+CAST(@param2_no10 as varchar)+'> ,'+'NO2<'+CAST(@param1_no210 as varchar)+';'+CAST(@param2_no210 as varchar)+'> ,'+'O3<'+CAST(@param1_o310 as varchar)+';'+CAST(@param2_o310 as varchar)+'> ,'+'SO2<'+CAST(@param1_so210 as varchar)+';'+CAST(@param2_so210 as varchar)+'> ,'+'NH3<'+CAST(@param1_nh310 as varchar)+';'+CAST(@param2_nh310 as varchar)+'> ,'+'pressure<'+CAST(@param1_pressure10 as varchar)+';'+CAST(@param2_pressure10 as varchar)+'>',
		confidence = CAST(ROUND((@rules_count10/@confidence_t10)*100,2) as varchar) + '%',
		rules_count = @rules_count10,
		database_count = @database_count10,
		confidence_t = @confidence_t10
	from [dbo].[air_pollution] P
		inner join  [dbo].[air_weather] W on P.id_station=W.id_station
	where 
		P.id_station=W.id_station and W.id_measurement = P.id_measurement AND
		(W.humidity>=@param1_hum10 AND W.humidity<=@param2_hum10) AND
		(W.temp>=@param1_temp10 AND W.temp<=@param2_temp10) AND
		(P.pm2_5>=@param1_pm2510 AND P.pm2_5<=@param2_pm2510) AND
		(P.pm10>=@param1_pm1010 AND P.pm10<=@param2_pm1010) AND
		(P.no>=@param1_no10 AND P.no<=@param2_no10) AND
		(P.no2>=@param1_no210 AND P.no2<=@param2_no210) AND
		(P.o3>=@param1_o310 AND P.o3<=@param2_o310) AND
		(P.so2>=@param1_so210 AND P.so2<=@param2_so210) AND
		(P.nh3>=@param1_nh310 AND P.nh3<=@param2_nh310) AND
		(W.pressure>=@param1_pressure10 AND W.pressure<=@param2_pressure10)

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
	) T10
	group by
		T10.regula,
		T10.elem_count,
		T10.support,
		T10.confidence,
		T10.database_count

IF (@elem_rules11='1')
INSERT INTO association_rules
select TOP 1
elem = '11',
T11.regula,
T11.support,
T11.confidence,
pm25_PARAM =  NULL,
pm10_PARAM =  NULL,
nh3_PARAM =  NULL,
no_PARAM =  NULL,
no2_PARAM =  NULL,
o3_PARAM =  NULL,
so2_PARAM =  NULL,
co_PARAM =  NULL,
humidity_PARAM =  NULL,
temperature_PARAM =  NULL,
pressure_PARAM =  NULL

from (
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
		elem_count=1,
		support = CAST(ROUND((@rules_count11/@database_count11)*100,2) as varchar)+'%' ,
		regula = 'PM10<'+CAST(@param1_pm1011 AS varchar)+';'+CAST(@param2_pm1011 as varchar)+'>, ' +'humidity<'+CAST(@param1_hum11 AS varchar)+';'+CAST(@param2_hum11 as varchar)+'>, '+'TEMP<'+CAST(@param1_temp11 as varchar)+';'+CAST(@param2_temp11 as varchar)+'>, '+'PM2_5<'+CAST(@param1_pm2511 as varchar)+';'+CAST(@param2_pm2511 as varchar)+'>, '+'NO<'+CAST(@param1_no11 as varchar)+';'+CAST(@param2_no11 as varchar)+'> ,'+'NO2<'+CAST(@param1_no211 as varchar)+';'+CAST(@param2_no211 as varchar)+'> ,'+'O3<'+CAST(@param1_o311 as varchar)+';'+CAST(@param2_o311 as varchar)+'> ,'+'SO2<'+CAST(@param1_so211 as varchar)+';'+CAST(@param2_so211 as varchar)+'> ,'+'NH3<'+CAST(@param1_nh311 as varchar)+';'+CAST(@param2_nh311 as varchar)+'> ,'+'pressure<'+CAST(@param1_pressure11 as varchar)+';'+CAST(@param2_pressure11 as varchar)+'> ,'+'CO<'+CAST(@param1_co11 as varchar)+';'+CAST(@param2_co11 as varchar)+'>',
		confidence = CAST(ROUND((@rules_count11/@confidence_t11)*100,2) as varchar) + '%',
		rules_count = @rules_count11,
		database_count = @database_count11,
		confidence_t = @confidence_t11
	from [dbo].[air_pollution] P
		inner join  [dbo].[air_weather] W on P.id_station=W.id_station
	where 
		P.id_station=W.id_station and W.id_measurement = P.id_measurement AND
		(W.humidity>=@param1_hum11 AND W.humidity<=@param2_hum11) AND
		(W.temp>=@param1_temp11 AND W.temp<=@param2_temp11) AND
		(P.pm2_5>=@param1_pm2511 AND P.pm2_5<=@param2_pm2511) AND
		(P.pm10>=@param1_pm1011 AND P.pm10<=@param2_pm1011) AND
		(P.no>=@param1_no11 AND P.no<=@param2_no11) AND
		(P.no2>=@param1_no211 AND P.no2<=@param2_no211) AND
		(P.o3>=@param1_o311 AND P.o3<=@param2_o311) AND
		(P.so2>=@param1_so211 AND P.so2<=@param2_so211) AND
		(P.nh3>=@param1_nh311 AND P.nh3<=@param2_nh311) AND
		(W.pressure>=@param1_pressure11 AND W.pressure<=@param2_pressure11) AND
		(P.co>=@param1_co11 AND P.co<=@param2_co11) 
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
	) T11
	group by
		T11.regula,
		T11.elem_count,
		T11.support,
		T11.confidence,
		T11.database_count
GO
