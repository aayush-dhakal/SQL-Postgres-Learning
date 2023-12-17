Q. Show the username of users who were tagged in a caption or photo before January 7th, 2010.
=> -- Using normal union
SELECT users.username, tags.created_at -- since we are filtering date in tags table so we have to use created_at of tag table
FROM users
JOIN (
  -- select all those users id(even duplicated ones) who has been tagged in post caption or photo caption
  SELECT user_id, created_at FROM caption_tags
  UNION ALL
  SELECT user_id, created_at FROM photo_tags
) AS tags ON tags.user_id = users.id
WHERE tags.created_at < '2010-01-07';

-- Using CTE: We use this for better readability
-- Common Table Expression (CTE), which is a temporary result set that you can reference within the context of a SELECT, INSERT, UPDATE, or DELETE statement.
=> 
WITH tags AS (
  -- select all those users id(even duplicated ones) who has been tagged in post caption or photo caption
  SELECT user_id, created_at FROM caption_tags
  UNION ALL
  SELECT user_id, created_at FROM photo_tags
)
SELECT users.username, tags.created_at -- since we are filtering date in tags table so we have to use created_at of tag table
FROM users
JOIN tags ON tags.user_id = users.id
WHERE tags.created_at < '2010-01-07';
