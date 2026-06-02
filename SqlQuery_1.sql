--------------------------------------------------------------------
/*
ویژه برنامه نویسان SQL Server دوره آموزشی 
Site:        http://www.NikAmooz.com
Email:       Info@NikAmooz.com
Instagram:   https://instagram.com/nikamooz/
Telegram:	 https://telegram.me/nikamooz
Created By:  Iman Bagheri
*/
--------------------------------------------------------------------

/*  ایجاد جدول فاکتور خرید */
DROP TABLE IF EXISTS TMPORDERDETAILS;
CREATE TABLE  TMPOrderDetails(
	ID INT IDENTITY(1,1),
	orderid int NOT NULL,
	productid int NOT NULL,
	unitprice money NOT NULL,
	qty smallint NOT NULL 
  ) ON [PRIMARY]
GO
INSERT  TMPOrderDetails (orderid, productid, unitprice, qty ) VALUES (10248, 11, 14.0000 ,11) 
INSERT  TMPOrderDetails (orderid, productid, unitprice, qty ) VALUES (10248, 15, 23.0000 ,15) 
INSERT  TMPOrderDetails (orderid, productid, unitprice, qty ) VALUES (10248, 1,  23.0000 ,7) 
INSERT  TMPOrderDetails (orderid, productid, unitprice, qty ) VALUES (10248, 11,  11.0000 ,2) 
INSERT  TMPOrderDetails (orderid, productid, unitprice, qty ) VALUES (10248, 1,  11.0000 ,9) 
INSERT  TMPOrderDetails (orderid, productid, unitprice, qty ) VALUES (10248, 11,  11.0000 ,1) 
INSERT  TMPOrderDetails (orderid, productid, unitprice, qty ) VALUES (10248, 10, 10.0000 ,10) 
INSERT  TMPOrderDetails (orderid, productid, unitprice, qty ) VALUES (10248, 1,  14.0000 ,8) 
INSERT  TMPOrderDetails (orderid, productid, unitprice, qty ) VALUES (10248, 1,  12.0000 ,9) 
INSERT  TMPOrderDetails (orderid, productid, unitprice, qty ) VALUES (10248, 1,  23.0000 ,5) 
INSERT  TMPOrderDetails (orderid, productid, unitprice, qty ) VALUES (10248, 11, 15.0000 ,21) 
INSERT  TMPOrderDetails (orderid, productid, unitprice, qty ) VALUES (10248, 10,  15.0000 ,1) 
INSERT  TMPOrderDetails (orderid, productid, unitprice, qty ) VALUES (10248, 12, 15.0000 ,12) 
INSERT  TMPOrderDetails (orderid, productid, unitprice, qty ) VALUES (10248, 1,  15.000 ,8) 


SELECT * FROM TMPORDERDETAILS


 /* 
	Running Total مفهوم مسئله    
	تمامی کوئری‌های زیر معادل یکدیگر هستند
*/

-- روش اول
/*
به‌صورت OVER در بخش ORDER BY در کوئری زیر به‌دلیل استفاده از عبارت
:پوشش داده می‌شود و مقدار پیش‌فرض آن عبارت است از Framing اتوماتیک
RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
*/

SELECT  orderid, productid,
		qty, SUM(qty) OVER(PARTITION BY orderid ORDER BY ID) AS QtyRunningTotal
FROM TMPOrderDetails
ORDER BY 1

-- روش دوم
SELECT
	orderid, productid, qty,
	SUM(qty) OVER ( PARTITION BY orderid 
					ORDER BY id 
					ROWS BETWEEN UNBOUNDED PRECEDING -- تمامی سطرهای قبل از سطر جاری و خودش
					AND CURRENT ROW ) AS Total
FROM TMPOrderDetails
GO

-- روش سوم 
SELECT
	orderid, productid, qty,
	SUM(qty) OVER ( PARTITION BY orderid 
					ORDER BY id 
					ROWS  UNBOUNDED PRECEDING  
				) AS Total
