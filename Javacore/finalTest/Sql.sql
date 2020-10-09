CREATE DATABASE qlyungvien;
DROP DATABASE qlyungvien;
USE qlyungvien;
CREATE TABLE IF NOT EXISTS Manager (
	idManager INT AUTO_INCREMENT,
	id INT  NOT NULL,
    fullName VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL,
    pass VARCHAR(100) NOT NULL,
    expInYear TINYINT,
    PRIMARY KEY (idManager),
    UNIQUE KEY (email)

);
CREATE TABLE IF NOT EXISTS Employee (
	idEmployees INT AUTO_INCREMENT,
	id INT NOT NULL ,
    fullName VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL,
    pass VARCHAR(100) NOT NULL,
    projectId INT,
    proSkill VARCHAR(50),
    PRIMARY KEY (idEmployees),
    UNIQUE KEY (email)
);
CREATE TABLE IF NOT EXISTS  Project (
	projectId INT AUTO_INCREMENT,
    teamSize INT NOT NULL,
    idManager INT NOT NULL,
    idEmployees INT NOT NULL,
        PRIMARY KEY (projectId),
		FOREIGN KEY (idManager) REFERENCES Manager (idManager),
        FOREIGN KEY (idEmployees) REFERENCES Employee (idEmployees) 
);
INSERT INTO Manager            (id,    fullName,       email,                pass,       expInYear) 
VALUES							(1,    'van',     'haivan@vti.com.vn',   'Van23562234',    18     ),
								(2,    'lan',     'mailan@vti.com.vn',   'Lan12345678',    12     );
INSERT INTO Employee            (id,    fullName,      email,                 pass,        projectId,    proSkill) 
VALUES                          (1,      'vien',   'thivien@vti.com.vn',  'Vien243546578',    1,           'dev' ),
								(2,      'hoa',   'thanhhoa@vti.com.vn',  'Hoa3476978023',    2,            'test'  );
INSERT INTO Project             (teamSize,idManager,idEmployees) 
VALUES                          (1,          1,        1       ),
								(2,          2,        2       );
SELECT*FROM Manager;
SELECT*FROM Employee;
SELECT*FROM Project;