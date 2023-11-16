* Aggregate function: An aggregate function or aggregation function is a function where the values of multiple rows in a single column are processed together to form a single summary value.
=> SELECT MAX(id) FROM comments;
=> SELECT MIN(id) FROM comments;
=> SELECT SUM(id) FROM comments;
=> SELECT COUNT(id) FROM comments;
=> SELECT AVG(id) FROM comments;
-- Note: You cannot use multiple select with aggragation like Select MAX(id), content from comments;