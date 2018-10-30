{\rtf1\ansi\ansicpg1252\cocoartf1348\cocoasubrtf170
{\fonttbl\f0\fswiss\fcharset0 Helvetica;\f1\froman\fcharset0 Times-Roman;}
{\colortbl;\red255\green255\blue255;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs28 \cf0 --University Database\
--List student groups that have both graduate and undergraduate members.\
\
select gid from studentgroup sg where\
 exists (select studentid from memberof, student \
          where studentid = sid and groupid = sg.gid and career = 'UGRD' )\
 and exists (select studentid from memberof, student \
          where studentid = sid and groupid = sg.gid and career = 'GRD' )\
\
--List courses that have a unique number\
\
select * from course R where coursenr <> \
 ANY (select coursenr from course S where coursename != R.coursename)\
\
--For all departments list the highest course number used by that department\
\
select department,coursenr from course U where U.coursenr >= \
ALL (select coursenr from course where department = U.department)
\fs24 \

\fs28 \
\'97ZooDatabase\
\
\pard\pardeftab720\sa240

\f1\fs24 \cf0 \expnd0\expndtw0\kerning0
--Find the average feeding time for all of the rare animals\
select avg(timetofeed)\
from Animal\
where ACategory = 'rare'\
\
--Which animal(s) have a `time to feed' larger than every exotic animal? Give the id and name of the animal. \
\
Select AID, AName \
from Animal \
where ACategory != 'exotic' and \
TimetoFeed > ALL (select TimeToFeed from Animal where ACategory = 'exotic') \
\
--Name zookeepers handling at least 4 animals. \
\
select zk.Zname\
from (SELECT ZooKeepID FROM handles\
GROUP BY ZooKeepID\
HAVING count(AnimalID) >= 4 ) y,  ZooKeeper zk\
where y.Zookeepid = zk.ZID\
\
--Find the names of the animals that are not related to the tiger. \
\
select AID, AName \
from Animal \
where Aid not in (select AID from Animal where AName LIKE '%tiger%')\
\
--List zookeepers earning the most while feeding animals\
select Zname, remuneration from\
(select Zname, max(hourlyrate*timetofeed) as remuneration \
from zookeeper, handles, animal \
where zookeepid = zid and animalid = aid\
group by Zname) t where remuneration = (Select max(max(hourlyrate*timetofeed)) as remuneration \
from zookeeper, handles, animal \
where zookeepid = zid and animalid = aid\
group by Zname)
\f0\fs28 \kerning1\expnd0\expndtw0 \
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0
\cf0 \
\
}