DROP TABLE mem_res CASCADE CONSTRAINTS;
DROP SEQUENCE mem_res_seq;

DROP TABLE res_scho CASCADE CONSTRAINTS;

DROP TABLE res_lice CASCADE CONSTRAINTS;

/**********************************/
/* Table Name: 析鋼 噺据 */
/**********************************/
DROP TABLE gen_member;
CREATE TABLE gen_member(
gen_memberno                   NUMBER(7)  NOT NULL  PRIMARY KEY,
gen_id                         VARCHAR2(50)  NOT NULL UNIQUE ,
gen_passwd                     VARCHAR2(20)  NOT NULL,
gen_name                       VARCHAR2(20)  NOT NULL,
gen_resident                   VARCHAR2(13)  NOT NULL,
gen_sex                        VARCHAR2(10)  NOT NULL,
gen_phone                      VARCHAR2(20)  NOT NULL,
gen_zipcode                    VARCHAR2(5)  NULL ,
gen_addr                       VARCHAR2(100)  NULL ,
gen_addr1                      VARCHAR2(50)  NULL ,
gen_mail                       VARCHAR2(50)  NOT NULL,
gen_date                       DATE  NOT NULL
);

COMMENT ON TABLE gen_member is '析鋼 噺据';
COMMENT ON COLUMN gen_member.gen_memberno is '噺据 腰硲';
COMMENT ON COLUMN gen_member.gen_id is '噺据 焼戚巨';
COMMENT ON COLUMN gen_member.gen_passwd is '搾腔腰硲 ';
COMMENT ON COLUMN gen_member.gen_name is '噺据 戚硯';
COMMENT ON COLUMN gen_member.gen_resident is '持鰍杉析';
COMMENT ON COLUMN gen_member.gen_sex is '失紺';
COMMENT ON COLUMN gen_member.gen_phone is '穿鉢 腰硲';
COMMENT ON COLUMN gen_member.gen_zipcode is '酔畷 腰硲';
COMMENT ON COLUMN gen_member.gen_addr is '噺据 爽社';
COMMENT ON COLUMN gen_member.gen_addr1 is '噺据 爽社1';
COMMENT ON COLUMN gen_member.gen_mail is '戚五析';
COMMENT ON COLUMN gen_member.gen_date is '亜脊 劾促';

DROP SEQUENCE gen_member_seq;
CREATE SEQUENCE gen_member_seq
  START WITH 1              -- 獣拙 腰硲
  INCREMENT BY 1          -- 装亜葵
  MAXVALUE 9999999999 -- 置企葵: 9999999 --> NUMBER(10) 企誓
  CACHE 2                       -- 2腰精 五乞軒拭辞幻 域至
  NOCYCLE;                     -- 陥獣 1採斗 持失鞠澗 依聖 号走
  
insert into gen_member(gen_memberno, gen_id, gen_passwd, gen_name, gen_resident, gen_sex, gen_phone ,gen_mail, gen_date)
values(GEN_MEMBER_SEQ.nextval, 'test', '1234', '砺什闘', '010101', '害切', '01012341234', 'test@test.com', sysdate);

select*from gen_member;



/**********************************/
/* Table Name: 奄穣 噺据 */
/**********************************/
CREATE TABLE cor_member(
cor_memberno                   NUMBER(7)  NOT NULL  PRIMARY KEY,
cor_id                         VARCHAR2(50)  NOT NULL UNIQUE,
cor_passwd                     VARCHAR2(20)  NOT NULL,
cor_name                       VARCHAR2(20)  NOT NULL,
cor_resident                   VARCHAR2(13)  NOT NULL,
cor_sex                        VARCHAR2(10)  NOT NULL,
cor_phone                      VARCHAR2(20)  NOT NULL,
cor_zipcode                    VARCHAR2(5)  NULL ,
cor_addr                       VARCHAR2(100)  NULL ,
cor_addr1                      VARCHAR2(50)  NULL ,
cor_mail                       VARCHAR2(50)  NOT NULL,
cor_date                       DATE  NOT NULL
);

