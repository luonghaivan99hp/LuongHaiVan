
USE classicmodels;
-- 1, Tính tổng giá trị của các order đã xuất kho (‘shipped’) trong tháng Tám năm 2004
SELECT sum(a.priceEach*a.quantityOrdered) AS TONG
FROM orderdetails a
JOIN orders b ON a.orderNumber=b.orderNumber
WHERE b.shippedDate > '2004-08-1' AND b.shippedDate < '2004-08-30'and b.`status`='shipped';
-- 2, Tính lợi nhuận (profit) thu được từ mỗi khách hàng dựa trên các orders mà họ thực hiện.Liệt kê theo tên khách hàng
SELECT a.customerName,ifnull(sum(c.quantityOrdered),0) total_orders,ifnull(sum(c.quantityOrdered*(c.priceEach-d.buyPrice)),0)
FROM customers a
left JOIN orders b ON a.customerNumber=b.customerNumber
left JOIN orderdetails c ON b.orderNumber=c.orderNumber
left JOIN products d ON c.productCode=d.productCode
GROUP BY a.customerName
order by a.customerName;
-- cau 3
select a.productName,(b.priceEach*b.quantityOrdered) as 'doanh thu'
from  products a
join orderdetails b on a.productCode=b.productCode
group by a.productName;