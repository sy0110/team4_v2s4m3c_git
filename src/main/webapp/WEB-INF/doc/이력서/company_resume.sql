DROP TABLE mem_res CASCADE CONSTRAINTS;
DROP SEQUENCE mem_res_seq;

DROP TABLE res_scho CASCADE CONSTRAINTS;

DROP TABLE res_lice CASCADE CONSTRAINTS;

/**********************************/
/* Table Name: �Ϲ� ȸ�� */
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

COMMENT ON TABLE gen_member is '�Ϲ� ȸ��';
COMMENT ON COLUMN gen_member.gen_memberno is 'ȸ�� ��ȣ';
COMMENT ON COLUMN gen_member.gen_id is 'ȸ�� ���̵�';
COMMENT ON COLUMN gen_member.gen_passwd is '��й�ȣ ';
COMMENT ON COLUMN gen_member.gen_name is 'ȸ�� �̸�';
COMMENT ON COLUMN gen_member.gen_resident is '�������';
COMMENT ON COLUMN gen_member.gen_sex is '����';
COMMENT ON COLUMN gen_member.gen_phone is '��ȭ ��ȣ';
COMMENT ON COLUMN gen_member.gen_zipcode is '���� ��ȣ';
COMMENT ON COLUMN gen_member.gen_addr is 'ȸ�� �ּ�';
COMMENT ON COLUMN gen_member.gen_addr1 is 'ȸ�� �ּ�1';
COMMENT ON COLUMN gen_member.gen_mail is '�̸���';
COMMENT ON COLUMN gen_member.gen_date is '���� ��¥';

DROP SEQUENCE gen_member_seq;
CREATE SEQUENCE gen_member_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(10) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  
insert into gen_member(gen_memberno, gen_id, gen_passwd, gen_name, gen_resident, gen_sex, gen_phone ,gen_mail, gen_date)
values(GEN_MEMBER_SEQ.nextval, 'test', '1234', '�׽�Ʈ', '010101', '����', '01012341234', 'test@test.com', sysdate);

select*from gen_member;



/**********************************/
/* Table Name: ��� ȸ�� */
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

COMMENT ON TABLE cor_member is '��� ȸ��';
COMMENT ON COLUMN cor_member.cor_memberno is '��� ȸ�� ��ȣ';
COMMENT ON COLUMN cor_member.cor_id is '��� ȸ�� ���̵�';
COMMENT ON COLUMN cor_member.cor_passwd is '��� ȸ�� ��й�ȣ';
COMMENT ON COLUMN cor_member.cor_name is '��� ȸ�� �̸�';
COMMENT ON COLUMN cor_member.cor_resident is '��� ȸ�� �������';
COMMENT ON COLUMN cor_member.cor_sex is '��� ȸ�� ���� ';
COMMENT ON COLUMN cor_member.cor_phone is '��� ȸ�� ��ȭ ��ȣ';
COMMENT ON COLUMN cor_member.cor_zipcode is '��� ȸ�� ���� ��ȣ';
COMMENT ON COLUMN cor_member.cor_addr is '��� ȸ�� �ּ�';
COMMENT ON COLUMN cor_member.cor_addr1 is '��� ȸ�� �ּ�1';
COMMENT ON COLUMN cor_member.cor_mail is '��� ȸ�� �̸���';
COMMENT ON COLUMN cor_member.cor_date is '��� ȸ�� ���� ��¥';

DROP SEQUENCE cor_member_seq;
CREATE SEQUENCE cor_member_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(10) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����


-- ���
insert into cor_member(cor_memberno, cor_id, cor_passwd, cor_name, cor_resident, cor_sex, cor_phone, cor_mail, cor_date)
values(cor_member_seq.nextval, 'test', '1234', '�׽�Ʈ', '1111111', '����', '01011111111', 'test@test.com', sysdate);



/**********************************/
/* Table Name: �̷¼� */
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
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