COMMENT ON TABLE cor_member is '奄穣 噺据';
COMMENT ON COLUMN cor_member.cor_memberno is '奄穣 噺据 腰硲';
COMMENT ON COLUMN cor_member.cor_id is '奄穣 噺据 焼戚巨';
COMMENT ON COLUMN cor_member.cor_passwd is '奄穣 噺据 搾腔腰硲';
COMMENT ON COLUMN cor_member.cor_name is '奄穣 噺据 戚硯';
COMMENT ON COLUMN cor_member.cor_resident is '奄穣 噺据 持鰍杉析';
COMMENT ON COLUMN cor_member.cor_sex is '奄穣 噺据 失紺 ';
COMMENT ON COLUMN cor_member.cor_phone is '奄穣 噺据 穿鉢 腰硲';
COMMENT ON COLUMN cor_member.cor_zipcode is '奄穣 噺据 酔畷 腰硲';
COMMENT ON COLUMN cor_member.cor_addr is '奄穣 噺据 爽社';
COMMENT ON COLUMN cor_member.cor_addr1 is '奄穣 噺据 爽社1';
COMMENT ON COLUMN cor_member.cor_mail is '奄穣 噺据 戚五析';
COMMENT ON COLUMN cor_member.cor_date is '奄穣 噺据 亜脊 劾促';

DROP SEQUENCE cor_member_seq;
CREATE SEQUENCE cor_member_seq
  START WITH 1              -- 獣拙 腰硲
  INCREMENT BY 1          -- 装亜葵
  MAXVALUE 9999999999 -- 置企葵: 9999999 --> NUMBER(10) 企誓
  CACHE 2                       -- 2腰精 五乞軒拭辞幻 域至
  NOCYCLE;                     -- 陥獣 1採斗 持失鞠澗 依聖 号走


-- 去系
insert into cor_member(cor_memberno, cor_id, cor_passwd, cor_name, cor_resident, cor_sex, cor_phone, cor_mail, cor_date)
values(cor_member_seq.nextval, 'test', '1234', '砺什闘', '1111111', '害切', '01011111111', 'test@test.com', sysdate);



/**********************************/
/* Table Name: 戚径辞 */
/**********************************/
CREATE TABLE mem_res(
		res_no                        		NUMBER(10)		        NOT NULL		 PRIMARY KEY,
		gen_name                      		VARCHAR2(20)		 NOT NULL,
		res_phone                     		VARCHAR2(60)		 NOT NULL,
		res_mail1                      		VARCHAR2(200)		 NOT NULL,
		res_mail2                      		VARCHAR2(200)		 NOT NULL,
		res_title                     		VARCHAR2(100)		    NOT NULL,
		res_intro                     		VARCHAR2(800)		    NOT NULL,
		res_work                      	CLOB		                    DEFAULT 0		 NULL ,
		res_web                       	VARCHAR2(100)		NULL ,
		res_visible                   	CHAR(1)		            DEFAULT 'Y'	 NOT NULL,
		res_date                      		DATE		                NOT NULL,
		res_pic                       		VARCHAR2(100)		 NULL ,
		res_thumb                     	VARCHAR2(100)		 NULL ,
		res_size                      		NUMBER(10)		         NULL ,
		gen_memberno               	NUMBER(7)		         NULL ,
  FOREIGN KEY (gen_memberno) REFERENCES gen_member (gen_memberno)
);

CREATE SEQUENCE mem_res_seq
  START WITH 1              -- 獣拙 腰硲
  INCREMENT BY 1          -- 装亜葵
  MAXVALUE 9999999999 -- 置企葵: 9999999 --> NUMBER(7) 企誓
  CACHE 2                       -- 2腰精 五乞軒拭辞幻 域至
  NOCYCLE;                     -- 陥獣 1採斗 持失鞠澗 依聖 号走

/**********************************/
/* Table Name: 戚径辞 俳径舛左 */
/**********************************/
CREATE TABLE res_scho(
		res_scname                     VARCHAR2(80)		            NOT NULL,
		res_major1                        VARCHAR2(100)		        NOT NULL,
		res_major2                    	VARCHAR2(100)		        NULL ,
		res_gotin                     		VARCHAR2(50)		            NOT NULL,
		res_grad                      	VARCHAR2(50)		            NOT NULL,
		res_no                        		NUMBER(10)		                NOT NULL       PRIMARY KEY,
  FOREIGN KEY (res_no) REFERENCES mem_res (res_no)
);

