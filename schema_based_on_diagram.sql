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