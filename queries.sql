/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';

SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

SELECT name FROM animals WHERE neutered IS true AND escape_attempt < 3;

SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');

SELECT name, escape_attempt FROM animals WHERE WEIGHT_KG > 10.5;

SELECT * FROM animals WHERE neutered IS true;

SELECT * FROM animals WHERE name NOT IN ('Gabumon');

SELECT * FROM animals WHERE WEIGHT_KG >= 10.4 AND WEIGHT_KG <= 17.3;

SELECT COUNT(name) FROM animals;

SELECT COUNT(name) FROM animals WHERE escape_attempt = 0;

SELECT AVG(WEIGHT_KG) FROM animals;

SELECT name, escape_attempt FROM animals 
WHERE escape_attempt = (SELECT MAX(escape_attempt) FROM animals);

SELECT species, MIN(WEIGHT_KG), MAX(WEIGHT_KG) FROM animals GROUP BY species;

SELECT species, AVG(escape_attempt) FROM animals 
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;