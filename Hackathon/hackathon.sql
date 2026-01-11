create database hackathon;
use hackathon;

create table patient (
	patient_id VARCHAR(5) not null primary key,
	patient_full_name VARCHAR(100) not null,
	patient_dob date not null,
	patient_gender VARCHAR(10) not null,
	patient_phone VARCHAR(15) not null unique
);

create table doctor (
	doctor_id VARCHAR(5) not null primary key,
    doctor_full_name VARCHAR(100) not null,
	doctor_specialty VARCHAR(100) not null,
	doctor_phone VARCHAR(15) not null unique
);

create table department (
	department_id VARCHAR(5) not null primary key,
	department_name VARCHAR(100) not null unique,
	department_location VARCHAR(100) not null
);

create table appointment (
	appointment_id INT not null primary key,
	patient_id VARCHAR(5),
	doctor_id VARCHAR(5),
	department_id VARCHAR(5),
	appointment_date DATE not null,
	appointment_status VARCHAR(20) not null,
	foreign key(patient_id) references patient(patient_id),
    foreign key(doctor_id) references doctor(doctor_id),
    foreign key(department_id) references department(department_id)
);


INSERT INTO patient (patient_id, patient_full_name, patient_dob, patient_gender, patient_phone)
VALUES
	('P001', 'Nguyễn Văn An', '1995-03-15', 'Nam', '0912345678'),
    ('P002','Trần Thị Bích','1998-07-22','Nữ','0923456789'),
    ('P003','Lê Hoàng Minh','1987-11-05','Nam','0934567890'),
    ('P004','Phạm Thu Hà','2000-01-18','Nữ','0945678901'),
    ('P005','Võ Quốc Huy','1992-09-30','Nam','0956789012');
    
INSERT INTO doctor (doctor_id, doctor_full_name, doctor_specialty, doctor_phone)
VALUES
	('D001','BS.Nguyễn Thanh Tùng','Nội khoa','0901112222'),
    ('D002','BS. Trần Minh Đức','Ngoại khoa','0902223333'),
	('D003','BS.Lê Thị Lan','Nhi khoa','0903334444'),
	('D004','BS. Phạm Quốc Bảo','Tim mạch','0904445555'),
	('D005','BS. Võ Hoàng Yến','Da liễu','0905556666');
    
INSERT INTO department (department_id, department_name, department_location)
VALUES 
	('DP01','Khoa Nội','Tầng 1'),
	('DP02','Khoa Ngoại','Tầng 2'),
	('DP03','Khoa Nhi','Tầng 3'),
	('DP04','Khoa Tim mạch','Tầng 4'),
	('DP05','Khoa Da liễu','Tầng 5');

INSERT INTO appointment (appointment_id,patient_id,doctor_id,department_id,appointment_date,appointment_status)
VALUES
	(1,'P001','D001','DP01','2025-10-01','Completed'),
	(2,'P002','D003','DP03','2025-10-02','Completed'),
	(3,'P003','D004','DP04','2025-10-03','Pending'),
	(4,'P004','D002','DP02','2025-10-04','Cancelled'),
	(5,'P005','D005','DP05','2025-10-05','Completed');
    


SELECT * FROM patient;
SELECT * FROM appointment;
SELECT * FROM department;
SELECT * FROM doctor;

UPDATE patient
SET patient_phone = '096536868'
WHERE patient_id = 'P003';

UPDATE appointment
SET appointment_status = "Cancelled"
WHERE appointment_id = 3;

DELETE FROM appointment	
WHERE appointment_status = "Cancelled" 
AND appointment_date < "2025-10-04";

-- PHẦN 2: Truy vấn dữ liệu cơ bản
-- Câu 6
SELECT 
	appointment_id, 
    appointment_date, 
    appointment_status 
FROM appointment
WHERE appointment_status = 'Completed'
AND appointment_date > "2025-10-01";

-- Câu 7
SELECT 
	patient_full_name, 
	patient_phone, 
	patient_gender
FROM patient
WHERE patient_phone like '09%';

-- Câu 8
SELECT 
	appointment_id, 
	patient_id, 
	appointment_date
FROM appointment
order by appointment_date desc;

-- Câu 9
SELECT * FROM appointment
WHERE appointment_status = 'Completed'
order by appointment_status desc
limit 3;

-- Câu 10
SELECT 
	patient_id,
	patient_full_name
FROM patient
limit 5 offset 2;

-- PHẦN 3: Truy vấn dữ liệu nâng cao
-- Câu 11
SELECT
	a.appointment_id,
    p.patient_full_name,
    d.doctor_id,
    a.appointment_date
FROM patient p
JOIN doctor d on p.patient_full_name =p.patient_full_name
JOIN appointment a on a.appointment_date = a.appointment_date
WHERE appointment_status = 'Completed';


-- Câu 12
SELECT
	d.doctor_id,
    d.doctor_full_name,
    appointment_id
FROM doctor d
JOIN appointment on d.doctor_full_name = d.doctor_full_name;

-- Câu 13
SELECT appointment_status, COUNT(appointment_id) AS 'total_appointment'
from appointment 
group by appointment_status;

-- Câu 17
SELECT 
	a.appointment_id, 
    p.patient_full_name, 
    d.doctor_full_name, 
    de.department_name,
    a.appointment_status
FROM appointment a
JOIN patient p on appointment_id = appointment_id
JOIN doctor d on  p.patient_full_name =  p.patient_full_name
JOIN department de on d.doctor_full_name = d.doctor_full_name

group by appointment_id, 
    patient_full_name, 
    doctor_full_name, 
    department_name,
    appointment_status;










