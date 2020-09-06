USE qlybaithi;
CREATE VIEW DS AS
SELECT		a.*,d.DepartmentName
FROM 		`account` a
JOIN		department d
ON 			a.DepartmentID = d.DepartmentID
WHERE		d.DepartmentName = 'SALE';
SELECT 		* FROM DS;
DROP VIEW DS;
CREATE VIEW AC AS
SELECT a.*, COUNT(g.AccountID) AS DEM FROM `account` a
JOIN			groupaccount g
ON				a.AccountID= g.AccountID
GROUP BY 		g.AccountID
HAVING			DEM = (SELECT MAX(MAXS.DEM) 
FROM			(SELECT AccountID, COUNT(g.AccountID) AS DEM
FROM			groupaccount g
GROUP BY 		g.AccountID) AS MAXS);
SELECT * FROM AC;
CREATE VIEW XOA AS
SELECT *FROM 	`question`
WHERE		 	LENGTH(Content) >300;
DELETE  FROM XOA WHERE LENGTH(Content) >300;
CREATE VIEW D4 AS
SELECT		d.*,COUNT(a.DepartmentID) AS DEM
FROM 		`account` a
JOIN		department d
ON 			a.DepartmentID = d.DepartmentID
GROUP BY	a.DepartmentID
ORDER BY	DEM DESC
LIMIT 1;
SELECT 		* FROM D4;
DROP VIEW D4;
CREATE VIEW Q5 AS
SELECT 		Q.*, A.FullName
FROM 		Question Q 
RIGHT JOIN 		`Account` A ON Q.CreatorID = A.AccountID
WHERE		SUBSTRING_INDEX(FullName,' ',1) = 'Nguyen';
SELECT * FROM Q5;