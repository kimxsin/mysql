-- constraints(제약 조건)
-- 테이블에 데이터가 입력 되거나 변경될 때 규칙을 정의한다.
-- 데이터의 무결성!!!
-- not null
-- null 값 즉 비어있는 값을 허용하지 않는다. 라는 제약 조건

drop table if exists user_notnull;
create table if not exists user_notnull(
	user_no int not null,
    user_id varchar(30) not null,
    user_pwd varchar(40) not null,
    user_name varchar(30) not null,
    gender varchar(3),
    phone varchar(30) not null,
    email varchar(50)
)engine=innodb; 

describe user_notnull;

insert into user_notnull
values
(1, 'user01', 'pass01', '김경훈', '남', '01026023659', 'rhlanf9063@gmail.com'),
(2, 'user02', 'pass02', '김경순', '남', '02026024659', 'rhlanf9064@gmail.com'),
(3, 'user03', 'pass03', '김경환', '남', '03026025659', 'rhlanf9065@gmail.com'),
(4, 'user04', 'pass04', '김경굴', '남', '04026026659', 'rhlanf9066@gmail.com'),
(5, 'user05', 'pass05', '김더지', '남', '05026027659', 'rhlanf9067@gmail.com');

drop table user_notnull;

select * from user_notnull;

-- unique 제약 조건 
-- 중복 된 값을 허용하지 않는 제약조건 

drop table if exists user_unique;
create table if not exists user_unique(
	user_no int not null unique, --  null 허용 안하면서 , 유일한 값
    user_id varchar(30) not null,
    user_pwd varchar(40) not null,
    user_name varchar(30) not null,
    gender varchar(3),
    phone varchar(30) not null,
    email varchar(50),
    unique(phone) -- 이런 식으로도 제약조건 설정 할 수 있다
)engine=innodb; 

insert into user_unique
values
(1, 'user01', 'pass01', '김경훈', '남', '01026023659', 'rhlanf9063@gmail.com'),
(2, 'user02', 'pass02', '김경순', '남', '02026024659', 'rhlanf9064@gmail.com'),
(3, 'user03', 'pass03', '김경환', '남', '03026025659', 'rhlanf9065@gmail.com'),
(4, 'user04', 'pass04', '김경굴', '남', '04026026659', 'rhlanf9066@gmail.com'),
(5, 'user05', 'pass05', '김더지', '남', '05026027659', 'rhlanf9067@gmail.com');

describe user_unique;
-- not null + unique -> 합쳤더니 primary key 가 되었다?

select * from user_unique;

-- unique 제약조건 에러 발생 (전화번호 중복됨.)

-- primary key
-- 테이블에서 한 행의 정보를 찾기 위해 사용할 컬럼을 의마한다.
-- 테이블에 대한 식별자 역할 -> 한 행을 식별할 수 있는 값을 의미한다.
-- unique, not null 하나만 존재해야하고 분명 존재해야한다 하나를 특정하기 위해서 그게 합쳐진게 primary key
-- 한 테이블 당 한 개만 설정할 수 있음
-- 한 개 컬럼에 설정 할 수 있고, 여러 개의 컬럼을 묶어서 설정할 수 있다.
-- 복합키(여러 개의 pk)

drop table if exists user_pk;
create table if not exists user_pk(
	-- user_no int primary key
	user_no int,  -- user_no int primary key 생략
    user_id varchar(30) not null,
    user_pwd varchar(40) not null,
    user_name varchar(30) not null,
    gender varchar(3),
    phone varchar(30) not null,
    email varchar(50),
    primary key(user_no) -- 이런 식으로도 제약조건 설정 할 수 있다
)engine=innodb; 

describe user_pk;
-- foreign key (외래키)
-- 참조(연관) 된 다른 테이블에서 제공하는 값만 사용 할 수 있음
-- foreign key 제약조건에 의해 테이블 간의 관계가 형성이 될 수 있다

select * from user_pk;


drop table if exists user_grade;
create table if not exists user_grade(
	grade_code int primary key,
    grade_name varchar(30) not null
)engine=innodb; 

insert into user_grade
values
(10, '일반회원'),
(20, '우수회원'),
(30, '특별회원');

select * from user_grade;
-- ===============================================================

drop table if exists user_fk1;
create table if not exists user_fk1(
	-- user_no int primary key
	user_no int primary key,  -- user_no int primary key 생략
    user_id varchar(30) not null,
    user_pwd varchar(40) not null,
    user_name varchar(30) not null,
    gender varchar(3),
    phone varchar(30) not null,
    email varchar(50),
    grade_no int,
    foreign key(grade_no)
	references user_grade (grade_code) -- 유저 그레이드를 참조하고 있으며 그레이드 코드의 값을 가져다 쓴다
)engine=innodb; 

describe user_fk1;
select * from fk1;
insert into user_fk1
values
-- error 1062 : 참조하고 있는 테이블(부모 테이블)에는 존재하지 않는 값을 집어넣을 때
-- 발생하는 에러 -> foregine key 제약조건 위반
(3, 'user02', 'pass02', '김경훈', '남', '01026023659', 'rhlanf9063@gmail.com', 25);

-- ===============================================================================
-- check 제약조건
-- 조건을 위반할 시 허용하지 않는 제약조건 

drop table if exists user_check;

-- 술을 파는 사이트, 미성년자 들어오면 안된다. 
-- 성별은 두가지 값 만 받을것이다 남과 여
create table if not exists user_check(
	user_no int auto_increment primary key,  
    user_name varchar(30) not null,
    gender varchar(3) check(gender in ('남', '여')),
    age int check(age >= 19)
)engine=innodb; 
insert into user_check
values
(null, '김경굴', '남', 25),
(null, '김경순', '여', 7);

describe user_check;

select * from user_check;

-- default
-- nullable 한 컬럼에 비어있는 값 대신 우리가 설정한 기본값 적용

drop table if exists user_country;

create table if not exists user_country(
	country_code int auto_increment primary key,  
    country_name varchar(255) default  '한국',
    population varchar(255)default '0명', 
    add_time datetime default(current_time()),
    add_day date default(current_date())
)engine=innodb; 

insert into user_country
values
(null, default, default, default, default);

select * from user_country;


