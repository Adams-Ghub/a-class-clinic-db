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

CREATE TABLE history_and_treatments (
	medical_history_id INT, 
	treatment_id INT, 
	FOREIGN KEY (medical_history_id)REFERENCES medical_histories(id), 
	FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);


ALTER TABLE medical_histories ADD CONSTRAINT FK_patient FOREIGN KEY(patient_id) REFERENCES patients(id);

ALTER TABLE invoices ADD CONSTRAINT FK_medical_history FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id);

ALTER TABLE invoice_items ADD CONSTRAINT FK_treatment FOREIGN KEY(treatment_id) REFERENCES treatments(id);

ALTER TABLE invoice_items ADD CONSTRAINT FK_invoice FOREIGN KEY(invoice_id) REFERENCES invoices(id);