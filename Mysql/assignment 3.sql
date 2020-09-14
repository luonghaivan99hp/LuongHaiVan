-- tao database
DROP DATABASE IF EXISTS Qlbaithi;
CREATE DATABASE Qlbaithi;
USE Qlbaithi;
-- tao table 1: Department
DROP TABLE IF EXISTS Department;
CREATE TABLE Department(
	DepartmentID 			TINYINT UNSIGNED AUTO_INCREMENT ,
    DepartmentName 			NVARCHAR(30) NOT NULL ,
    PRIMARY KEY(DepartmentID),
    UNIQUE KEY (DepartmentName)
);

-- tao table 2: Posittion
DROP TABLE IF EXISTS Position;
CREATE TABLE `Position` (
	PositionID				TINYINT UNSIGNED AUTO_INCREMENT,
    PositionName			ENUM('Dev','Test','Scrum Master','PM') NOT NULL,
    PRIMARY KEY(PositionID),
    UNIQUE KEY(PositionName)
);

-- tao table 3: Account
DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account`(
	AccountID				TINYINT UNSIGNED AUTO_INCREMENT,
    Email					VARCHAR(50) NOT NULL,
    Username				VARCHAR(50) NOT NULL,
    FullName				NVARCHAR(50) NOT NULL,
    DepartmentID 			TINYINT UNSIGNED NOT NULL,
    PositionID				TINYINT UNSIGNED NOT NULL,
    CreateDate				DATETIME DEFAULT NOW(),
    PRIMARY KEY(AccountID),
    UNIQUE KEY (Email),
    UNIQUE KEY (Username),
    FOREIGN KEY(DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY(PositionID) REFERENCES `Position`(PositionID)
);

-- tao table 4: Group
DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group`(
	GroupID					TINYINT UNSIGNED AUTO_INCREMENT,
    GroupName				NVARCHAR(50) NOT NULL,
    CreatorID				TINYINT UNSIGNED NOT NULL,
    CreateDate				DATETIME DEFAULT NOW(),
    PRIMARY KEY(GroupID),
    UNIQUE KEY(GroupName)
);

-- tao table 5: GroupAccount
DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE GroupAccount(
	GroupID					TINYINT UNSIGNED NOT NULL,
    AccountID				TINYINT UNSIGNED NOT NULL,
    JoinDate				DATETIME DEFAULT NOW(),
    PRIMARY KEY (GroupID,AccountID)
);

-- tao table 6: TypeQuestion
DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion (
    TypeID 			TINYINT UNSIGNED AUTO_INCREMENT,
    TypeName 		ENUM('Essay','Multiple-Choice') NOT NULL,
    PRIMARY KEY(TypeID),
    UNIQUE KEY(TypeName)
);

-- tao table 7: CategoryQuestion
DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion(
    CategoryID				TINYINT UNSIGNED AUTO_INCREMENT,
    CategoryName			NVARCHAR(50) NOT NULL UNIQUE KEY,
    PRIMARY KEY(CategoryID),
    UNIQUE KEY(CategoryName)
);

-- tao table 8: Question
DROP TABLE IF EXISTS Question;
CREATE TABLE Question(
    QuestionID				TINYINT UNSIGNED AUTO_INCREMENT,
    Content					NVARCHAR(100) NOT NULL,
    CategoryID				TINYINT UNSIGNED NOT NULL,
    TypeID					TINYINT UNSIGNED NOT NULL,
    CreatorID				TINYINT UNSIGNED NOT NULL,
    CreateDate				DATETIME DEFAULT NOW(),
    PRIMARY KEY(QuestionID),
    UNIQUE KEY(CreatorID),
    FOREIGN KEY(CategoryID) 	REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY(TypeID) 		REFERENCES TypeQuestion(TypeID),
    FOREIGN KEY(CreatorID) 		REFERENCES `Account`(AccountId)
);

