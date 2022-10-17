create database students;

create table students.student (
 id int auto_increment primary key,
 full_name varchar(50) not null,
 phone_number varchar(20),
 birth_day date,
 created_at datetime,
 updated_at datetime);
 
 create table students.course (
 id int auto_increment primary key,
 name varchar(200) not null,
 lecture varchar(50),
 start_time date,
 end_time date,
 room int,
 created_at datetime,
 updated_at datetime);
 
 create table students.student_course (
 id int auto_increment primary key,
 student_id int not null,
 course_id int not null,
 fee double,
 created_at datetime,
 updated_at datetime,
 foreign key (student_id) references student(id),
 foreign key (course_id) references course(id));
 
 create table students.testing (
 id int auto_increment primary key,
 student_id int not null,
 course_id int not null,
 score float null,
 tested_on date null,
 created_at datetime null,
 updated_at datetime null,
 foreign key (student_id) references student(id),
 foreign key (course_id) references course(id));