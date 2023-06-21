CREATE DATABASE a_class_clinic_db;

CREATE TABLE medical_histories(
	id INT GENERATED ALWAYS AS IDENTITY,
	admitted_at TIMESTAMP,
	patient_id INT,
	status VARCHAR(200),
	PRIMARY KEY(id)
);

CREATE TABLE patients(
	id INT GENERATED ALWAYS AS IDENTITY,
	status VARCHAR(200),
	date_of_birth DATE,
	PRIMARY KEY(id)
);

CREATE TABLE treatments(
	id INT GENERATED ALWAYS AS IDENTITY,
	type VARCHAR(200),
	name VARCHAR(200),
	PRIMARY KEY(id)
);

CREATE TABLE invoices(
	id INT GENERATED ALWAYS AS IDENTITY,
	total_amount DECIMAL,
	generated_at TIMESTAMP,
	paid_at TIMESTAMP,
	medical_history_id INT,
	PRIMARY KEY(id)
);

