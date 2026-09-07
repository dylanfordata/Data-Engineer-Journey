CREATE TABLE aeroports (
    code TEXT,
    name TEXT,
    country TEXT,
    capacite INTEGER
);


SELECT * FROM aeroports WHERE country = 'France';
SELECT * FROM aeroports ORDER BY capacite DESC;
SELECT * FROM aeroports WHERE capacite > 85;
SELECT * FROM aeroports WHERE country = 'USA' AND capacite > 80;
SELECT COUNT(*) FROM aeroports;
SELECT * FROM aeroports WHERE capacite < 80 ORDER BY capacite ASC;
SELECT name, country FROM aeroports WHERE capacite > 90 ORDER BY capacite DESC;