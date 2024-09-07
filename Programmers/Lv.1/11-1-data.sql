DROP TABLE IF EXISTS mst_users;

CREATE TABLE mst_users(
    user_id         varchar(255)
  , sex             varchar(255)
  , birth_date      varchar(255)
  , register_date   varchar(255)
  , register_device varchar(255)
  , withdraw_date   varchar(255)
);

INSERT INTO mst_users
VALUES
    ('U001', 'M', '1977-06-17', '2016-10-01', 'pc' , NULL        )
  , ('U002', 'F', '1953-06-12', '2016-10-01', 'sp' , '2016-10-10')
  , ('U003', 'M', '1965-01-06', '2016-10-01', 'pc' , NULL        )
  , ('U004', 'F', '1954-05-21', '2016-10-05', 'pc' , NULL        )
  , ('U005', 'M', '1987-11-23', '2016-10-05', 'sp' , NULL        )
  , ('U006', 'F', '1950-01-21', '2016-10-10', 'pc' , '2016-10-10')
  , ('U007', 'F', '1950-07-18', '2016-10-10', 'app', NULL        )
  , ('U008', 'F', '2006-12-09', '2016-10-10', 'sp' , NULL        )
  , ('U009', 'M', '2004-10-23', '2016-10-15', 'pc' , NULL        )
  , ('U010', 'F', '1987-03-18', '2016-10-16', 'pc' , NULL        )
;

DROP TABLE IF EXISTS action_log;

CREATE TABLE action_log(
    session  varchar(255)
  , user_id  varchar(255)
  , action   varchar(255)
  , category varchar(255)
  , products varchar(255)
  , amount   integer
  , stamp    varchar(255)
);

INSERT INTO action_log
VALUES
	('123456yz', NULL, 'view', 'drama' , 'D001', 1500, '2016-11-02 18:10:00')
  , ('123456yz', 'U004', 'view', 'action' , 'D002', 3000, '2016-11-03 18:10:00')
  , ('123456yz', NULL, 'view', 'drama' , 'D001,D002', 5000, '2016-11-04 18:10:00')
  , ('989004ea', 'U001', 'purchase', 'drama' , 'D001,D002', 2000, '2016-11-03 18:10:00')
  , ('989004ea', 'U001', 'view'    , NULL    , NULL       , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'favorite', 'drama' , 'D001'     , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'review'  , 'drama' , 'D001'     , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D001'     , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D001'     , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D001'     , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D001'     , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D001'     , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D002'     , NULL, '2016-11-03 18:01:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D001,D002', NULL, '2016-11-03 18:02:00')
  , ('989004ea', 'U001', 'purchase', 'drama' , 'D001,D002', 2000, '2016-11-03 18:10:00')
  , ('762afcd3', NULL, 'view', NULL, NULL, NULL, '2016-11-03 18:31:29')
  , ('47db0370', 'U002', 'add_cart', 'drama' , 'D001'     , NULL, '2016-11-03 19:00:00')
  , ('47db0370', 'U002', 'purchase', 'drama' , 'D001'     , 1000, '2016-11-03 20:00:00')
  , ('47db0370', 'U002', 'add_cart', 'drama' , 'D002'     , NULL, '2016-11-03 20:30:00')
  , ('87b5725f', 'U001', 'add_cart', 'action', 'A004'     , NULL, '2016-11-04 12:00:00')
  , ('87b5725f', 'U001', 'add_cart', 'action', 'A005'     , NULL, '2016-11-04 12:00:00')
  , ('87b5725f', 'U001', 'add_cart', 'action', 'A006'     , NULL, '2016-11-04 12:00:00')
  , ('9afaf87c', 'U002', 'purchase', 'drama' , 'D002'     , 1000, '2016-11-04 13:00:00')
  , ('9afaf87c', 'U001', 'purchase', 'action', 'A005,A006', 1000, '2016-11-04 15:00:00')
  , ('9afaf87c', NULL, 'view', NULL, NULL, NULL, '2016-11-04 15:05:27')
;

-- 데이터 확인
SELECT *
FROM mst_users;

SELECT *
FROM action_log;

-- 01. 사용자의액션 수 집계하기

-- 01-1. 액션과 관련된 지표 집계하기
WITH stats AS ( -- (1) 로그 전체 Unique User (UU)
	SELECT COUNT(DISTINCT session) AS total_uu -- session으로 집계해야 비로그인 사용자도 count
	FROM action_log
    )
SELECT action
	, COUNT(DISTINCT session) AS action_uu
    -- 1) 전체 액션 수
    , COUNT(session) AS action_count
    , total_uu
    -- 2) 사용률 : 액션UU / 전체UU (전체 사용자의 몇 퍼센트가 이 액션을 사용하는가?)
    , COUNT(DISTINCT session) / total_uu * 100 AS usage_rate
    -- 3) 1인당 액션 수 : 특정 액션 / 액션UU
    , COUNT(session) / COUNT(DISTINCT session) * 100 AS count_per_user
FROM action_log, stats
GROUP BY action
	, total_uu;


-- 01-2. 로그인 상태 판별하기
SELECT session
	, user_id
    , action
    , IF(user_id IS NOT NULL, 'login', 'guest') AS login_status
FROM action_log;


-- 01-3. 로그인 상태에 따라 액션 수 등을 따로 집계
WITH action_log_with_status AS (
	SELECT session
		, user_id
		, action
		, IF(user_id IS NULL, 'guest', 'login') AS login_status
	FROM action_log
)
SELECT COALESCE(action, 'ALL') AS  action
	, COALESCE(login_status, 'ALL') AS login_status
    , COUNT(DISTINCT session) AS actino_uu
    , COUNT(session) AS action_count
FROM action_log_with_status
GROUP BY action
	, login_status WITH ROLLUP
ORDER BY action
	, login_status;
   
    
-- 01-4. 회원과 비회원을 구분해서 집계하기 
WITH action_log_with_status AS (
	SELECT session
		, user_id
		, action
        , stamp
		-- 로그를 stamp 순서로 나열하고 한번이라도 로그인한 사용자일 경우, 이후 모든 로그 상태를 member로 설정
		, CASE WHEN COALESCE(MAX(user_id) OVER(PARTITION BY session ORDER BY stamp), '') <> '' THEN 'Member'
			   ELSE 'None' END AS member_status
	FROM action_log
)
SELECT *
FROM action_log_with_status
ORDER BY session;