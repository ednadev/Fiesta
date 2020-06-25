-- 테이블 전체 삭제
DROP TABLE wish; -- 찜
DROP TABLE review; -- 리뷰
DROP TABLE orderdetail; -- 고객 의뢰 완료 내역 (계약서)
DROP TABLE custorderdetail;
DROP TABLE custorder; -- 고객 주문
DROP TABLE service; -- 서비스
DROP TABLE answer; -- 문의 내역
DROP TABLE company; -- 업체
DROP TABLE comcategory; -- 업체 분류
DROP TABLE request; -- 고객 의뢰
DROP TABLE question; -- 문의
DROP TABLE customer; -- 고객


-- 테이블 생성
-- comcategory
CREATE TABLE comcategory(
	comCategory_code INT NOT NULL PRIMARY KEY,
    comCategory_desc VARCHAR(45) NOT NULL
);

-- company
CREATE TABLE company(
	com_code INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	com_email VARCHAR(45),
    com_pass VARCHAR(45),
    com_name VARCHAR(45) NOT NULL,
    com_tel VARCHAR(45),
    com_addr VARCHAR(45),
    com_img VARCHAR(45),
    com_desc VARCHAR(45),
    com_count INT,
    comCategory_code INT NOT NULL
);
ALTER TABLE company ADD constraint fk_company foreign key(comCategory_code) references comcategory(comCategory_code) on delete cascade;

-- service
CREATE TABLE service(
	service_code INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    service_name VARCHAR(45),
    service_desc VARCHAR(45),
    service_img VARCHAR(45),
    service_tag VARCHAR(45),
    com_code INT NOT NULL
);
ALTER TABLE service ADD constraint fk_service foreign key(com_code) references company(com_code) on delete cascade;

-- customer
CREATE TABLE customer(
	cust_email VARCHAR(45) NOT NULL PRIMARY KEY,
    cust_name VARCHAR(45) NOT NULL,
    cust_pass VARCHAR(45) NOT NULL,
    cust_tel VARCHAR(45) NOT NULL,
    cust_group VARCHAR(45) NOT NULL
);

-- custorder(고객 주문)
CREATE TABLE custorder(
	order_code INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    order_sysdate DATETIME NOT NULL,
    order_revdate VARCHAR(45) NOT NULL,
    order_place VARCHAR(45) NOT NULL,
    order_budget VARCHAR(45),
    order_require VARCHAR(45),
    order_condition VARCHAR(45),
    cust_email VARCHAR(45) NOT NULL,
    service_code INT NOT NULL,
    com_code INT NOT NULL
);
ALTER TABLE custorder ADD constraint fk_custorder_customer foreign key(cust_email) references customer(cust_email) on delete cascade;
ALTER TABLE custorder ADD constraint fk_custorder_service foreign key(service_code) references service(service_code) on delete cascade;
ALTER TABLE custorder ADD constraint fk_custorder_company foreign key(com_code) references company(com_code) on delete cascade;

-- 고객주문완료 내역(계약서)
CREATE TABLE custorderdetail(
	custdetail_code INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	custdetail_totalprice INT,
	custdetail_desc VARCHAR(45),
	custdetail_completedate DATETIME,
	order_code INT NOT NULL,
	service_code INT NOT NULL,
	com_code INT NOT NULL,
	cust_email VARCHAR(45) NOT NULL
);
ALTER TABLE custorderdetail ADD constraint fk_custorderdetail_custorder foreign key(order_code) references custorder(order_code) on delete cascade;
ALTER TABLE custorderdetail ADD constraint fk_custorderdetail_service foreign key(service_code) references service(service_code) on delete cascade;
ALTER TABLE custorderdetail ADD constraint fk_custorderdetail_company foreign key(com_code) references company(com_code) on delete cascade;
ALTER TABLE custorderdetail ADD constraint fk_custorderdetail_customer foreign key(cust_email) references customer(cust_email) on delete cascade;

