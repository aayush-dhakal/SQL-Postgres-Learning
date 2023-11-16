# join two strings
=> SELECT CONCAT(name, ', ', country) AS location FROM cities;

# upper and lower case 
=> SELECT 
    CONCAT(UPPER(name), ', ', UPPER(country)) AS location 
    FROM cities;
    -- the same can be done as:
    => SELECT 
        UPPER(CONCAT(name), ', ', UPPER(country)) AS location 
        FROM cities;

# use LOWER and LENGTH to convert into lowercase or to find length of string
