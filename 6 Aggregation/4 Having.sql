-- Having will always come after Group By. I cann't be used on its own
Q. Find the number of comments for each photo where the photo_id is less than 3 and the photo has more than 2 comments:
=> SELECT photo_id, COUNT(*)
FROM comments
WHERE photo_id < 3
GROUP BY photo_id
HAVING COUNT(*) > 2;
-- In the result of GROUP BY we are just putting a contidion of the number of grouped rows being greater than 2

-- Q. Find the users(user_id) where the user has commented on the first 2 photos and the user added more than or equal to 2 comments on those photos:
Q. Find the users(user_id) where the user has commented on the first 50 photos and the user added more than 20 comments on those photos:
=> SELECT user_id, COUNT(*)
FROM comments
WHERE photo_id < 50
GROUP BY user_id
HAVING COUNT(*) > 20;
