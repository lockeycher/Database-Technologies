-- create tables

drop table memberof;
drop table enrolled;
drop table studentgroup;
drop table  course;
drop table student;

create table enrolled (
  StudentID     number(5),
  CourseID      number(4),
  Quarter       varchar(6),
  Year          number(4),
  
  primary key (StudentID, CourseID),
  foreign key (StudentID) references student(SID),
  foreign key (CourseID) references course(CID)
); 

create table memberof (
  StudentID     number(5),
  GroupID     	number(5),
  Joined        number(4),
  
  primary key (StudentID, GroupID),
  foreign key (StudentID) references student(SID),
  foreign key (GroupID) references studentgroup(GID)
);

create table student (
  LastName      varchar(40) not null,
  FirstName     varchar(40),
  SID           number(5),
  SSN           number(9),
  Career        varchar(4),
  Program       varchar(10),
  City          varchar(40),
  Started       number(4),
  
  primary key (SID),
  unique(SSN)
);

create table course (
  CID   number(4),
  CourseName    varchar(40),
  Department    varchar(4),
  CourseNr       char(3),

  primary key (CID)
);

create table studentgroup (
  GID     	number(5),
  Name  	varchar(40),
  PresidentID   number(5),
  Founded       number(4),
  
  primary key (GID),
  unique (Name),
  foreign key (PresidentID) references student(SID)
);



-- populate tables

delete from enrolled;
delete from memberof;
delete from studentgroup;
delete from student;
delete from course;

insert into enrolled
    values (11035, 1020, 'Fall', 2012);
insert into enrolled
    values (11035, 1092, 'Fall', 2012);
insert into enrolled
    values (75234, 3201, 'Winter', 2012);
insert into enrolled
    values (08871, 1092, 'Fall', 2013);
insert into enrolled
    values (39077, 1092, 'Fall', 2013);
insert into enrolled
    values (57923, 9219, 'Winter', 2013);
insert into enrolled
    values (60973, 9219, 'Winter', 2013);
insert into enrolled
    values (19992, 3201, 'Winter', 2013);
insert into enrolled
    values (60973, 8772, 'Spring', 2013);
insert into enrolled
    values (90421, 8772, 'Spring', 2013);
insert into enrolled
    values (90421, 2987, 'Spring', 2013);
insert into enrolled
    values (60973, 2987, 'Spring', 2013);

    
insert into memberof
    values (75234, 42, 2011);
insert into memberof
    values (11035, 221, 2010);
insert into memberof
    values (93321, 221, 2013);
insert into memberof
    values (75234, 2, 2011);
insert into memberof
    values (32105, 42, 2011);
insert into memberof
    values (32105, 2, 2012);
insert into memberof
    values (32105, 221, 2012);
insert into memberof
    values (32105, 101, 2013);


insert into student
    values ( 'Brennigan', 'Marcus', 90421, 987654321, 'UGRD', 'COMP-GAM', 'Evanston', 2010 );
insert into student
    values ( 'Patel', 'Deepa', 14662, null, 'GRD', 'COMP-SCI', 'Evanston', 2013 );
insert into student
    values ( 'Snowdon', 'Jonathan', 08871, 123123123, 'GRD', 'INFO-SYS', 'Springfield', 2009 );
insert into student
    values ( 'Starck', 'Jason', 19992, 789789789, 'UGRD', 'INFO-SYS', 'Springfield', 2009 )
insert into student
    values ( 'Johnson', 'Peter', 32105, 123456789, 'UGRD', 'COMP-SCI', 'Chicago', 2010 );
insert into student
    values ( 'Winter' 'Abigail', 11035, 111111111, 'GRD', 'PHD', 'Chicago', 2009 );
insert into student
    values ( 'Patel', 'Prakash', 75234, null, 'UGRD', 'COMP-SCI', 'Chicago', 2011 );
insert into student
    values ( 'Snowdon', 'Jennifer', 93321, 321321321, 'GRD', 'COMP-SCI', 'Springfield', 2012 )
insert into student
    values ( 'Degroff', 'Jarvis', 14998, 113311331, 'GRD', 'COMP-GAM', 'Evanston', 2012 );
insert into student
    values ( 'Kubik', 'Dwayne', 57923, 979797979, 'UGRD' 'COMP-SCI', 'Springfield', 2013 );
insert into student
    values ( 'Skelly', 'Trinity', 58992, 555222555, 'GRD', 'PHD', 'Springfield', 2012 );
insert into student
    values ( 'Krol', 'Angelo', 60973, null, 'UGRD', 'COMP-SCI', 'Springfield', 2011 );
insert into student
    values ( 'Pollard', 'Joya', 39077, null, 'GRD', 'COMP-SCI', 'Springfield', 2010 );


insert into course
    values ( 1020, 'Theory of Computation', 'CSC', 489);
insert into course
    values ( 1092, 'Cryptography', 'CSC', 440);
insert into course
    values ( 3201, 'Data Analysis', 'IT', 223);
insert into course
    values ( 9219, 'Databases Systems', 'CSC', 355);
insert into course
    values ( 3111, 'Theory of Computation', 'CSC', 389);
insert into course
    values ( 8772 'History of Games', 'GAM', 206 );
insert into course
    values ( 2987, 'Topics in Digital Cinema', 'DC', 270);
    
insert into studentgroup
    values (2, 'Computer Science Society', 75234, 1999);
insert into studentgroup
    values (101, 'Robototics Society', null, 1998);
insert into studentgroup
    values (221, 'HerCTI', 93321, 2003);
insert into studentgroup
    values (42, 'DeFrag', 90421, 2004);
    