-- tao table 9: Answer
DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer(
    Answers					TINYINT UNSIGNED AUTO_INCREMENT,
    Content					NVARCHAR(100) NOT NULL,
    QuestionID				TINYINT UNSIGNED NOT NULL,
    isCorrect				BIT DEFAULT 1,
    PRIMARY KEY(Answers),
    FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID)
);

-- tao table 10: Exam
DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam(
    ExamID					TINYINT UNSIGNED AUTO_INCREMENT,
    `Code`					CHAR(10) NOT NULL,
    Title					NVARCHAR(50) NOT NULL,
    CategoryID				TINYINT UNSIGNED NOT NULL,
    Duration				TINYINT UNSIGNED NOT NULL,
    CreatorID				TINYINT UNSIGNED NOT NULL,
    CreateDate				DATETIME DEFAULT NOW(),
    PRIMARY KEY(ExamID),
    FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY(CreatorID) 	REFERENCES `Account`(AccountId)
);

-- tao table 11: ExamQuestion
DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion(
    ExamID				TINYINT UNSIGNED NOT NULL,
	QuestionID			TINYINT UNSIGNED NOT NULL,
    FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID),
    FOREIGN KEY(ExamID) REFERENCES Exam(ExamID),
    PRIMARY KEY (ExamID,QuestionID)
);
-- chen 10 ban ghi
INSERT INTO Department(DepartmentName) 
VALUES
						(N'Marketing'	),
						(N'Sale'		),
						(N'Bảo vệ'		),
						(N'Nhân sự'		),
						(N'Kỹ thuật'	),
						(N'Tài chính'	),
						(N'Phó giám đốc'),
						(N'Giám đốc'	),
						(N'Thư kí'		),
						(N'Bán hàng'	);
    
INSERT INTO Position	(PositionName	) 
VALUES 					('Dev'			),
						('Test'			),
						('Scrum Master'	),
						('PM'			); 


INSERT INTO `Account`(Email								, Username			, FullName				, DepartmentID	, PositionID, CreateDate)
VALUES 				('lananh@gmail.com'	                ,'dangblack'	    ,'Nguyen Lan Anh'		,   '5'			,   '1'		,'2020-03-05'),
					('lehuy@gmail.com'                  ,'huyasd'		    ,'Le Anh Huy'		    ,   '1'			,   '2'		,'2020-03-05'),
                    ('vannam@gmail.com'				    , 'namfre'		    ,'Nguyen Phuoc Thinh '  ,   '2'			,   '3'		,'2020-03-07'),
                    ('haihau@gmail.com'				    , 'hausdfs'	        ,N'Nguyễn Hải Hau'		,   '3'			,   '4'		,'2020-03-08'),
                    ('thuhuong@gmail.com'				, 'huongssf'		,'Ha Thu Huong'	        ,   '4'			,   '4'		,'2020-03-10'),
                    ('lemai@gmail.com'		            , 'maisf'			,'Nguyen Le Mai'		,   '6'			,   '3'		,'2020-04-05'),
                    ('vanhien@gmail.com'			    , 'hiensfse'		,'Tran Van Hien'		,   '7'			,   '2'		,'2020-04-05'),
                    ('phuocthinh@gmail.com'				, 'thinhgfdg'		,'Tran Van Nam'	,   '8'			,   '1'		,'2020-04-07'),
                    ('quanghai@gmail.com'				, 'haidwe'		    ,'Nguyen Quang Hai'		,   '9'			,   '2'		,'2020-04-07'),
                    ('tiendung@gmail.com'			    , 'dungqew'		    ,'Bui Tien Dung'		,   '10'		,   '1'		,'2020-04-09');

