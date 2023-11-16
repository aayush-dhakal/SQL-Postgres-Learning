# lets say you want to retrieve density then you can do this:
=> SELECT name, population / area as population_density 
FROM cities; 
-- population_density will be the column name shown while retrieving the data. If nothing is provided then it will show ?column?

# you can use mathmatical operators
=> SELECT name, population + area as sumOfPopArea FROM cities;