CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    `name` VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
SELECT *
FROM cars;


-- 1. АВТОмобили до 25к
CREATE VIEW auto_filter 
AS 
	SELECT * 
	FROM cars
	WHERE cost <= 25000;


-- 2. АВТОмобили до 30к
CREATE OR REPLACE VIEW auto_filter 
AS 
	SELECT * 
	FROM cars
	WHERE cost <= 30000;


-- 3. АВТОмобили шкода и ауди 
CREATE OR REPLACE VIEW auto_filter1 
AS
	SELECT * 
	FROM cost
	WHERE `name` = 'Audi' OR `name` = 'Skoda';


SELECT train_id, station, station_time
SUBTIME(LEAD(station_time) OVER(PARTITION BY train_id ORDER BY train_id), station_time)
AS time_to_next_station
FROM Trains;
