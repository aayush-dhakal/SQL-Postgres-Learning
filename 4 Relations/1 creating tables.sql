# User table
CREATE TABLE users (
  id SERIAL PRIMARY KEY, -- serial keyword auto generated id. Primary key helps sql to optimize performance
  username VARCHAR(50)
);

INSERT INTO users (username)
VALUES
	('monahan93'), -- we donot provide id as it is auto generated
  ('pferrer'),
  ('si93onis'),
  ('99stroman');

SELECT * FROM users;

# Post table
CREATE TABLE photos (
  id SERIAL PRIMARY KEY,
  url VARCHAR(200),
  user_id INTEGER REFERENCES users(id) -- user_id column of photos table will reference to the id column of user which will be treated as foreign key
  -- if you want photos to also be deleted when its referencing user is deleted then use cascade like
  - user_id INTEGER REFERENCES users(id) ON DELETE CASCADE
  -- if you want to set value to NULL for delted user then
  - user_id INTEGER REFERENCES users(id) ON DELETE SET NULL
  -- you can also set some default value for delted user
);

INSERT INTO photos (url, user_id)
VALUES
	('http:--two.jpg', 1), -- if we provide user_id that does not exist then we will get an error so data consistency is maintained
  ('http:--25.jpg', 1),
  ('http:--j.jpg', NULL), -- when we dont want to reference the photo with any user then you can use NULL which means no value so SQL will not an error in this case
  ('http:--36.jpg', 1),
  ('http:--754.jpg', 2),
  ('http:--35.jpg', 3),
  ('http:--256.jpg', 4);

SELECT * FROM photos;

SELECT * FROM photos 
WHERE user_id = 4;

SELECT url, username FROM photos
JOIN users ON users.id = photos.user_id;