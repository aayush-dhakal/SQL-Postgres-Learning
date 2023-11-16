# List all photos url with its associated user username:
* INNER JOIN or just JOIN by default: Returns rows from both tables where there is a match between the columns being joined.
-- NOTE: for INNER JOIN the order of joining tables does not make a difference
=> SELECT url,username
    FROM photos INNER JOIN users ON users.id = photos.user_id;
    OR:
=> SELECT url,username
    FROM photos JOIN users ON users.id = photos.user_id;
-- Note: if the user_id is Null on some rows in photos table then we will not get that photos as the JOIN will fail when it cannot match the photos's user_id with user's id as there are no NULL in user's table id.
 
-- For such situation where we will still want to get all the elements of the first table that was joined even when the JOIN condition is not fulfilled then we will use LEFT JOIN. 
-- Similarly if we wanted to get all the elements of user's table then we would have used RIGHT JOIN as it is joined after photos so it is refered as right table
-- '

* LEFT JOIN or LEFT OUTER JOIN: Returns all rows from the left table and the matched rows from the right table. If there is no match, NULL values are returned for columns from the right table.
=> SELECT url,username
    FROM photos LEFT JOIN users ON users.id = photos.user_id;
-- this will print all the rows of photos even if their user_id is NULL and for its respective user column vlaues it will place NULL if the photo has user_id as NULL

* RIGHT JOIN or RIGHT OUTER JOIN: Returns all rows from the right table and the matched rows from the left table. If there is no match, NULL values are returned for columns from the left table.

* FULL JOIN: Returns all rows when there is a match in either the left or right table. If there is no match, NULL values are returned for columns from the table without a match.
- Syntax: SELECT * FROM table1 FULL JOIN table2 ON table1.column = table2.column;

* CROSS JOIN:
- Description: Returns the Cartesian product of both tables, i.e., all possible combinations of rows from both tables.
- Syntax: SELECT * FROM table1 CROSS JOIN table2;

* SELF JOIN:
- Description: Joins a table with itself. Useful when you want to compare rows within the same table.
- Syntax: SELECT * FROM table1 t1 INNER JOIN table1 t2 ON t1.column = t2.column;