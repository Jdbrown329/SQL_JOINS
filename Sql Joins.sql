/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT *
FROM products p 
LEFT JOIN categories c
ON p.CategoryID = c.CategoryID;

SELECT p.Name AS Product, c.Name AS Category
FROM products p
INNER JOIN categories c
ON p.CategoryID = c.CategoryID
WHERE c.Name LIKE "%comp%";

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT p.Name AS Product_Name, p.Price AS Product_Price, r.Rating AS Product_Rating
FROM products p
INNER JOIN reviews r
ON p.ProductID = r.ProductID
WHERE r.Rating = 5;

/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT e.FirstName AS First, e.LastName AS Last, sum(s.Quantity) AS Total
FROM employees e
Inner JOIN sales s
ON e.EmployeeID = s.EmployeeID
Group BY e.EmployeeID
ORDER BY Total DESC
LIMIT 2;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.Name as Name, c.Name as Categorie
FROM categories c
LEFT JOIN departments d
ON d.DepartmentID = c.DepartmentID
WHERE c.Name LIKE "%appliance%" OR c.Name LIKE "%Games%";

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT * FROM products;
SELECT p.Name AS Product_Name, sum(s.Quantity) as Total_Number_Sold, sum( s.Quantity * s.PricePerUnit) AS Total_Price_Sold
FROM products p
INNER JOIN sales s
ON p.ProductID = s.ProductID
WHERE p.ProductID = 97;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT * From Reviews;
SELECT p.Name AS Product_Name, r.Reviewer AS Reviewer_Name, r.Rating AS Rating, r.Comment AS Comment
FROM products P
Inner JOIN reviews r
ON p.ProductID = r.ProductID
WHERE p.ProductID = 857 && r.Rating <= 1;