INSERT INTO `Group`	(  GroupName	   , CreatorID		, CreateDate)
VALUES 				(N'Hoc tap'		   ,   5			,'2019-03-05'),
					(N'Giai Dap'	   ,   1			,'2020-03-07'),
                    (N'Cong Nghe'	   ,   2			,'2020-03-09'),
                    (N'Ban Luan'	   ,   3			,'2020-03-10'),
                    (N'Nghien Cuu'	   ,   4			,'2020-03-28'),
                    (N'Huong Dan'	   ,   6			,'2020-04-06'),
                    (N'Ban Hang'	   ,   7			,'2020-04-07'),
                    (N'Tim Viec'	   ,   8			,'2020-04-08'),
                    (N'Giai Tri'	   ,   9			,'2020-04-09'),
                    (N'Vui Choi'	   ,   10			,'2020-04-10');

INSERT INTO `GroupAccount`	(  GroupID	, AccountID	, JoinDate	 )
VALUES 						(	1		,    1		,'2019-03-05'),
							(	1		,    2		,'2020-03-07'),
							(	3		,    3		,'2020-03-09'),
							(	3		,    4		,'2020-03-10'),
							(	5		,    5		,'2020-03-28'),
							(	1		,    3		,'2020-04-06'),
							(	1		,    7		,'2020-04-07'),
							(	8		,    3		,'2020-04-08'),
							(	1		,    9		,'2020-04-09'),
							(	10		,    10		,'2020-04-10');


INSERT INTO TypeQuestion	(TypeName			) 
VALUES 						('Essay'			), 
							('Multiple-Choice'	); 


INSERT INTO CategoryQuestion		(CategoryName	)
VALUES 								('Java'			),
									('ASP.NET'		),
									('ADO.NET'		),
									('SQL'			),
									('Postman'		),
									('Ruby'			),
									('Python'		),
									('C++'			),
									('C Sharp'		),
									('PHP'			);
													
INSERT INTO Question	(Content			, CategoryID, TypeID		, CreatorID	, CreateDate )
VALUES 					(N'Câu hỏi về Java'	,	1		,   '1'			,   '1'		,'2020-04-05'),
						(N'Câu Hỏi về PHP'	,	10		,   '2'			,   '2'		,'2020-04-05'),
						(N'Hỏi về C#'		,	9		,   '2'			,   '3'		,'2020-04-06'),
						(N'Hỏi về Ruby'		,	6		,   '1'			,   '4'		,'2020-04-06'),
						(N'Hỏi về Postman'	,	5		,   '1'			,   '5'		,'2020-04-06'),
						(N'Hỏi về ADO.NET'	,	3		,   '2'			,   '6'		,'2020-04-06'),
						(N'Hỏi về ASP.NET'	,	2		,   '1'			,   '7'		,'2020-04-06'),
						(N'Hỏi về C++'		,	8		,   '1'			,   '8'		,'2020-04-07'),
						(N'Hỏi về SQL'		,	4		,   '2'			,   '9'		,'2020-04-07'),
						(N'Hỏi về Python'	,	7		,   '1'			,   '10'	,'2020-04-07');

INSERT INTO Answer	(  Content		, QuestionID	, isCorrect	)
VALUES 				(N'Trả lời 01'	,   1			,	0		),
					(N'Trả lời 02'	,   1			,	1		),
                    (N'Trả lời 03'	,   1			,	0		),
                    (N'Trả lời 04'	,   1			,	1		),
                    (N'Trả lời 05'	,   2			,	1		),
                    (N'Trả lời 06'	,   3			,	1		),
                    (N'Trả lời 07'	,   4			,	0		),
                    (N'Trả lời 08'	,   8			,	0		),
                    (N'Trả lời 09'	,   9			,	1		),
                    (N'Trả lời 10'	,   10			,	1		);
	
