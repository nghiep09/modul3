create database qlcl;

create table Classes(
ClassID int primary key,
ClassName varchar(50)
);
create table Students(
StudentID int primary key,
StudentName varchar(50),
Age int,
Email varchar(100)
);
create table ClassStudent(
StudentID int,
foreign key(StudentID) references Students(StudentID),
ClassID int,
foreign key(ClassID) references Classes(ClassID)
);
create table Subjects(
SubjectID int primary key,
SubjectName varchar(50)
);
create table Marks(
Mark int,
StudentID int,
foreign key(StudentID) references Students(StudentID),
SubjectID int,
foreign key(SubjectID) references Subjects(SubjectID)
);

insert into students values (1, 'Nguyễn Quang An', 18,'an@yahoo.com');
insert into students values (2, 'Nguyen Cong Vinh', 20,'vinh@gmail.com');
insert into students values (3, 'Nguyen Van Quyen', 19,'quyen');
insert into students values (4, 'Pham Thanh Binh', 25,'binh@gmail.com');
insert into students values (5, 'Nguyen Van Tai Em', 30,'taiem@sport.vn');

insert into classes values (1,'C0706L');
insert into classes values (2,'C0708G');

insert into ClassStudent values (1,1);
insert into ClassStudent values (2,1);
insert into ClassStudent values (3,2);
insert into ClassStudent values (4,2);
insert into ClassStudent values (5,2);

insert into Subjects values (1,'SQL');
insert into Subjects values (2,'java');
insert into Subjects values (3,'C');
insert into Subjects values (4,'Visual Basic');

insert into Marks values (8,1,1);
insert into Marks values (4,1,2);
insert into Marks values (9,1,1);
insert into Marks values (7,3,1);
insert into Marks values (3,4,1);
insert into Marks values (5,5,2);
insert into Marks values (8,3,3);
insert into Marks values (1,5,3);
insert into Marks values (3,4,2);


-- câu1
select*from students;
-- câu2
select * from subjects;
-- câu3

-- câu4
select  SubjectName from Subjects where SubjectID=(select SubjectID from marks where Mark= (select max(mark) from marks ));

-- câu5

select * from marks order by Mark desc;

-- câu6

alter table Subjects  modify column SubjectName varchar(255) not null;

-- câu 7

-- câu 8

select*from students where age between 15 and 50;

-- câu 9

-- câu 10
-- không thể xóa hàng cha.chưa làm được
delete from students where StudentID =1;

-- câu 11
 alter table students 
 add column Status bit default 1;
 
 -- câu 12
 update students 
 set Status = 0;