FROM TMPOrderDetails
GO
--------------------------------------------------------------------

/*
‌ Framing استفاده از
*/

-- مثال 1
SELECT
	ID, orderid, productid, qty,
	SUM(qty) OVER ( PARTITION BY orderid 
					ORDER BY ID 
					ROWS BETWEEN 3 PRECEDING -- به ازای 3 سطر قبلی و خودش
					AND CURRENT ROW ) AS Total
FROM TMPOrderDetails
ORDER BY ID

-- مثال 2
SELECT
	orderid, productid, qty,
	SUM(qty) OVER ( PARTITION BY orderid 
					ORDER BY ID 
					ROWS BETWEEN   CURRENT ROW -- به ازای خودش و 3 سطر بعدی
					AND 3 FOLLOWING ) AS Total
FROM TMPOrderDetails
ORDER BY ID


-- مثال 3
SELECT
	orderid, productid, qty,
	SUM(qty) OVER ( PARTITION BY orderid 
					ORDER BY ID 
					ROWS BETWEEN  3 PRECEDING -- به ازای 3 سطر قبل از خودش و 3 سطر بعد از خودش
					AND 2 FOLLOWING ) AS Total
FROM TMPOrderDetails
ORDER BY ID


-- مثال 4
SELECT
	orderid, productid, qty,
	SUM(qty) OVER ( PARTITION BY orderid 
					ORDER BY id 
					ROWS BETWEEN  3 PRECEDING -- به ازای 3 سطر قبل از خودش تا 1 سطر قبل از خودش
					AND 1 PRECEDING ) AS Total
FROM TMPOrderDetails
ORDER BY ID


/*  مقایسه کارایی توابع پنجره ای */


-- روش 1
SELECT
	orderid, productid, qty,
	SUM(qty) OVER ( PARTITION BY orderid 
					ORDER BY ID 
					ROWS BETWEEN  3 PRECEDING -- به ازای 3 سطر قبل از خودش تا 1 سطر قبل از خودش
					AND 1 PRECEDING ) AS QtyTotal,
	SUM(unitprice) OVER ( PARTITION BY orderid 
					ORDER BY ID 
					ROWS BETWEEN  3 PRECEDING -- به ازای 3 سطر قبل از خودش تا 1 سطر قبل از خودش
					AND 1 PRECEDING ) AS PriceTotal
FROM TMPOrderDetails
ORDER BY ID



--  روش 2 -   SQL 2000  
SELECT
	orderid, productid, qty,
	 (
		SELECT SUM(qty)
		FROM  TMPOrderDetails ORDER2
		WHERE ORDER2.ID BETWEEN ORDER1.ID -3  AND ORDER1.ID -1
	 ) AS QtyTotal
	 ,
	 (
		SELECT SUM(unitprice)
		FROM  TMPOrderDetails ORDER2
		WHERE ORDER2.ID BETWEEN ORDER1.ID -3  AND ORDER1.ID -1
	 ) AS PriceTotal
FROM TMPOrderDetails ORDER1
ORDER BY ID



/*
بیاید ORDER BY می‌بایست حتما با RANGE یا ROWS
!به‌همین دلیل کوئری زیر غلط است
*/

SELECT
	orderid, productid, qty,
	SUM(qty) OVER ( PARTITION BY orderid  
					ROWS BETWEEN 3 PRECEDING -- به ازای 3 سطر قبلی و خودش
					AND CURRENT ROW ) AS Total
FROM TMPOrderDetails
ORDER BY ID
  
 
 /*RANGE استفاده از  */
 SELECT
	orderid, productid, qty,unitprice,
	SUM(unitprice) OVER (  
					  ORDER BY unitprice 
					  ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW ) AS Total 
FROM TMPOrderDetails
ORDER BY unitprice


SELECT
	orderid, productid, qty,unitprice,
	SUM(unitprice) OVER (  
					  ORDER BY unitprice 
					  RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW ) AS Total 
FROM TMPOrderDetails
ORDER BY unitprice