/**********************************/
/* Table Name: 切維装 */
/**********************************/
CREATE TABLE res_lice(
		res_lice1                     		VARCHAR2(50)		 NULL 		 ,
		res_lice1_lev                 		VARCHAR2(30)		 NULL ,
		res_lice2                     		VARCHAR2(50)		 NULL,
		res_lice2_lev                 		VARCHAR2(30)		 NULL ,
		res_no                        		NUMBER(10)		                NOT NULL       PRIMARY KEY ,
  FOREIGN KEY (res_no) REFERENCES mem_res (res_no)
);

-- 去系
INSERT INTO mem_res(res_no, gen_name, res_phone, res_mail1, res_mail2, res_title, res_intro, res_work, res_web, res_visible, res_date, res_pic, res_thumb, res_size, gen_memberno)
VALUES(mem_res_seq.nextval, '畠掩疑', '010-1234-5678', 'abcde', 'naver.com', '照括馬室推', '切奄社鯵', 'しし噺紫 しし 送巷 悦巷', 'www.daum.net', 'Y', sysdate, '紫遭', '醇革析', 10, 1);
INSERT INTO mem_res(res_no, gen_name, res_phone, res_mail1, res_mail2, res_title, res_intro, res_work, res_web, res_visible, res_date, res_pic, res_thumb, res_size, gen_memberno)
VALUES(mem_res_seq.nextval, '沿社慎',  '010-1234-5678', 'abcde', 'naver.com', '照括馬室推', '切奄社鯵', 'しし噺紫 しし 送巷 悦巷', 'www.daum.net', 'Y', sysdate, '紫遭', '醇革析', 10, 2);
INSERT INTO mem_res(res_no, gen_name, res_phone, res_mail1, res_mail2, res_title, res_intro, res_work, res_web, res_visible, res_date, res_pic, res_thumb, res_size, gen_memberno)
VALUES(mem_res_seq.nextval, '沿旦呪',  '010-1234-5678', 'abcde', 'naver.com', '照括馬室推', '切奄社鯵', 'しし噺紫 しし 送巷 悦巷', 'www.daum.net', 'Y', sysdate, '紫遭', '醇革析', 10, 3);

INSERT INTO res_scho(res_scname, res_major1, res_major2, res_gotin,res_grad)
VALUES('辞随企俳嘘', '巨走登嬬度苧惟績蕉艦五戚芝因俳採', '紫噺差走俳引', 980076,998076);

INSERT INTO res_lice(res_lice1, res_lice1_lev, res_lice2, res_lice2_lev)
VALUES('塘斥', 960, '塘什', 7, 2);

INSERT ALL
INTO mem_res
VALUES(mem_res_seq.nextval, '酵走薄', '01012554841', 'abcde', 'naver.com', '薦鯉', '切奄社鯵', 'しし噺紫 しし 送巷 悦巷', 'www.daum.net', 'Y', sysdate, '紫遭', '醇革析', 10, 1)
INTO res_scho
VALUES ('薦爽企俳嘘', '慎嬢慎庚俳引', '重庚号勺俳引', 200106, 201115,mem_res_seq.nextval)
INTO res_lice
VALUES('塘斥', 990, '塘什', 9,mem_res_seq.nextval)
SELECT * FROM DUAL; 


-- 鯉系
SELECT*FROM mem_res ORDER BY res_no ASC;
SELECT*FROM res_scho;
SELECT*FROM res_lice;
SELECT*FROM mem_res ORDER BY gen_memberno ASC;

-- 繕噺
SELECT r.res_no as mem_res_res_no, gen_name, res_phone, res_mail1, res_mail2, res_title, res_intro, res_work, res_web, res_visible, res_date, res_pic, res_thumb, res_size, gen_memberno, 
s.res_no as res_scho_res_no, res_scname, res_major1, res_major2, res_gotin,res_grad, 
l.res_no as res_lice_res_no, res_lice1, res_lice1_lev, res_lice2, res_lice2_lev
FROM mem_res r, res_scho s, res_lice l
WHERE r.res_no=s.res_no AND s.res_no=l.res_no AND r.res_no = 1;

-- 呪舛
UPDATE mem_res
SET res_visible='N'
WHERE res_no = 1;

-- 肢薦
DELETE mem_res
WHERE res_no = 8;

COMMIT;










