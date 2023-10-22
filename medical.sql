CREATE TABLE Speciality (
    speciality_id INT PRIMARY KEY AUTO_INCREMENT,
    classification VARCHAR(255)
);

CREATE TABLE Staff (
    staff_id INT PRIMARY KEY AUTO_INCREMENT,
    name_F VARCHAR(50),
    name_MI VARCHAR(50),
    name_L VARCHAR(50),
    role ENUM('Doctor', 'Nurse', 'AlliedHealthProfessional', 'SupportStaff'),
    specialty_id INT,
    office VARCHAR(255),
    DoB VARCHAR(10),
    phone VARCHAR(13),
    email VARCHAR(255),
    FOREIGN KEY (specialty_id) REFERENCES Speciality(speciality_id)
);

CREATE TABLE Patient (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    name_F VARCHAR(50),
    name_MI VARCHAR(50),
    name_L VARCHAR(50),
    address VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(13),
    gender ENUM('M', 'F'),
    DoB VARCHAR(10),
    balance DECIMAL(10,2)
);

CREATE TABLE Insurance (
    insurance_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    insurance_name VARCHAR(255),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);

CREATE TABLE Referral (
    referral_id INT PRIMARY KEY AUTO_INCREMENT,
    primary_staff_id INT,
    specialist_staff_id INT,
    specialty_id INT,
    referral_date VARCHAR(10),
    patient_id INT,
    FOREIGN KEY (primary_staff_id) REFERENCES Staff(staff_id),
    FOREIGN KEY (specialist_staff_id) REFERENCES Staff(staff_id),
    FOREIGN KEY (specialty_id) REFERENCES Speciality(speciality_id),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);

CREATE TABLE MedicalHistory (
    medical_history_id INT PRIMARY KEY AUTO_INCREMENT,
    diagnosis_info TEXT,
    surgeries TEXT,
    medication TEXT,
    allergies TEXT,
    patient_id INT,
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);

CREATE TABLE EmergencyContact (
    emergency_contact_id INT PRIMARY KEY AUTO_INCREMENT,
    name_F VARCHAR(50),
    name_MI VARCHAR(50),
    name_L VARCHAR(50),
    phone VARCHAR(13),
    email VARCHAR(255),
    patient_id INT,
    relation VARCHAR(100),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);

CREATE TABLE Appointment (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    date_appointment VARCHAR(10),
    time TIME,
    office_id INT,
    staff_id INT,
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id)
);

CREATE TABLE Test (
    test_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    staff_id INT,
    date_test VARCHAR(10),
    time TIME,
    status ENUM('Pending', 'Completed', 'Cancelled'),
    results TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id)
);

CREATE TABLE Prescription (
    prescription_id INT PRIMARY KEY AUTO_INCREMENT,
    staff_id INT,
    patient_id INT,
    drug_name VARCHAR(255),
    dosage VARCHAR(100),
    refills INT,
    date_prescription VARCHAR(10),
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);

CREATE TABLE Schedule (
    schedule_id INT PRIMARY KEY AUTO_INCREMENT,
    staff_id INT,
    date_schedule VARCHAR(10),
    start_time TIME,
    end_time TIME,
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id)
);

CREATE TABLE Invoice (
    invoice_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    balance DECIMAL(10,2),
    insurance_id INT,
    insurance_deduction DECIMAL(10,2),
    copay DECIMAL(10,2),
    due_date VARCHAR(10),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (insurance_id) REFERENCES Insurance(insurance_id)
);

CREATE TABLE MetaData (
    meta_data_id INT PRIMARY KEY AUTO_INCREMENT,
    login_info TEXT,
    changelog TEXT,
    identifier_number VARCHAR(100)
);

