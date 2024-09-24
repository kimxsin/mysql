-- 1
select
	*
from
employee;

-- 2
select
	EMP_ID,
    EMP_NAME
from
	employee;
    
-- 3

select
	EMP_NAME,
    DEPT_CODE
from
	employee
where
DEPT_CODE = 'D9';

-- 4
select
	EMP_ID,
    EMP_NAME,
    DEPT_CODE,
    SALARY
from
	employee
where
	SALARY >= '3000000';

-- 5

select
    EMP_NAME,
    DEPT_CODE,
    SALARY
from
	employee
where
	SALARY >= '3000000' and DEPT_CODE = 'D6';
    
-- 6
select
	EMP_ID,
    EMP_NAME,
    SALARY,
    BONUS
from
	employee
where
	BONUS is null; 

-- 7 

select
	EMP_ID,
    EMP_NAME,
    SALARY,
    DEPT_CODE,
    JOB_CODE
from
	employee
where
	SALARY >= '3000000' and SALARY <= '5000000';
    
-- 8

select
	EMP_ID,
    EMP_NAME,
    HIRE_DATE
from
	employee
where
	EMP_NAME  like  '김%';
    
-- 9 

select
	EMP_NAME,
    EMP_NO,
    DEPT_CODE
from
	employee
where
	EMP_NAME  like  '%하%';
    
    
-- 10
select
	EMP_ID,
    EMP_NAME,
    PHONE
from
	employee
where
	PHONE  like  '___9%';
    
-- 11

select
	EMP_ID,
    EMP_NAME,
    PHONE
from
	employee
where
	PHONE  like  '%___9_______%';
    
-- 12

select
	EMP_NAME,
	DEPT_CODE,
    SALARY
from
	employee
where
DEPT_CODE in ('D6', 'D8');

-- 13

select
	EMP_ID,
    EMP_NAME,
    EMAIL
from
	employee
where
	EMP_NAME  not like  '이%';
    
-- 14
select
    EMP_ID,
    EMP_NAME,
    JOB_CODE
from
	employee
where
    (JOB_CODE = 'J2' and SALARY >= '2000000') or JOB_CODE = 'J7';  


-- 15

select
    EMP_NAME,
    SALARY,
    JOB_CODE
from
	employee
where
  (JOB_CODE = 'J2' or JOB_CODE = 'J7') and SALARY >= 2000000;
  
    
     


    
    
	
	


    

	
    
    
	
    