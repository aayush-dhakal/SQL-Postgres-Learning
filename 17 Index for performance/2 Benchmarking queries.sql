-- See the time taken for query execution before and after adding index by this command:
=>
EXPLAIN ANALYZE SELECT *
FROM users 
WHERE username = 'Emil30';  
-- this will give detail analysis along with time frame

-- If you just want to see how the query is being execute then only use EXPLAIN:
=>
EXPLAIN SELECT *
FROM users 
WHERE username = 'Emil30';  
