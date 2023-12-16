Q. Select the 3 users with the highest IDs from the users table.
=>
SELECT * FROM users
ORDER BY id DESC
LIMIT 3;

Q. Join the users and posts table. Show the username of user ID 200 and the captions of all posts they have created.
=>
SELECT username, caption 
FROM users JOIN posts
ON posts.user_id = users.id 
WHERE posts.user_id = 200; -- or WHERE users.id = 200;

Q. Show each username and the number of 'likes' that they have created.
=>
SELECT username, COUNT(*) AS number_of_likes
FROM likes JOIN users
ON likes.user_id = users.id
GROUP BY username;
