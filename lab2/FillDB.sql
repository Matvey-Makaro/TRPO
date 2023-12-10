-- Create Positions
INSERT INTO Positions(name) VALUES("Специалист");

-- Create Departments
INSERT INTO Department(name) VALUES("Тестовый отдел");

-- Create WorkSchedules
INSERT INTO WorkSchedule(start_time, num_of_working_seconds, time_for_lunch, lunch_duration_seconds, is_flexible_schedule)
VALUES('09:00:00', 28800, '13:00:00', 1800, 0);

-- Crate Users
INSERT INTO User(positions_id, department_id, work_schedule_id, name, surname, patronymic,
phone_num, role, login, password)
VALUES(1, 1, 1, "Александр", "Рубель", "Алебардович", "+375291490532", "Employee", "login", "password");

INSERT INTO User(positions_id, department_id, work_schedule_id, name, surname, patronymic,
phone_num, role, login, password)
VALUES(1, 1, 1, "Admin", "Admin", "Admin", "+375291111111", "Admin", "Root", "root");

-- Create ReportItemType
INSERT INTO ReportItemType(name, is_working_time)
VALUES("Разработка", 1);

INSERT INTO ReportItemType(name, is_working_time)
VALUES("Обед/Перерыв", 0);

-- CreateProject
INSERT INTO Project(manager_id, name)
VALUES(2, "Тестовый проект");

-- Create TaskType
INSERT INTO TaskType(name)
VALUES("Тестовый тип 1");

-- Create Task
INSERT INTO Task(project_id, reporter_id, assignee_id, task_type_id,
creation_date, time_spent, time_given, num_in_project, name, description, status)
VALUES(1, 2, 1, 1, '2023-12-11 11:11:11', 3600, 7200, 1, 
"Первая тестовая задача", "Описание", "Open");

INSERT INTO Task(project_id, reporter_id, assignee_id, task_type_id,
creation_date, time_spent, time_given, num_in_project, name, description, status)
VALUES(1, 2, 1, 1, '2023-12-11 11:11:11', 3600, 7200, 1, 
"Вторая тестовая задача", "Описание", "Open");

-- CreateReport
INSERT INTO Report(user_id, date, creation_time, start_working_day, end_working_day)
VALUES(1, '2023-12-11', '2023-12-11 11:11:11', '08:00:00', '17:00:00');

UPDATE Report
SET user_id = 1, 
date = '2023-12-11', 
creation_time = '2023-12-11 11:11:11', 
start_working_day = '08:00:00', 
end_working_day = '16:00:00'
WHERE report_id = 1;