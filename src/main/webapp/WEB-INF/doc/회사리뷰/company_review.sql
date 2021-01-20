DROP TABLE com_review;

DROP SEQUENCE com_review_seq;

/**********************************/
/* Table Name: ȸ��Ұ� */
/**********************************/
DROP TABLE com_intro;
CREATE TABLE com_intro(
comno                          NUMBER(10)  NOT NULL  PRIMARY KEY,
com_name                       VARCHAR2(50)  NOT NULL,
com_form                       VARCHAR2(20)  NOT NULL,
com_type                           VARCHAR2(50)  NOT NULL,
sales                          VARCHAR2(50)  NOT NULL,
homepage                       VARCHAR2(50)  NOT NULL,
address                        VARCHAR2(50)  NOT NULL,
num_people                     NUMBER(10)  NOT NULL,
e_date                           DATE  NOT NULL,
ceo_name                       VARCHAR2(10)  NOT NULL
);

COMMENT ON TABLE com_intro is 'ȸ��Ұ�';
COMMENT ON COLUMN com_intro.comno is 'ȸ���ȣ';
COMMENT ON COLUMN com_intro.com_name is 'ȸ���̸�';
COMMENT ON COLUMN com_intro.com_form is '�������';
COMMENT ON COLUMN com_intro.com_type is '����';
COMMENT ON COLUMN com_intro.sales is '�����';
COMMENT ON COLUMN com_intro.homepage is 'Ȩ������';
COMMENT ON COLUMN com_intro.address is 'ȸ���ּ�';
COMMENT ON COLUMN com_intro.num_people is '�����';
COMMENT ON COLUMN com_intro.e_date is '������';
COMMENT ON COLUMN com_intro.ceo_name is '��ǥ�ڸ�';

DROP SEQUENCE comintro_seq;
CREATE SEQUENCE comintro_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

INSERT INTO com_intro(comno, com_name, com_form, com_type, sales, homepage,address,num_people,e_date,ceo_name)
VALUES(comintro_seq.nextval, '���̹�Ŭ����', '1000����', '���񽺾�', '4925�� 8052����', 'http://www.nbp-corp.com/', '������ �д籸 �д系���117 11��', 500, sysdate, '�ڿ���');

select*from com_intro;

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
/* Table Name: ȸ�縮�� */
/**********************************/
CREATE TABLE com_review(
		rev_no                        		    NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		com_name                      		VARCHAR2(50)		 NOT NULL,
		rev_title                     		    VARCHAR2(50)		 NOT NULL,
		rev_score                     		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		rev_depart                    		VARCHAR2(50)		 NOT NULL,
		rev_content                   		VARCHAR2(1000)		 NOT NULL,
		rev_visible                   		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
		rev_good                      		NUMBER(10)		 NOT NULL,
		rev_bad                       		    NUMBER(10)		 NOT NULL,
		rev_date                      		    DATE		 NOT NULL,
		rev_cnt                           		    NUMBER(10)		 NOT NULL,
		comno                         		    NUMBER(10)		 NULL,
		gen_memberno                   NUMBER(7)		 NULL,
  FOREIGN KEY (comno) REFERENCES com_intro (comno),
  FOREIGN KEY (gen_memberno) REFERENCES gen_member (gen_memberno)
);

CREATE SEQUENCE com_review_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

COMMENT ON TABLE com_review is 'ȸ�縮��';
COMMENT ON COLUMN com_review.rev_no is '���� ��ȣ';
COMMENT ON COLUMN com_review.com_name is '���';
COMMENT ON COLUMN com_review.rev_title is '���� ����';
COMMENT ON COLUMN com_review.rev_score is 'ȸ�� ����';
COMMENT ON COLUMN com_review.rev_depart is '�ٹ��μ�';
COMMENT ON COLUMN com_review.rev_content is '���� ����';
COMMENT ON COLUMN com_review.rev_visible is '��¸��';
COMMENT ON COLUMN com_review.rev_good is '��õ��';
COMMENT ON COLUMN com_review.rev_bad is '�Ű��';
COMMENT ON COLUMN com_review.rev_date is '�ۼ���';
COMMENT ON COLUMN com_review.rev_cnt is '��ϵ� �� ��';
COMMENT ON COLUMN com_review.comno is 'ȸ���ȣ';
COMMENT ON COLUMN com_review.gen_memberno is 'ȸ�� ��ȣ';

-- ���
INSERT INTO com_review(rev_no, com_name,rev_title, rev_score, rev_depart, rev_content, 
rev_visible, rev_good, rev_bad, rev_date, rev_cnt, comno, gen_memberno)
VALUES(com_review_seq.nextval, '�ֵ���ũ', '����', '5', '����', '������ ����� �п�', 
'Y', '1','0', sysdate, '1', '1', '1');

INSERT INTO com_review(rev_no, com_name,rev_title, rev_score, rev_depart, rev_content, 
rev_visible, rev_good, rev_bad, rev_date, rev_cnt, comno, gen_memberno)
VALUES(com_review_seq.nextval, '���ϱ�ȹ', '����', '5', '�����͸�����', '���� ������', 
'Y', '1','0', sysdate, '1', '2', '2');

-- ���
SELECT*FROM com_intro ORDER BY comno ASC;
SELECT*FROM gen_member ORDER BY gen_memberno ASC;
SELECT*FROM com_review ORDER BY rev_no ASC;

-- ��ȸ
SELECT rev_no, com_name,rev_title, rev_score, rev_depart, rev_content, rev_date, comno, gen_memberno, rev_cnt
FROM com_review
WHERE comno=1;

-- ����
UPDATE com_review
SET rev_score=5
WHERE rev_no = 1;

-- ����
DELETE com_review;

COMMIT;


     SELECT rev_no, com_name, rev_title, rev_score, rev_visible, rev_date, comno, r
     FROM (
                SELECT rev_no, com_name, rev_title, rev_score, rev_visible, rev_date, comno, rownum as r
                FROM (
                          SELECT rev_no, com_name, rev_title, rev_score, rev_visible, rev_date, comno
                          FROM com_review
                          ORDER BY comno ASC
                )
     )
     WHERE r >= 1 AND r <= 50;


     SELECT rev_no, com_name, rev_title, rev_score, rev_content, rev_visible, rev_date, comno, r
     FROM (
                SELECT rev_no, com_name, rev_title, rev_score, rev_content, rev_visible, rev_date, comno, rownum as r
                FROM (
                          SELECT rev_no, com_name, rev_title, rev_score, rev_content, rev_visible, rev_date, comno
                          FROM com_review
                          WHERE comno=1 AND (com_name LIKE '����' || '��ȹ' OR rev_content LIKE '����') 
                          ORDER BY rev_no ASC
                )
     )
     WHERE r >= 1 AND r <= 50;


