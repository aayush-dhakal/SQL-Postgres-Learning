Q. What unique departments are there in products?
=>
SELECT DISTINCT department
FROM products;

Q. How many unique departments are there in products?
=>
SELECT COUNT(DISTINCT department)
FROM products;
-- Note: you can only use COUNT for a single distinct item
-- You cann't do:
SELECT COUNT(DISTINCT department, name)
FROM products;

Q. Find unique combination of department and name(ie department and name column will have different values. but the values can repeat for same column for eg there can be same department in multiple rows).
=>
SELECT DISTINCT department, name
FROM products;