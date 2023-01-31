DROP DATABASE IF EXISTS medical_centers;

CREATE DATABASE medical_centers;

\c medical_centers

CREATE TABLE centers (
    center_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    address TEXT
);

CREATE TABLE doctors (
    doctor_id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    office_number TEXT
);

CREATE TABLE patients (
    patient_id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    age INTEGER,
    sex TEXT
);

CREATE TABLE diseases (
    disease_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE visits (
    visit_id SERIAL PRIMARY KEY,
    date DATE,
    center INTEGER REFERENCES centers ON DELETE CASCADE,
    doctor INTEGER REFERENCES doctors ON DELETE CASCADE,
    patient INTEGER REFERENCES patients ON DELETE CASCADE,
    disease INTEGER REFERENCES diseases ON DELETE CASCADE
);