INSERT INTO Exam	(`Code`			, Title					, CategoryID	, Duration	, CreatorID		, CreateDate )
VALUES 				('VTIQ001'		, N'Đề thi C#'			,	1			,	60		,   '5'			,'2019-04-05'),
					('VTIQ002'		, N'Đề thi PHP'			,	10			,	60		,   '1'			,'2019-04-05'),
                    ('VTIQ003'		, N'Đề thi C++'			,	9			,	120		,   '2'			,'2019-04-07'),
                    ('VTIQ004'		, N'Đề thi Java'		,	6			,	60		,   '3'			,'2020-04-08'),
                    ('VTIQ005'		, N'Đề thi Ruby'		,	5			,	120		,   '4'			,'2020-04-10'),
                    ('VTIQ006'		, N'Đề thi Postman'		,	3			,	60		,   '6'			,'2020-04-05'),
                    ('VTIQ007'		, N'Đề thi SQL'			,	2			,	60		,   '7'			,'2020-04-05'),
                    ('VTIQ008'		, N'Đề thi Python'		,	8			,	60		,   '8'			,'2020-04-07'),
                    ('VTIQ009'		, N'Đề thi ADO.NET'		,	4			,	90		,   '9'			,'2020-04-07'),
                    ('VTIQ010'		, N'Đề thi ASP.NET'		,	7			,	90		,   '10'		,'2020-04-08');
                    
                    
INSERT INTO ExamQuestion(ExamID	, QuestionID	) 
VALUES 					(	1	,		5		),
						(	2	,		10		), 
						(	3	,		4		), 
						(	4	,		3		), 
						(	5	,		7		), 
						(	6	,		10		), 
						(	7	,		2		), 
						(	8	,		10		), 
						(	9	,		9		), 
						(	10	,		8		); 
-- lấy ra tất cả các phòng ban
SELECT * FROM Department;
-- lấy ra id của phòng ban "Sale"
SELECT DepartmentID 
FROM Department 
WHERE DepartmentName='Sale';
-- lấy ra thông tin account có full name dài nhất và sắp xếp chúng theo thứ tự giảm dần
SELECT * 
FROM `Account`
WHERE LENGTH(FullName)=(SELECT MAX(LENGTH(FullName)) FROM `Account`)
ORDER BY FullName DESC;
-- Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id= 3
SELECT * 
FROM `Account`
WHERE LENGTH(FullNAME)=(SELECT MAX(LENGTH(FullName)) FROM `Account`) AND AccountID=3;
-- lấy ra tên group đã tham gia trước ngày 20/12/2019
SELECT GroupName
FROM `Group`
WHERE CreateDate < '2019-12-20';
-- Lấy ra ID của question có >= 4 câu trả lời
SELECT 		QuestionID
FROM 		Answer
GROUP BY 	QuestionID
HAVING 		COUNT(QuestionID) >= 4;
-- Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20/12/2019
SELECT `Code`
FROM Exam
WHERE Duration >=60 AND CreateDate < '2019-12-20';
-- Lấy ra 5 group được tạo gần đây nhất
SELECT *
FROM `Group`
ORDER BY CreateDate DESC
LIMIT 5;
-- Đếm số nhân viên thuộc department có id = 2
SELECT COUNT(DepartmentID) AS demsonhanvien
FROM Department
WHERE DepartmentID=2;
-- Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"
SELECT 		FullName 
FROM 		`Account`
WHERE 		(SUBSTRING_INDEX(FullName, ' ', -1)) LIKE 'D%o' ;

-- xóa tất cả các exam được tạo trước ngày 20/12/2019
SET FOREIGN_KEY_CHECKS=0;
DELETE 
FROM 		Exam 
WHERE 		CreateDate < '2019-12-20';
-- xóa tất cả các Account có FullName bắt đầu bằng 2 từ "Nguyễn Hải"
SET FOREIGN_KEY_CHECKS=0;
DELETE 
FROM 		`Account`
WHERE 		(SUBSTRING_INDEX(FullName,' ',2)) = 'Nguyễn Hải';
--  update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và email thành loc.nguyenba@vti.com.vn
UPDATE 		`Account` 
SET 		FullName 	= 	N'Nguyễn Bá Lộc', 
			Email 		= 	'loc.nguyenba@vti.com.vn'
WHERE 		AccountID = 5;

-- update account có id = 5 sẽ thuộc group có id = 4
UPDATE 		`GroupAccount` 
SET 		AccountID = 5 
WHERE 		GroupID = 4;