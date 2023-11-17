Q. Print the number of paid and unpaid orders:
=> select paid, Count(*) from orders group by paid;

Q. Print the first_name and last_name of the each user, then whether or not they have paid for their order:
=> SELECT first_name, last_name, paid 
FROM users 
JOIN orders ON users.id = orders.user_id;
