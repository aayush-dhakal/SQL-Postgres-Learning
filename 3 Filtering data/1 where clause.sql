# WHERE clause with greater than operator
=> SELECT name, area FROM cities WHERE area > 700;
-- here fist FROM cities is executed which selects the table then area > 70 is executed which filters the data then SELECT is executed

# Multiple conditions
=> SELECT name, area FROM cities WHERE area BETWEEN 600 AND 800 AND name = 'Tokyo';
-- this will return the row whose area is betwen 600 and 800 and whose name is also 'Tokyo'
-- Note: do not use double quotes for string
=> SELECT name, area FROM cities WHERE area BETWEEN 600 AND 800 OR name = 'Delhi';
-- this will return the rows whose area is bwtenn 600 and 800 or those rows whose name is Delhi. For ex: this will return Tokyo with area 700 and Delhi with area 900

# BETWEEN operator
=> SELECT name, area FROM cities WHERE area BETWEEN 600 AND 700;

# IN operator
=> SELECT name, area FROM cities WHERE name IN ('Tokyo', 'Ktm', 'Delhi');
-- return the rows with name Tokyo and Delhi as Ktm does not exist so it will be ignored

# NOT IN operator
=> SELECT name, area FROM cities WHERE name NOT IN ( 'Ktm', 'Delhi');
-- return the rows with name other than Ktm and Delhi
