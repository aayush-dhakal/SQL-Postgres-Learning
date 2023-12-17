Q. Print from 3 to 1.
=>
WITH RECURSIVE countdown(val) AS (
  SELECT 3 AS val -- this is a non recursive initial statement
  UNION 
  SELECT val - 1 FROM countdown WHERE val > 1 -- here countdown is a working table and we run this recursive statement on that table and the result of that expression will be added to result table. Also, the working table value will be replaced with this returned expression value
)
SELECT *
FROM countdown;

Q. Show suggestions to user with id 1 to whom he should follow baseed on his following people's following.'
Example: If I follow Kevin and if Kevin follows Hari then it will show me Hari as suggestion. This is for depth 2 suggestion as depth 1 will be referred to Kevin only who I already follow. Now if Hari follows Shyam and if Shyam is shown as suggestion then that is depth 3 suggestion.
=>
-- here working table name is suggestions and its columns are leader_id, follower_id, depth
WITH RECURSIVE suggestions(leader_id, follower_id, depth) AS (
  SELECT leader_id, follower_id, 1 AS depth -- initially we hardcode the depth as 1 as these are the people who the use with id 1 follows
  FROM followers
  WHERE follower_id = 1
UNION
  SELECT followers.leader_id, followers.follower_id, depth + 1
  FROM followers
  -- Selecting those users who are leaders for the followers(this followers are the leader for user with id 1). So basically these leaders are the ones who are 2 depth suggestions when initial depth is 1. So example for depth 2 this will get the users(we are not techincally getting the users here but just their id in form of their leader_id) who Kevin follows.
  JOIN suggestions ON suggestions.leader_id = followers.follower_id
  WHERE depth < 3
)
-- Selecting distinct user information for suggestions with depth greater than 1
SELECT DISTINCT users.id, users.username
FROM suggestions
JOIN users ON users.id = suggestions.leader_id
WHERE depth > 1 -- remember depth of 1 represents the users who the user with id 1 already follows
LIMIT 30;
