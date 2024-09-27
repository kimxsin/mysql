-- 다음 쿼리를 통해 6개의 테이블 구조를 확인하세요.
use chundb;

select * from TB_DEPARTMENT; --  학과테이블
select * from TB_STUDENT; -- 학생테이블
select * from TB_PROFESSOR; -- 교수테이블
select * from TB_CLASS; -- 수업테이블
select * from TB_CLASS_PROFESSOR; -- 수업교수테이블
select * from TB_GRADE; -- 학점테이블

-- 1 ==================================================================

SELECT DEPARTMENT_NAME AS '학과 명',
	   CATEGORY AS '계열'
FROM
	TB_DEPARTMENT;
    
-- 2 ====================================================================

SELECT DEPARTMENT_NAME,
       CAPACITY
FROM TB_DEPARTMENT;

-- 3 =================================================================================

SELECT
    STUDENT_NAME
FROM
    TB_STUDENT,
    TB_DEPARTMENT
WHERE
    TB_STUDENT.ABSENCE_YN = 'Y'
AND 
    TB_STUDENT.STUDENT_SSN LIKE '______-2%'
AND
    TB_DEPARTMENT.DEPARTMENT_NAME = '국어국문학과'
AND
    TB_STUDENT.DEPARTMENT_NO = TB_DEPARTMENT.DEPARTMENT_NO;
    

-- 4 =================================================================
SELECT 
	STUDENT_NAME
FROM 
	TB_STUDENT
WHERE 
	STUDENT_NO IN('A513079', 'A513090', 'A513091', 'A513110', 'A513119')
ORDER BY 
	STUDENT_NAME DESC;
    
-- 5 ===================================================================

SELECT 
	DEPARTMENT_NAME, CATEGORY
FROM 
	TB_DEPARTMENT
WHERE 
	CAPACITY BETWEEN 20 AND 30;

-- 6 ===================================================================

SELECT 
	PROFESSOR_NAME
FROM 
	TB_PROFESSOR
WHERE 
	DEPARTMENT_NO IS NULL;

-- 7 =====================================================================

SELECT *
FROM 
	TB_STUDENT
WHERE 
	DEPARTMENT_NO IS NULL;
    
-- 8 =====================================================================

SELECT 
	CLASS_NO
FROM 
	TB_CLASS
WHERE 
	PREATTENDING_CLASS_NO IS NOT NULL;
    
-- 9 =========================================================================
SELECT DISTINCT 
	CATEGORY
FROM 
	TB_DEPARTMENT;

-- 10 =========================================================================
SELECT
    STUDENT_NO,
    STUDENT_NAME,
    STUDENT_SSN
FROM
    TB_STUDENT
WHERE
    STUDENT_NO LIKE 'A2%'
AND
    STUDENT_ADDRESS LIKE '%전주%'
AND
    ABSENCE_YN = 'N';
    
-- ===================== LEVEL 2 ==============================================

-- 1==============================================================================
SELECT 
	STUDENT_NO AS '학번',
	STUDENT_NAME AS '이름',
   ENTRANCE_DATE AS '입학년도'
  FROM TB_STUDENT
 WHERE DEPARTMENT_NO = '002' 
 ORDER BY ENTRANCE_DATE;
 
 -- 2 ===============================================================================
 SELECT 
       PROFESSOR_NAME,
       PROFESSOR_SSN
  FROM TB_PROFESSOR
 WHERE PROFESSOR_NAME NOT LIKE '___';
 
 -- 3 ===============================================================================
 
 SELECT  PROFESSOR_NAME AS 교수이름,
(YEAR(CURDATE()) - YEAR(STR_TO_DATE(CONCAT('19', SUBSTRING(PROFESSOR_SSN, 1, 6)), '%Y%m%d'))) -1 AS 만나이  -- CURDATE: 현재 날짜 , CONCAT : 문자열합치기, STR_TO_DATE:(문자열,변환할 DATE 형식)
FROM tb_professor
WHERE PROFESSOR_SSN like '_______1%'
ORDER BY 만나이;

-- 4 ====================================================

SELECT 
       SUBSTR(PROFESSOR_NAME, 2) AS 이름
  FROM TB_PROFESSOR;
 
 
 -- 5 =======================================================
SELECT 
    STUDENT_NO,
    STUDENT_NAME
FROM TB_STUDENT
WHERE EXTRACT(YEAR FROM ENTRANCE_DATE)-(SUBSTR(STUDENT_SSN,1,2)+1900) > 19;

-- 6 ==========================================================

SELECT DATE_FORMAT('2020-12-25', '%W') AS '2020 크리스마스';

-- 7 ========================================================

-- 1999년 10월 11일
-- 2049년 10월 11일
-- 1970년 10월 11일
-- 1969년 10월 11일

-- 8 =============================================================
SELECT
	ROUND(AVG(POINT),1) AS '평점'
FROM 
	TB_GRADE
WHERE
	STUDENT_NO = 'A517178'; 
    
    
    
    
    
    

	





