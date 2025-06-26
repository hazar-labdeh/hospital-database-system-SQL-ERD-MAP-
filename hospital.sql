CREATE TABLE emp (
    emp_id INT PRIMARY KEY,
    start_date DATE,
    last VARCHAR(30),
    first VARCHAR(30),
    salary DECIMAL(10,2),
    gender CHAR(1)
);
CREATE TABLE manager (
    emp_id INT,
    position VARCHAR(50),
    d_id INT,
    PRIMARY KEY (emp_id),
    FOREIGN KEY (emp_id) REFERENCES emp(emp_id),
    FOREIGN KEY (d_id) REFERENCES Department(d_id)
);
CREATE TABLE nurse (
    emp_id INT PRIMARY KEY,
    shift VARCHAR(20),
    FOREIGN KEY (emp_id) REFERENCES emp(emp_id)
);
CREATE TABLE doc (
    emp_id INT PRIMARY KEY,
    degree VARCHAR(50),
    specialty VARCHAR(50),
    FOREIGN KEY (emp_id) REFERENCES emp(emp_id)
);
CREATE TABLE Receptionist (
    emp_id INT PRIMARY KEY,
    shift VARCHAR(20),
    bill_id INT,
    FOREIGN KEY (emp_id) REFERENCES emp(emp_id),
    FOREIGN KEY (bill_id) REFERENCES bill(bill_id)
);
CREATE TABLE Department (
    d_id INT PRIMARY KEY,
    d_name VARCHAR(50),
    emp_id INT,
    room_num INT,
    FOREIGN KEY (emp_id) REFERENCES emp(emp_id),
    FOREIGN KEY (room_num) REFERENCES room(room_num)
);
CREATE TABLE room (
    room_num INT PRIMARY KEY,
    bed_num INT UNIQUE,
    status VARCHAR(20),
    patient_id INT,
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id)
);
CREATE TABLE patient (
    patient_id INT PRIMARY KEY,
    first VARCHAR(30),
    last VARCHAR(30),
    date DATE,
    "case" VARCHAR(100),
    gender CHAR(1),
    age INT,
    bill_id INT,
    FOREIGN KEY (bill_id) REFERENCES bill(bill_id)
);
CREATE TABLE patient_phone (
    phone VARCHAR(15),
    patient_id INT,
    PRIMARY KEY (phone, patient_id),
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id)
);
CREATE TABLE bill (
    bill_id INT PRIMARY KEY,
    bill_name VARCHAR(100),
    cost DECIMAL(10,2)
);
CREATE TABLE attend (
    emp_id INT,
    patient_id INT,
    check_up VARCHAR(100),
    time time,
    PRIMARY KEY (emp_id, patient_id),
    FOREIGN KEY (emp_id) REFERENCES emp(emp_id),
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id)
);
CREATE TABLE medicine (
    med_id INT PRIMARY KEY,
    price DECIMAL(10,2),
    name VARCHAR(100)
);
CREATE TABLE takes (
    med_id INT,
    patient_id INT,
    dose VARCHAR(50),
    PRIMARY KEY (med_id, patient_id),
    FOREIGN KEY (med_id) REFERENCES medicine(med_id),
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id)
);
CREATE TABLE treat (
    emp_id INT,
    patient_id INT,
    Diagnosis varchar(100)not NULL,
    PRIMARY KEY (emp_id, patient_id),
    FOREIGN KEY (emp_id) REFERENCES doc(emp_id),
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id)
);

CREATE TABLE records (
    rec_num INT PRIMARY KEY,
    emp_id INT,
    patient_id INT,
    FOREIGN KEY (emp_id) REFERENCES emp(emp_id),
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
    UNIQUE (emp_id, patient_id)
);