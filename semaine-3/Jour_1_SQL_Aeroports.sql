CREATE TABLE aeroports (
    code TEXT,
    name TEXT,
    country TEXT,
    capacite INTEGER
);

INSERT INTO aeroports (code, name, country, capacite)
VALUES ('CDG', 'Paris Charles de Gaulle', 'France', 76),
       ('JFK', 'New York JFK', 'USA', 90),
       ('DXB', 'Dubai International', 'UAE', 88),
       ('LHR', 'London Heathrow', 'UK', 82),
       ('HND', 'Tokyo Haneda', 'Japan', 94),
       ('SIN', 'Singapore Changi', 'Singapore', 96),
       ('AMS', 'Amsterdam Schiphol', 'Netherlands', 85),
       ('FRA', 'Frankfurt Airport', 'Germany', 80),
       ('IST', 'Istanbul Airport', 'Turkey', 89),
       ('MAD', 'Madrid-Barajas', 'Spain', 83),
       ('BCN', 'Barcelona-El Prat', 'Spain', 81),
       ('FCO', 'Rome Fiumicino', 'Italy', 86),
       ('SYD', 'Sydney Airport', 'Australia', 84),
       ('YVR', 'Vancouver International', 'Canada', 88),
       ('LAX', 'Los Angeles International', 'USA', 78),
       ('ORD', 'Chicago O''Hare', 'USA', 75),
       ('SFO', 'San Francisco International', 'USA', 87),
       ('ATL', 'Atlanta Hartsfield-Jackson', 'USA', 74),
       ('PEK', 'Beijing Capital', 'China', 82),
       ('PVG', 'Shanghai Pudong', 'China', 80),
       ('HKG', 'Hong Kong International', 'China', 91),
       ('ICN', 'Incheon International', 'South Korea', 95),
       ('BKK', 'Suvarnabhumi Airport', 'Thailand', 83),
       ('KUL', 'Kuala Lumpur International', 'Malaysia', 84),
       ('ZRH', 'Zurich Airport', 'Switzerland', 92),
       ('MUC', 'Munich Airport', 'Germany', 90),
       ('DOH', 'Hamad International', 'Qatar', 93),
       ('GRU', 'São Paulo Guarulhos', 'Brazil', 77),
       ('MEX', 'Mexico City International', 'Mexico', 72),
       ('JNB', 'O.R. Tambo International', 'South Africa', 79);

SELECT * FROM aeroports WHERE country = 'France';
SELECT * FROM aeroports ORDER BY capacite DESC;
SELECT * FROM aeroports WHERE capacite > 85;
SELECT * FROM aeroports WHERE country = 'USA' AND capacite > 80;
SELECT COUNT(*) FROM aeroports;
SELECT * FROM aeroports WHERE capacite < 80 ORDER BY capacite ASC;
SELECT name, country FROM aeroports WHERE capacite > 90 ORDER BY capacite DESC;