-- request(고객 의뢰)
CREATE TABLE request(
	request_code INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	request_sysdate DATETIME NOT NULL,
	request_revdate VARCHAR(45) NOT NULL,
	request_place VARCHAR(45) NOT NULL,
	request_budget VARCHAR(45),
	request_require VARCHAR(45),
	request_fiesta VARCHAR(45) NOT NULL,
	cust_email VARCHAR(45) NOT NULL
);
ALTER TABLE request ADD constraint fk_request foreign key(cust_email) references customer(cust_email) on delete cascade;

-- orderdetail 고객 의뢰 완료 내역 (계약서)
CREATE TABLE orderdetail(
	detail_code INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    detail_totalprice INT NOT NULL,
    detail_desc VARCHAR(45),
    detail_condition VARCHAR(45) NOT NULL,
    detail_completedate DATETIME,
    request_code INT NOT NULL,
    com_code INT NOT NULL
);
ALTER TABLE orderdetail ADD constraint fk_orderdetail_request foreign key(request_code) references request(request_code) on delete cascade;
ALTER TABLE orderdetail ADD constraint fk_orderdetail_company foreign key(com_code) references company(com_code) on delete cascade;

-- review
CREATE TABLE review(
	review_code VARCHAR(45) NOT NULL PRIMARY KEY,
    review_score INT,
    review_img VARCHAR(45),
    review_desc VARCHAR(45) NOT NULL,
    review_date DATETIME NOT NULL,
    cust_email VARCHAR(45) NOT NULL,
    service_code INT NOT NULL,
    com_code INT NOT NULL
);
ALTER TABLE review ADD constraint fk_review_customer foreign key(cust_email) references customer(cust_email) on delete cascade;
ALTER TABLE review ADD constraint fk_review_service foreign key(service_code) references service(service_code) on delete cascade;
ALTER TABLE review ADD constraint fk_review_company foreign key(com_code) references company(com_code) on delete cascade;

-- wish
CREATE TABLE wish(
	wish_code INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	cust_email VARCHAR(45) NOT NULL,
    service_code INT NOT NULL,
    com_code INT NOT NULL
);
ALTER TABLE wish ADD constraint fk_wish_customer foreign key(cust_email) references customer(cust_email) on delete cascade;
ALTER TABLE wish ADD constraint fk_wish_service foreign key(service_code) references service(service_code) on delete cascade;
ALTER TABLE wish ADD constraint fk_wish_company foreign key(com_code) references company(com_code) on delete cascade;

-- question
CREATE TABLE question(
	q_code INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    q_date DATETIME NOT NULL,
    q_title VARCHAR(45),
    q_desc VARCHAR(45),
    q_condition VARCHAR(45) DEFAULT '답변대기',
    cust_email VARCHAR(45) NOT NULL
);
ALTER TABLE question ADD constraint fk_question foreign key(cust_email) references customer(cust_email) on delete cascade;

-- answer
CREATE TABLE answer(
	a_code INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    a_date DATETIME NOT NULL,
    a_desc VARCHAR(45) NOT NULL,
    com_code INT NOT NULL,
    q_code INT NOT NULL
);
ALTER TABLE answer ADD constraint fk_answer_company foreign key(com_code) references company(com_code) on delete cascade;
ALTER TABLE answer ADD constraint fk_answer_question foreign key(q_code) references question(q_code) on delete cascade;

-- INSERT 부분
INSERT INTO comcategory(comCategory_code, comCategory_desc) VALUES(01, '연예기획사');
INSERT INTO comcategory(comCategory_code, comCategory_desc) VALUES(02, '숙소');
INSERT INTO comcategory(comCategory_code, comCategory_desc) VALUES(03, '주류/렌탈');
INSERT INTO comcategory(comCategory_code, comCategory_desc) VALUES(04, '버스');
INSERT INTO comcategory(comCategory_code, comCategory_desc) VALUES(05, '음향조명');
INSERT INTO comcategory(comCategory_code, comCategory_desc) VALUES(06, '보험회사');
INSERT INTO comcategory(comCategory_code, comCategory_desc) VALUES(07, '푸드트럭');
INSERT INTO comcategory(comCategory_code, comCategory_desc) VALUES(08, '의류');
INSERT INTO comcategory(comCategory_code, comCategory_desc) VALUES(09, '현수막');
INSERT INTO comcategory(comCategory_code, comCategory_desc) VALUES(10, '협찬');

