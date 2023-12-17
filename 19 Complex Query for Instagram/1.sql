Q. Get the most popular user by checking who has the most number of tags.
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

