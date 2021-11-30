/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    date_of_birth DATE,
    escape_attempt INT,
    neutered BOOLEAN,
    WEIGHT_KG DECIMAL,
    PRIMARY KEY(id)
);
