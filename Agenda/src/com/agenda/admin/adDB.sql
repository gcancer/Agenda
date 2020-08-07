CREATE SEQUENCE AG_MEMBERSEQ;
CREATE TABLE AG_MEMBER(
	MEMBER_ID VARCHAR2(50) PRIMARY KEY,
	MEMBER_TOKEN VARCHAR2(50),
	MEMBER_PW VARCHAR2(100) NOT NULL,
	MEMBER_NAME VARCHAR2(20) NOT NULL,
	MEMBER_EMAIL VARCHAR2(50) NOT NULL,
	MEMBER_ADDR VARCHAR2(4000) NOT NULL,
	MEMBER_PHONE VARCHAR2(50) NOT NULL,
	MEMBER_ENABLED CHAR(1) CHECK(MEMBER_ENABLED IN('Y','N')),
	MEMBER_ROLE VARCHAR2(20) NOT NULL,
	MEMBER_SALT VARCHAR2(30)
);

SELECT * FROM AG_MEMBER ORDER BY MEMBER_NO;