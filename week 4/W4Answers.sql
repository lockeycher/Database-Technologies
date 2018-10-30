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


select * from  Justice where JusticeID in (select JusticeID
  from Cases ) -- 2 rows....1, Liberal and 2, Conservative 

select * from  Justice where JusticeID not in (select JusticeID
  from Cases ) -- 0 rows. The NULL creates an issue
  
select * from  Justice where JusticeID in (select JusticeID
  from Cases WHERE JusticeID is not null ) --Correct SQL Statement
  
--Exists accomodates for NULL
select * from Justice J1 where NOT EXISTS (select JusticeID from cases where JusticeID = J1.justiceID)

--5(i) and 5(ii)
With Histogram (Risk_score, Cnt) As
(select Risk_Score, count(*) from Loan
group by Risk_Score)
select * from Histogram order by cnt desc 

--5(iii)
With 
Histogram(Risk_score, Cnt) 
As
(select Risk_Score, count(*) as cnt from Loan
group by Risk_Score),
RiskScoreWithMaxLoans (Risk_score) 
As
(select Risk_score from Histogram where cnt = (select  max(cnt) from Histogram))
select * from Loan L, RiskScoreWithMaxLoans M where L.Risk_Score = M.Risk_Score 

