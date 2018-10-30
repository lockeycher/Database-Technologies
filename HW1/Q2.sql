
create table loan(
    amount varchar2(50),
    loan_date date,
    loan_title varchar(255),
    risk_score number(38),
    debt_to_income_ratio float(10),
    zipcode number(38),
    state varchar(38),
    employment_length number(20),
    policy_code number(38),
    primary key (loan_title)
 );
 
select * from user_segments where segment_name='LOAN';
 