# insert single value
=> INSERT INTO cities(name,country,population,area) 
VALUES ('Tokyo','Japan',3809090,675);

// you can insert columns in any order as long as value are properly provided for eg:
=> INSERT INTO cities(name,population,area,country,) 
VALUES ('Tokyo',3809090,675,'Japan');

# insert many vlaues
=> INSERT INTO cities(name,country,population,area) 
VALUES ('Tokyo','Japan',3809090,675),
       ('Delhi','India',2809090,875),
       ('Texas','USA',1809090,985);