INSERT INTO company(com_email, com_pass, com_name, com_tel, com_addr, com_img, com_desc, com_count, comCategory_code)
VALUES('ent1@gmail.com', '1111', '연예1', '02-1111-2222', '강남구', null, '국내 최대 연예기획사', 0, 01);
INSERT INTO company(com_email, com_pass, com_name, com_tel, com_addr, com_img, com_desc, com_count, comCategory_code)
VALUES('ent2@gmail.com', '1121', '연예2', '02-1111-2222', '강남구', null, '국내 2최대 연예기획사', 0, 01);
INSERT INTO company(com_email, com_pass, com_name, com_tel, com_addr, com_img, com_desc, com_count, comCategory_code)
VALUES('house1@gmail.com', '2222', '숙소1', '02-1111-5964', '가평군', './resource/img/house1.jpg', '최대 300명 수용 숙소', 0, 02);
INSERT INTO company(com_email, com_pass, com_name, com_tel, com_addr, com_img, com_desc, com_count, comCategory_code)
VALUES('rent1@gmail.com', '3333', '렌탈1', '02-1111-3333', '서초구', null, '국내 최대 렌탈업체', 0, 03);
INSERT INTO company(com_email, com_pass, com_name, com_tel, com_addr, com_img, com_desc, com_count, comCategory_code)
VALUES('bus1@gmail.com', '4444', '버스1', '02-1111-4444', '서초구', null, '국내 최대 버스업체', 0, 04);
INSERT INTO company(com_email, com_pass, com_name, com_tel, com_addr, com_img, com_desc, com_count, comCategory_code)
VALUES('music1@gmail.com', '5555', '음향1', '02-1111-5555', '서초구', null, '국내 최대 음향업체', 0, 05);
INSERT INTO company(com_email, com_pass, com_name, com_tel, com_addr, com_img, com_desc, com_count, comCategory_code)
VALUES('bohum1@gmail.com', '6666', '보험1', '02-1111-6666', '서초구', null, '국내 최대 보험업체', 0, 06);

INSERT INTO service(service_name, service_desc, service_img, service_tag, com_code)
VALUES('300명 숙소', '다양한 강당, 편안한 시설', './resource/img/house1.jpg', '#숙소', 1);
INSERT INTO service(service_name, service_desc, service_img, service_tag, com_code)
VALUES('MC', '경험 많은 MC', './resource/img/house1.jpg', '#섭외#MC', 2);
INSERT INTO service(service_name, service_desc, service_img, service_tag, com_code)
VALUES('연예인', '경험 많은 연예인', './resource/img/house1.jpg', '#섭외#연예인', 7);
INSERT INTO service(service_name, service_desc, service_img, service_tag, com_code)
VALUES('45인승버스', '안락한 45인승 리무진 버스', './resource/img/house1.jpg', '#버스#45인승', 4);

INSERT INTO customer(cust_email, cust_name, cust_pass, cust_tel, cust_group)
VALUES('encore@gmail.com','java','1234','010-5043-5765','한양대 사회과학대학 학생회');

INSERT INTO review(review_code, review_score, review_img, review_desc, review_date, cust_email, service_code, com_code)
VALUES('001', 4, null, '좋아요', sysdate(), 'encore@gmail.com', 1, 1);

INSERT INTO question(q_date, q_title, q_desc, cust_email)
VALUES(sysdate(), '숙박문의', '몇명이서 잘 수 있나요?', 'encore@gmail.com');
INSERT INTO question(q_date, q_title, q_desc, cust_email)
VALUES(sysdate(), '공연문의', '이거슨 문장 잘라지는지 테스트하기 위한 문의사항입니담 키키키키킼', 'encore@gmail.com');