/**********************************/
/* Table Name: �̷¼� �з����� */
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
/* Table Name: �ڰ��� */
/**********************************/
CREATE TABLE res_lice(
		res_lice1                     		VARCHAR2(50)		 NULL 		 ,
		res_lice1_lev                 		VARCHAR2(30)		 NULL ,
		res_lice2                     		VARCHAR2(50)		 NULL,
		res_lice2_lev                 		VARCHAR2(30)		 NULL ,
		res_no                        		NUMBER(10)		                NOT NULL       PRIMARY KEY ,
  FOREIGN KEY (res_no) REFERENCES mem_res (res_no)
);

-- ���
INSERT INTO mem_res(res_no, gen_name, res_phone, res_mail1, res_mail2, res_title, res_intro, res_work, res_web, res_visible, res_date, res_pic, res_thumb, res_size, gen_memberno)
VALUES(mem_res_seq.nextval, 'ȫ�浿', '010-1234-5678', 'abcde', 'naver.com', '�ȳ��ϼ���', '�ڱ�Ұ�', '����ȸ�� ���� ���� �ٹ�', 'www.daum.net', 'Y', sysdate, '����', '�����', 10, 1);
INSERT INTO mem_res(res_no, gen_name, res_phone, res_mail1, res_mail2, res_title, res_intro, res_work, res_web, res_visible, res_date, res_pic, res_thumb, res_size, gen_memberno)
VALUES(mem_res_seq.nextval, '��ҿ�',  '010-1234-5678', 'abcde', 'naver.com', '�ȳ��ϼ���', '�ڱ�Ұ�', '����ȸ�� ���� ���� �ٹ�', 'www.daum.net', 'Y', sysdate, '����', '�����', 10, 2);
INSERT INTO mem_res(res_no, gen_name, res_phone, res_mail1, res_mail2, res_title, res_intro, res_work, res_web, res_visible, res_date, res_pic, res_thumb, res_size, gen_memberno)
VALUES(mem_res_seq.nextval, '��ö��',  '010-1234-5678', 'abcde', 'naver.com', '�ȳ��ϼ���', '�ڱ�Ұ�', '����ȸ�� ���� ���� �ٹ�', 'www.daum.net', 'Y', sysdate, '����', '�����', 10, 3);

INSERT INTO res_scho(res_scname, res_major1, res_major2, res_gotin,res_grad)
VALUES('������б�', '���������������Ӿִϸ��̼ǰ��к�', '��ȸ�����а�', 980076,998076);

INSERT INTO res_lice(res_lice1, res_lice1_lev, res_lice2, res_lice2_lev)
VALUES('����', 960, '�佺', 7, 2);

INSERT ALL
INTO mem_res
VALUES(mem_res_seq.nextval, '������', '01012554841', 'abcde', 'naver.com', '����', '�ڱ�Ұ�', '����ȸ�� ���� ���� �ٹ�', 'www.daum.net', 'Y', sysdate, '����', '�����', 10, 1)
INTO res_scho
VALUES ('���ִ��б�', '������а�', '�Ź�����а�', 200106, 201115,mem_res_seq.nextval)
INTO res_lice
VALUES('����', 990, '�佺', 9,mem_res_seq.nextval)
SELECT * FROM DUAL; 


-- ���
SELECT*FROM mem_res ORDER BY res_no ASC;
SELECT*FROM res_scho;
SELECT*FROM res_lice;
SELECT*FROM mem_res ORDER BY gen_memberno ASC;

-- ��ȸ
SELECT r.res_no as mem_res_res_no, gen_name, res_phone, res_mail1, res_mail2, res_title, res_intro, res_work, res_web, res_visible, res_date, res_pic, res_thumb, res_size, gen_memberno, 
s.res_no as res_scho_res_no, res_scname, res_major1, res_major2, res_gotin,res_grad, 
l.res_no as res_lice_res_no, res_lice1, res_lice1_lev, res_lice2, res_lice2_lev
FROM mem_res r, res_scho s, res_lice l
WHERE r.res_no=s.res_no AND s.res_no=l.res_no AND r.res_no = 1;

-- ����
UPDATE mem_res
SET res_visible='N'
WHERE res_no = 1;

-- ����
DELETE mem_res
WHERE res_no = 8;

COMMIT;










