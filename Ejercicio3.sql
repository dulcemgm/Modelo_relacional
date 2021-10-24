CREATE DATABASE control_general;
USE control_general;

CREATE TABLE seat(
	seat_number INT NOT NULL AUTO_INCREMENT,
    seat_position VARCHAR(50) NOT NULL,
    PRIMARY KEY(seat_number)
);

CREATE TABLE instructor(
	instructor_number INT NOT NULL AUTO_INCREMENT,
    instructor_name VARCHAR(50) NOT NULL,
    instructor_faculty VARCHAR(50) NOT NULL,
    PRIMARY KEY(instructor_number)
);

CREATE TABLE profesor(
	profesor_id INT NOT NULL AUTO_INCREMENT,
    profesor_name VARCHAR(50) NOT NULL,
    profesor_faculty VARCHAR(50) NOT NULL,
    PRIMARY KEY(profesor_id)
);

CREATE TABLE section (
	section_number INT NOT NULL AUTO_INCREMENT,
    profesorId INT NOT NULL,
    INDEX (profesorId),
    FOREIGN KEY(profesorId) REFERENCES profesor (profesor_id),
    PRIMARY KEY(section_number)
);

CREATE TABLE student(
	student_id INT NOT NULL AUTO_INCREMENT,
    student_name VARCHAR(50) NOT NULL,
    student_address VARCHAR(50) NOT NULL,
    seatId INT NOT NULL,
    INDEX(seatId),
    FOREIGN KEY (seatId) REFERENCES seat (seat_number),
    PRIMARY KEY(student_id)
);

CREATE TABLE course(
	course_name VARCHAR(50) NOT NULL,
    student_number INT NOT NULL,
    studentId INT NOT NULL,
    INDEX(studentId),
    FOREIGN KEY(studentId) REFERENCES student(student_id),
    instructorId INT NOT NULL,
    INDEX(instructorId),
    FOREIGN KEY(instructorId) REFERENCES instructor(instructor_number),
    PRIMARY KEY(course_name)
);

CREATE TABLE class(
	course_name VARCHAR(50) NOT NULL,
    section_number VARCHAR(50) NOT NULL,
    num_registered INT NOT NULL,
    class_date_time DATETIME NOT NULL,
    courseId VARCHAR(50) NOT NULL,
    INDEX(courseId),
    FOREIGN KEY(courseId) REFERENCES course(course_name),
    sectionId INT NOT NULL,
    INDEX(sectionId),
    FOREIGN KEY (sectionId) REFERENCES section(section_number),
    PRIMARY KEY(course_name)
);