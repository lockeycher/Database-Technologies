CREATE TABLE Justice(JusticeID number(2),
                      Category varchar(100));
CREATE TABLE Cases (CaseID number(4),
                    CaseState varchar(2), JusticeID number(2));
      
insert all into Justice (JusticeId, Category) values (1,'Liberal')
into Justice (JusticeId, Category) values (2,'Conservative')
into Justice (JusticeId, Category) values (3,'Liberal')
SELECT * FROM dual;

insert all into Cases Values (1, 'IL', 1)
into Cases Values (2, 'MD', 2)
into Cases Values (3,'NE', null)
Select * from Dual;