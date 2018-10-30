--list courseids offered in Spring but not in Fall of 2013
select courseid,year from enrolled where (quarter = 'Spring' and quarter != 'Fall') and year = 2013

--List courseid in which there is no student enrolled
select courseid from enrolled
where studentid is null

--List department and number of courses offered by each department.
select department, count(cid) from course group by department

----List students that are not presidents of any group.
select firstname, lastname, sid from student
minus
select firstname, lastname, presidentid 
from studentgroup sg, student s where s.sid = sg.presidentid


—Select all students whether presidents or not
SELECT S.*, SG.*
FROM (student AS S RIGHT OUTER JOIN studentgroup AS SG
	ON S.SID = SG.PresidentID);

--List all students who are members of HerCTI.
select firstname, lastname, sid, name 
from student s, memberof m, studentgroup sg 
where s.sid = m.studentid and m.groupid = sg.gid and sg.name = 'HerCTI'


--List members of `HerCTI` that are not enrolled in courses.
select studentid from memberof m, studentgroup sg 
where m.studentid = sg.presidentid and sg.name = 'HerCTI' 
minus (select studentid  from enrolled) 

—Find the course with the highest course number
select cid form course 
minus
select cid from course c1, course c2 where c1.cid != c2.cid and c1.cid < c2.cid

--List courses (even if nobody is enrolled) and their total enrollment by quarter.
select cid,  count(studentid) from course left outer join enrolled on 
cid = courseid --where courseid is null
group by cid, quarter, year
