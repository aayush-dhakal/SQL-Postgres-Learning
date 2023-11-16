Q. Print comment's contents and photo's url such that the user who has posted the photos is also the user who has commneted on the same photo:
=> SELECT url,contents 
FROM comments 
JOIN photos ON photos.id = comments.photo_id
WHERE comments.user_id = photos.user_id;
-- we first want to create a JOIN then filter out the user using WHERE so WHERE always comes after the JOIN

Q. Same requirement as above but now we also want to print the username:
-- since we want to also include data from users table so we will need an additional join
-- for this user's id will be same for both comment and post(before this though we will select those comments content which belongs to their post only same as above)  -- '
=> SELECT url,contents,username 
FROM comments 
JOIN photos ON photos.id = comments.photo_id
JOIN users ON users.id = comments.user_id AND users.id = photos.user_id
WHERE comments.user_id = photos.user_id;
-- try to visualize with an actual sample data and you will get the better idea
