# concat two string columns
=> SELECT name || ', ' || country AS location FROM cities;
// location will be the column name shown while retrieving the concatinated namd and column. If nothing is provided then it will show ?column?