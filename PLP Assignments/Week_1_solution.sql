-- Creating Database database
CREATE DATABASE hospital_db;

-- Use hospital_db
USE hospital_db;

-- Creating table patients
CREATE TABLE patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    gender VARCHAR(30) NOT NULL,
    language VARCHAR(50) NOT NULL
);

-- Creating table providers
CREATE TABLE providers (
    provider_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    provider_speciality VARCHAR(50) NOT NULL,
    email_address VARCHAR(50),
    phone_number VARCHAR(50),
    date_joined DATE
);

-- Creating table visits
CREATE TABLE visits (
    visit_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    provider_id INT,
    date_of_visit DATE NOT NULL,
    date_scheduled DATE NOT NULL,
    visit_department_id INT NOT NULL,
    visit_type VARCHAR(100) NOT NULL,
    blood_pressure_systolic INT,
    blood_pressure_diastolic DECIMAL,
    pulse DECIMAL,
    visit_status VARCHAR(100) NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (provider_id) REFERENCES providers(provider_id)
);

-- Creating table ed_visits
CREATE TABLE ed_visits (
    ed_visit_id INT PRIMARY KEY AUTO_INCREMENT,
    visit_id INT,
    patient_id INT,
    acuity INT NOT NULL,
    reason_for_visit VARCHAR(100) NOT NULL,
    disposition VARCHAR(255) NOT NULL,
    FOREIGN KEY (visit_id) REFERENCES visits(visit_id),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

-- Create table admissions
CREATE TABLE admissions (
    admission_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    admission_date DATE NOT NULL,
    discharge_date DATE NOT NULL,
    discharge_disposition VARCHAR(255) NOT NULL,
    service VARCHAR(255) NOT NULL,
    primary_diagnosis VARCHAR(255) NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

-- Create table discharges
CREATE TABLE discharges (
    discharge_id INT PRIMARY KEY AUTO_INCREMENT,
    admission_id INT,
    patient_id INT,
    discharge_date DATE NOT NULL,
    discharge_disposition VARCHAR(100) NOT NULL,
    FOREIGN KEY (admission_id) REFERENCES admissions(admission_id),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);