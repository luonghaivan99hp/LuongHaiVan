-- Question 1:
-- tạo table 
-- create database qldiem
DROP DATABASE IF EXISTS Qldiem;
CREATE DATABASE IF NOT EXISTS Qldiem;
USE Qldiem;
-- create table: Student
DROP TABLE IF EXISTS Student;
CREATE TABLE IF NOT EXISTS Student(
					RN            TINYINT UNSIGNED AUTO_INCREMENT,
					`Name`        NVARCHAR(30) NOT NULL,
					Age           TINYINT UNSIGNED NOT NULL,
					Gender        ENUM('0','1','Unknow'),
                    PRIMARY KEY(RN)
);
-- create table: Subject
DROP TABLE IF EXISTS `Subject`;
CREATE TABLE IF NOT EXISTS `Subject`(
					sID        VARCHAR(10) NOT NULL,
					sName      NVARCHAR(30) NOT NULL,
                    PRIMARY KEY(sID)
);
-- create table: StudentSubject
DROP TABLE IF EXISTS StudentSubject;
CREATE TABLE IF NOT EXISTS StudentSubject(
					RN        TINYINT UNSIGNED,
					sID       VARCHAR(10),
					Mark      TINYINT UNSIGNED,
					`Date`    DATETIME DEFAULT NOW(),
					PRIMARY KEY(RN,sID)
);
-- Thêm ít nhất 3 bản ghi vào table: Student
INSERT INTO	Student	(	`Name`		    ,	Age	,	Gender  )
VALUES				('Lương Hải Vân'	,	10	,	'1'     ),
					('Lê Thành Hưng'	,	12	,	'0'	    ),
					('Trần Văn Thế'	    ,	18	,	'Unknow'  );
-- Thêm ít nhất 3 bản ghi vào table: `Subject`
INSERT INTO `Subject`(sID	 ,		sName       )
VALUES			     ('A01'  ,		'Toán'		),
					 ('A02'  ,		'Văn'		),
					 ('A03'  ,		'Anh'		);
-- Thêm ít nhất 3 bản ghi vào table: StudentSubject
INSERT INTO StudentSubject	(RN	,	sID		,	Mark	,	`Date`	 )
VALUES						(1	,	'A01'	,	6		,'2020/09/08'),
							(2	,	'A01'	,	7		,'2020/09/08'),
							(3	,	'A01'	,	10		,'2020/09/08'),
							(1	,	'A03'	,	5		,'2020/09/10'),
							(2	,	'A03'	,	9		,'2020/09/10'),
                            (3  ,   'A03'   ,   7       ,'2020/09/10');
-- Question 2
-- lấy ra tất cả các môn học không có bất kì điểm nào
SELECT a.sName
FROM `Subject` a
LEFT JOIN StudentSubject b
ON a.sID=b.sID
WHERE b.sID IS NULL;
-- Lấy ra danh sách môn học có ít nhất 2 điểm
SELECT a.sName, COUNT(b.sID) AS Dem
FROM `Subject` a
JOIN StudentSubject b
ON a.sID=b.sID
GROUP BY b.sID
Having Dem > 2;
-- Question 3: Tạo "StudentInfo" view có các thông tin về học sinh bao gồm:RN,sID,Name, Age, Gender, sName, Mark, Date. Với cột Gender show
-- Male để thay thế cho 0, Female thay thế cho 1 và Unknow thay thế cho null.
DROP VIEW StudentInfo;
CREATE VIEW StudentInfo AS
SELECT a.RN,b.sID,a.`Name`,a.Age,a.Gender,b.sName,c.Mark,c.`Date`,
CASE a.Gender 
WHEN '0' THEN 'Male'
WHEN '1' THEN 'Female'
ELSE 'NULL'
END AS GenderShow
FROM Student a
JOIN StudentSubject c ON a.RN=c.RN
JOIN `Subject` b ON b.sID=c.sID;
SELECT *FROM StudentInfo;
-- Question 4:Trigger CasUpdate: khi thay đổi data của cột sID, thì giá trị của cột sID của table StudentSubject cũng thay đổi theo
DROP TRIGGER CasUpdate;
DELIMITER $$
CREATE TRIGGER CasUpdate
AFTER UPDATE ON `Subject`
FOR EACH ROW
BEGIN
UPDATE StudentSubject
SET sID=NEW.sID
WHERE sID=OLD.sID;
END $$
DELIMITER ;
UPDATE `Subject`
SET sID='A04'
WHERE sID='A01';
SELECT * FROM `Subject`;
SELECT * FROM StudentSubject;
-- Trigger casDel: Khi xóa 1 student, các dữ liệu của table StudentSubject cũng sẽ bị xóa theo
DROP TRIGGER casDel;
DELIMITER $$
CREATE TRIGGER casDel
AFTER DELETE ON `Student`
FOR EACH ROW
BEGIN
DELETE FROM StudentSubject
WHERE RN=OLD.RN;
END $$
DELIMITER ;
DELETE FROM `Student` 
WHERE RN=1;
SELECT * FROM `Student`;
SELECT * FROM StudentSubject;
-- Question 5: Viết 1 thủ tục (có 2 parameters: student name, mark). 
-- Thủ tục sẽ xóa tất cả các thông tin liên quan tới học sinh có cùng tên như parameter và tất cả các điểm nhỏ hơn của các học sinh đó.
-- Trong trường hợp nhập vào "*" thì thủ tục sẽ xóa tất cả các học sinh
DROP PROCEDURE DelStudent;
DELIMITER $$
CREATE PROCEDURE DelStudent
(IN StudentName NVARCHAR(50), IN MarkI TINYINT UNSIGNED)
BEGIN
DELETE FROM StudentSubject
WHERE Mark < MarkI AND RN IN (SELECT RN FROM Student WHERE `Name` = StudentName );
IF (StudentName = '*') THEN
DELETE FROM `Student`;
END IF;
END$$
DELIMITER ;
CALL DelStudent('Trần Văn Thế',11);
SELECT * FROM StudentSubject;
CALL DelStudent('*',11);
SELECT * FROM `Student`;

