CREATE TABLE medical_histories (
    id SERIAL PRIMARY KEY INT,
    admitted_at TIMESTAMP,
    patient_id INT,
    status VARCHAR(200),
    CONSTRAINT fk_patient_id
    FOREIGN KEY(patient_id)
	REFERENCES patients(id)
);

Create Index medical_histories_patient_id on medical_histories(patient_id);

CREATE TABLE patients (
  id SERIAL PRIMARY KEY INT,
  name VARCHAR(200),
  date_of_birth DATE
);

CREATE TABLE treatments (
  id SERIAL PRIMARY KEY INT,
  type VARCHAR(200),
  name VARCHAR(200),
);

CREATE TABLE diagnosis (
  medical_histories_id INT,
  treatments_id INT,
  CONSTRAINT fk_medical_histories
    FOREIGN KEY(medical_histories_id)
	  REFERENCES medical_histories(id),
  CONSTRAINT fk_treatments
    FOREIGN KEY(treatments_id)
	REFERENCES treatments(id)
);

CREATE TABLE invoice_items (
    id SERIAL PRIMARY KEY INT,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    invoice_id INT,
    treatment_id INT
    CONSTRAINT fk_invoice
    FOREIGN KEY(invoice_id)
	REFERENCES invoices(id)
);

Create Index invoice_items_invoice_id on invoice_items(invoice_id);

CREATE TABLE invoices (
    id SERIAL PRIMARY KEY INT,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT,
    CONSTRAINT fk_medical_history_invoice
    FOREIGN KEY(medical_history_id)
	REFERENCES medical_histories(id)
);

Create Index invoices_medical_history_id on invoices(medical_history_id);
