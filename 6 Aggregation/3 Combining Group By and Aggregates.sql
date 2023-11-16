Q. Find the maximum id of the comment for each user:
=> SELECT user_id, MAX(id)
FROM comments
GROUP BY user_id;
-- We first group by unique user_id and among those group we find the maximum id of the comment that user is associated within their group commnets

Q. Find the number of comments made by each user:
=> SELECT user_id, COUNT(id) AS number_of_comments
FROM comments
GROUP BY user_id;
-- We first group by unique user_id and among those group we find the count of id of the comment that user is associated within their group commnets. We can also use AS to give meaningful column name
-- If you want to include every row and avoid NULL cases then
=> SELECT user_id, COUNT(*) AS number_of_comments
FROM comments
GROUP BY user_id;

* COUNT doesnot include null values:
=> SELECT COUNT(user_id) from comments;
-- This will give 20 as the user_id with NULL is not included.
-- To overcome this we can pay every row to count(by using *) like:
=> SELECT COUNT(*) from comments;

Q. Find the numnber of comments for each photo:
=> SELECT photo_id, COUNT(*)
FROM comments
GROUP BY photo_id;


Q. Find the number of comments made by each user and also print the username:
-- We have to use JOIN as username is not present in comments table alone
=> SELECT username, COUNT(*) AS number_of_comments
FROM comments
JOIN users ON comments.user_id = users.id
GROUP BY username;
-- If username is common table column name then explictly define them as:
=> SELECT user.username, COUNT(*) AS number_of_comments
FROM comments
JOIN users ON comments.user_id = users.id
GROUP BY users.username;
-- what is happening here is, first it will select all columns from comments and users based on their matching user_id and id. Then it will group the result based on similar username and will first print the username for each group and remember since we grouped by username there will be one unique username for each group and count(*) will count all the comments row for that one unique username for each group

