use employee;

select
	E.EMP_ID,
	E.EMP_NAME,
	J.JOB_NAME,
	D.DEPT_TITLE,
	L.LOCAL_NAME,
	E.SALARY
from
	job J join employee E on J.JOB_CODE = E.JOB_CODE
		  join department D on E.DEPT_CODE = D.DEPT_ID
          join location L on D.LOCATION_ID = L.LOCAL_CODE
where J.JOB_NAME = '대리' and L.LOCAL_NAME like '%ASIA%';

--
select
	E.EMP_NAME,
    E.EMP_NO,
	D.DEPT_TITLE,
    J.JOB_NAME
from
	employee E join department D on D.DEPT_ID = E.DEPT_CODE
			   join job J on E.DEPT_CODE = D.DEPT_ID
where E.EMP_NO like '7%';
    
    
	
	
	
	





	
