CREATE TABLE flights (
	flight_number TEXT,
	flight_departure TEXT,
	delay INTEGER
);

INSERT INTO flights (flight_number, flight_departure, delay)
VALUES ('AF006', 'CDG', 12),
       ('BA177', 'LHR', 0),
       ('DL405', 'JFK', 45),
       ('EK202', 'DXB', 5),
       ('LH400', 'FRA', 18),
       ('JL043', 'HND', 0),
       ('SQ334', 'SIN', 2),
       ('UA901', 'SFO', 30),
       ('QR039', 'DOH', 0),
       ('TK1821', 'IST', 15),
       ('AF022', 'CDG', 60),
       ('BA115', 'LHR', 8),
       ('DL003', 'JFK', 0),
       ('EK007', 'DXB', 22),
       ('LH422', 'MUC', 0),
       ('NH203', 'HND', 10),
       ('SQ319', 'SIN', 0),
       ('UA920', 'ORD', 120),
       ('QR001', 'DOH', 4),
       ('TK1987', 'IST', 0),
       ('AF072', 'CDG', 15),
       ('BA031', 'LHR', 50),
       ('DL055', 'LAX', 14),
       ('EK041', 'DXB', 0),
       ('LH430', 'FRA', 5),
       ('JL031', 'HND', 0),
       ('SQ308', 'SIN', 7),
       ('UA958', 'SFO', 0),
       ('QR017', 'DOH', 11),
       ('TK1725', 'IST', 25);

SELECT COUNT(*) FROM flights;

SELECT flight_number, COUNT(*) as nombre 
FROM flights 
GROUP BY flight_number 
HAVING COUNT(*) > 1;

DELETE FROM flights;

SELECT COUNT(*) FROM flights; 

SELECT flight_number, flight_departure, delay, aeroports.name, aeroports.country 
FROM flights
JOIN aeroports ON flights.flight_departure = aeroports.code;

SELECT AVG(delay), flight_departure FROM flights GROUP BY flight_departure;

SELECT aeroports.country, AVG(flights.delay) FROM flights JOIN aeroports ON flights.flight_departure = aeroports.code GROUP BY country;