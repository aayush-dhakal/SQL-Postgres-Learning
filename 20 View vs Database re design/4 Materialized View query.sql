Q. For each week, show the number of likes that posts and comments received. Use the post and comment created_at date, not when the like was received.

--- Slow Query:
=>
SELECT 
  date_trunc('week', COALESCE(posts.created_at, comments.created_at)) AS week, -- date_trunc is the function from postgres which will round the date to the closest defined value here week so if the day is jan 5 then it will be assigned to first week, similarly day 8 will be assign to week 2. Here, we will assign the created_at of either post or comment which ever is not null(by using COALESCE) to their nearest week.
  COUNT(posts.id) AS num_likes_for_posts, -- with COUNT function it doesn't count null values. So if a like is in comment then it will not include that like in commnent
  COUNT(comments.id) AS num_likes_for_comments
FROM likes
-- We have to do a LEFT JOIN here coz the like is either in post or commnet so if we do inner join then we will get emppty result, but with LEFT JOIN, we will get the likes table content even if join is not possible on posts. We have to do this coz we want to fill both post and comments data for likes even when one of them is null we will just insert null give either of them is not present.
LEFT JOIN posts ON posts.id = likes.post_id
LEFT JOIN comments ON comments.id = likes.comment_id
GROUP BY week
ORDER BY week;

-- Using Materialized View for fast query:
=>
CREATE MATERIALIZED VIEW weekly_likes AS (
  SELECT 
    date_trunc('week', COALESCE(posts.created_at, comments.created_at)) AS week, -- date_trunc is the function from postgres which will round the date to the closest defined value here week so if the day is jan 5 then it will be assigned to first week, similarly day 8 will be assign to week 2. Here, we will assign the created_at of either post or comment which ever is not null(by using COALESCE) to their nearest week.
    COUNT(posts.id) AS num_likes_for_posts, -- with COUNT function it doesn't count null values. So if a like is in comment then it will not include that like in commnent
    COUNT(comments.id) AS num_likes_for_comments
  FROM likes
  -- We have to do a LEFT JOIN here coz the like is either in post or commnet so if we do inner join then we will get emppty result, but with LEFT JOIN, we will get the likes table content even if join is not possible on posts. We have to do this coz we want to fill both post and comments data for likes even when one of them is null we will just insert null give either of them is not present.
  LEFT JOIN posts ON posts.id = likes.post_id
  LEFT JOIN comments ON comments.id = likes.comment_id
  GROUP BY week
  ORDER BY week
) WITH DATA; -- WITH DATA created the view and holds onto its result so anythime we refer to this view we will get that stored data very quickly without rerunning this view query.

-- to view the materialized table:
=>
SELECT * FROM weekly_likes;

-- Now obviously since WITH DATA materialized view sort of caches the query result, anytime we modify the post or comment table itself the weekly_likes will not give the latest updated result.

-- to test this lets delete the likes for 2010 January month:
=>
DELETE FROM posts 
WHERE created_at < '2010-02-01';

-- now if we the materialized table:
=>
SELECT * FROM weekly_likes;
-- we will get the same result, even the likes for 2010 january month

-- We have to update the materailized view table to get the latest result:
=>
REFRESH MATERIALIZED VIEW weekly_likes;
