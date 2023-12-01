create database EfficiencyForge;
use EfficiencyForge;

CREATE TABLE Positions (
positions_id INTEGER NOT NULL AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
PRIMARY KEY(positions_id)
);

CREATE TABLE TaskType (
task_type_id INTEGER NOT NULL AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
PRIMARY KEY(task_type_id)
);

CREATE TABLE BusinessTrip (
business_trip_id INTEGER NOT NULL AUTO_INCREMENT,
start_time DATETIME NOT NULL,
end_time DATETIME,
order_name VARCHAR(200),
place VARCHAR(200),
PRIMARY KEY(business_trip_id)
);

CREATE TABLE Department (
department_id INTEGER NOT NULL AUTO_INCREMENT,
name VARCHAR(200) NOT NULL,
PRIMARY KEY(department_id)
);

CREATE TABLE ReportItemType (
report_item_type_id INTEGER NOT NULL AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
is_working_time BIT(1) NOT NULL,
PRIMARY KEY(report_item_type_id)
);

CREATE TABLE WorkSchedule (
work_schedule_id INTEGER NOT NULL AUTO_INCREMENT,
start_time DATETIME NOT NULL,
is_flexible_schedule BIT(1) NOT NULL,
num_of_working_seconds INTEGER NOT NULL,
time_for_lunch TIME,
lunch_duration_seconds INTEGER,
PRIMARY KEY(work_schedule_id)
);

CREATE TABLE Holidays (
holidays_id INTEGER NOT NULL AUTO_INCREMENT,
start_time DATE NOT NULL,
end_time DATE,
name VARCHAR(200) NOT NULL,
is_day_off BIT(1) NOT NULL,
PRIMARY KEY(holidays_id)
);

CREATE TABLE Notification (
notification_id INTEGER NOT NULL AUTO_INCREMENT,
text VARCHAR(400) NOT NULL,
PRIMARY KEY(notification_id)
);

CREATE TABLE User (
user_id INTEGER NOT NULL AUTO_INCREMENT,
positions_id INTEGER NOT NULL,
department_id INTEGER NOT NULL,
work_schedule_id INTEGER NOT NULL,
name VARCHAR(45),
surname VARCHAR(45), 
patronymic VARCHAR(45),
phone_num VARCHAR(13),
role ENUM('Admin', 'Manager', 'Employee') NOT NULL,
login VARCHAR(60) NOT NULL,
password VARCHAR(60) NOT NULL,
PRIMARY KEY(user_id),
FOREIGN KEY(positions_id) REFERENCES Positions(positions_id),
FOREIGN KEY(department_id) REFERENCES Department(department_id),
FOREIGN KEY(work_schedule_id) REFERENCES WorkSchedule(work_schedule_id)
-- CONSTRAINT user_login_unique UNIQUE(login),
-- CONSTRAINT user_login_chk CHECK(LENGTH(login) BETWEEN 6 AND 60),
-- CONSTRAINT user_name_chk CHECK(name REGEXP '^([a-zA-Z-]{0,45}|[а-яА-ЯёЁ-]{0,45})$'), 
-- CONSTRAINT user_surname_chk CHECK(surname REGEXP '^([a-zA-Z-]{0,45}|[а-яА-ЯёЁ-]{0,45})$'),
-- CONSTRAINT user_patronymic_chk CHECK(patronymic REGEXP '([a-zA-Z-]{0,45}|[а-яА-ЯёЁ-]{0,45})'),
-- CONSTRAINT user_phone_chk CHECK (phone_num REGEXP '^([+]{1}375|80)(29|25|44|33)([0-9]{7})$'),
);

CREATE TABLE Project (
project_id INTEGER NOT NULL AUTO_INCREMENT,
manager_id INTEGER NOT NULL,
PRIMARY KEY(project_id ),
FOREIGN KEY(manager_id) REFERENCES User(user_id)
);

CREATE TABLE Task (
task_id INTEGER NOT NULL AUTO_INCREMENT,
project_id INTEGER NOT NULL,
reporter_id INTEGER NOT NULL,
assignee_id INTEGER NOT NULL,
task_type_id INTEGER NOT NULL,
PRIMARY KEY(task_id ),
FOREIGN KEY(project_id) REFERENCES Project(project_id),
FOREIGN KEY(reporter_id) REFERENCES User(user_id),
FOREIGN KEY(assignee_id) REFERENCES User(user_id),
FOREIGN KEY(task_type_id) REFERENCES TaskType(task_type_id)
);

CREATE TABLE Vacation (
vacation_id INTEGER NOT NULL AUTO_INCREMENT,
employee_id INTEGER NOT NULL,
start_time DATETIME NOT NULL,
end_time DATETIME NOT NULL,
type ENUM('Working vacation', 'Unpaid leave', 'Paid leave', 'Maternity leave'),
status ENUM('disapprove', 'approve'),
PRIMARY KEY(vacation_id ),
FOREIGN KEY(employee_id) REFERENCES User(user_id)
);

CREATE TABLE Report (
report_id INTEGER NOT NULL AUTO_INCREMENT,
user_id INTEGER NOT NULL,
date DATE NOT NULL,
creation_time DATETIME NOT NULL,
start_working_day TIME NOT NULL,
end_working_day TIME NOT NULL,
PRIMARY KEY(report_id ),
FOREIGN KEY(user_id) REFERENCES User(user_id)
);

CREATE TABLE ReportItem (
report_item_id INTEGER NOT NULL AUTO_INCREMENT,
report_id INTEGER NOT NULL,
task_id INTEGER NOT NULL,
report_item_type_id INTEGER NOT NULL,
start_time TIME NOT NULL,
end_time TIME NOT NULL,
text VARCHAR(100),
PRIMARY KEY(report_item_id ),
FOREIGN KEY(report_id) REFERENCES Report(report_id),
FOREIGN KEY(task_id) REFERENCES Task(task_id),
FOREIGN KEY(report_item_type_id) REFERENCES ReportItemType(report_item_type_id)
);

CREATE TABLE User_BusinessTrip (
user_business_trip_id INTEGER NOT NULL AUTO_INCREMENT,
user_id INTEGER NOT NULL,
business_trip_id INTEGER NOT NULL,
PRIMARY KEY(user_business_trip_id),
FOREIGN KEY(user_id) REFERENCES User(user_id),
FOREIGN KEY(business_trip_id) REFERENCES BusinessTrip(business_trip_id)
);

CREATE TABLE User_Notification (
user_notification_id INTEGER NOT NULL AUTO_INCREMENT,
user_id INTEGER NOT NULL,
notification_id INTEGER NOT NULL,
PRIMARY KEY(user_notification_id),
FOREIGN KEY(user_id) REFERENCES User(user_id),
FOREIGN KEY(notification_id) REFERENCES Notification(notification_id)
);
