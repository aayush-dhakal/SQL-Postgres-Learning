=>
SELECT GREATEST(20,10,30); -- retruns 30

Q. Compute the cost to ship each item. 
Shipping is the maximum of (weight * $2) or $30
=> 
SELECT name, weight, GREATEST(weight * 2, 30) from products; -- this GREATEST assigns the value to greatest column.
-- if you want to give the custom name then:
=>
SELECT name, weight, GREATEST(weight * 2, 30) as cost_to_ship from products;

