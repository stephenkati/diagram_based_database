CREATE TABLE patients(
  id INT PRIMARY KEY SERIAL,
  name VARCHAR,
  date_of_birth DATE
);

CREATE TABLE medical_histories(
  id INT PRIMARY KEY SERIAL,
  admitted_at TIMESTAMP,
  patient_id INT,
  status VARCHAR,
  FOREIGN KEY (patient_id) REFERENCES patients(id)
);

CREATE TABLE treatements(
  id INT PRIMARY KEY SERIAL,
  name VARCHAR,
  name VARCHAR,
);

CREATE TABLE join_history_treatments (
  id SERIAL PRIMARY KEY,
  medical_histories_id INT,
  treatment_id INT,
  FOREIGN KEY (medical_histories_id) REFERENCES medical_histories(id),
  FOREIGN KEY (treatment_id) REFERENCES treatments(id),
);

CREATE TABLE invoices(
  id INT PRIMARY KEY SERIAL,
  total_amount DECIMAL,
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_history_id INT,
  FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id),
  CONSTRAINT unique_medical_history_id UNIQUE (medical_history_id)
);

CREATE TABLE invoice_item(
  id INT PRIMARY KEY SERIAL,
  unit_price DECIMAL,
  quantity INT,
  total_price DECIMAL,
  invoice_id INT,
  treatement_id INT,
  FOREIGN KEY invoice_id REFERENCES invoices(id),
  FOREIGN KEY treatement_id REFERENCES treatements(id)
);

CREATE INDEX patient_id_index ON medical_histories (patient_id);
CREATE INDEX medical_histories_id_index ON join_history_treatments (medical_histories_id);
CREATE INDEX treatment_id ON join_history_treatments (treatment_id);
CREATE INDEX medical_history_id ON invoices (medical_history_id);
CREATE INDEX invoice_id ON invoice_item (invoice_id);
CREATE INDEX treatement_id ON invoice_item (treatement_id);