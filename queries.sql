-- /*Queries that provide answers to the questions from all projects.*/

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

SELECT owners.id, full_name, name
FROM owners
JOIN animals
ON owners.id = owner_id
WHERE full_name = 'Melody Pond';

SELECT species.id, species.name, animals.name
FROM species 
JOIN animals
ON species.id = species_id
WHERE species.name = 'Pokemon'; 

SELECT owners.id, owners.full_name, animals.name
FROM owners
LEFT JOIN animals
ON owners.id = owner_id;

SELECT species.id, species.name, COUNT(animals.name)
FROM species 
JOIN animals
ON species.id = species_id
GROUP BY species.id;

SELECT species_id, species.name AS specie, animals.name
FROM species 
JOIN animals
ON species.id = species_id
JOIN owners
ON owners.id = owner_id
WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

SELECT owners.full_name, animals.name
FROM owners
JOIN animals
ON owners.id = owner_id
WHERE full_name = 'Dean Winchester' AND escape_attempt = 0; 

SELECT owners.full_name, COUNT(owners.id)
FROM owners
JOIN animals
ON owners.id = owner_id
GROUP BY owners.id
ORDER BY COUNT(owners.id) DESC;