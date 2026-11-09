
 
create table students(
 id serial primary key,
 name text not null,
 email text not null unique,
 birthday timestamp,
 created_at timestamp not null default now()
);

create table courses( 
id serial primary key,
course text not null,
teacher_name text not null,
credits integer not null check(credits>0)
);

create table grades(
id serial primary key,
student_id integer not null references students(id),
course_id integer not null references courses(id),
grade integer not null check(grade>=0 and grade<=100),
unique(student_id,course_id)
);

insert into courses(course,teacher_name,credits)
values ('Database','Alex_Kim',4),('Python','Vladimir_Egay',6),('Sql','Alina_Kim',5)

insert into students(name,email)
values ('Grilla','g@mail.com'),('Peter','p@mail.com'),('Loid','l@mail.com')

insert into grades(student_id,course_id,grade)
values (1,2,60),(2,2,70),(3,3,60),(3,2,40)

update students
set birthday=now()
where id=1

DELETE FROM grades WHERE student_id = 3

delete from students where id=3