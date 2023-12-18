# A view is a database object that allows generating a logical subset of data from one or more tables.
So when you refer to the view in an outer query then it executes its view creation code and gets the upto date data from its joining tables.
=>
CREATE VIEW tags AS (
  -- We will add 'photo_tag' vlaue in type column to denote that the data is from photo_tags
  SELECT id, created_at, user_id, post_id, 'photo_tag' AS type FROM photo_tags
  UNION ALL
  SELECT id, created_at, user_id, post_id, 'caption_tag' AS type FROM caption_tags
)

-- To query view:
=> 
SELECT * FROM tags;

-- You can use this view in queries like:
Q. Get the most popular user by checking who has the most number of tags.
=>
SELECT username, COUNT(*)
FROM users
JOIN tags ON tags.user_id = users.id -- here when we refer to tags then it executes the tag creation code and gives us the combined tables data to run the query on
-- GROUP BY user_id -- will not give username in SELECT if we group by anything other than username
GROUP BY username -- since we are selecting username in SELECT so we must grouping by username
ORDER BY COUNT(*) DESC;

-- Without view you have to write quieies like this:
=>
SELECT username, COUNT(*)
FROM users
JOIN(
  SELECT user_id FROM photo_tags 
  UNION ALL
  SELECT user_id FROM caption_tags
) AS tags ON tags.user_id = users.id
-- GROUP BY user_id -- will not give username in SELECT if we group by anything other than username
GROUP BY username -- since we are selecting username in SELECT so we must grouping by username
ORDER BY COUNT(*) DESC;

Q 1. Show the users who created the 10 most recent posts.
Q 2. Show the number of likes each of the 10 most recent posts received.
=>
-- First create a view for top 10 most recent posts:
CREATE VIEW recent_posts AS(
  SELECT *
  FROM posts
  ORDER BY created_at DESC 
  LIMIT 10
);
-- You can use this view for both question like:

-- for question 1:
SELECT username
FROM recent_posts
JOIN users ON users.id = recent_posts.user_id;

-- for question 2 you can use the same view
SELECT
  recent_posts.id AS post_id,
  COUNT(likes.id) AS like_count
FROM recent_posts
LEFT JOIN likes ON recent_posts.id = likes.post_id
GROUP BY recent_posts.id, recent_posts.created_at
ORDER BY MAX(recent_posts.created_at) DESC;

-- Now if we want to modify our recent_posts view to include 15 new posts then modify the view by this:
=>
CREATE OR REPLACE VIEW recent_posts AS (
  SELECT * FROM posts
  ORDER BY created_at DESC
  LIMIT 15
)

-- query the view:
SELECT * FROM recent_posts;

-- delete the view:
DROP VIEW recent_posts;
