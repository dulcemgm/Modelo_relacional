CREATE DATABASE employeedp;
USE employeedp;

CREATE TABLE languages(
	idLanguage INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY (idLanguage)
);

CREATE TABLE department(
	idDepartment INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
	compant_code VARCHAR(50) NOT NULL,
    PRIMARY KEY(idDepartment)
); 
CREATE TABLE employee (
	idEmployee INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    language_id INT NOT NULL,
    INDEX (language_id),
    FOREIGN KEY(language_id) REFERENCES languages (idLanguage),
    PRIMARY KEY(idEmployee)
);

CREATE TABLE employee_department(
	idEmployee_department INT NOT NULL AUTO_INCREMENT,
    employee_id INT NOT NULL,
    INDEX(employee_id),
    FOREIGN KEY(employee_id) REFERENCES employee (idEmployee),
    department_id INT NOT NULL,
    INDEX(department_id),
    FOREIGN KEY(department_id) REFERENCES department(idDepartment),
    PRIMARY KEY(idEmployee_department)
);
