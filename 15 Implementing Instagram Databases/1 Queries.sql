=> Frist create a database with any name then for tables:
CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
	username VARCHAR(30) NOT NULL, -- compulsary filed
	bio VARCHAR(400), -- optional field
	avatar VARCHAR(200),
	phone VARCHAR(25), -- since we won't perform any operation on phone number like adding or subtracting so we usually put its type as string rather than number
	email VARCHAR(40),
	password VARCHAR(50),
	status VARCHAR(15),
	CHECK(COALESCE(phone, email) IS NOT NULL) -- COALESCE(phone, email) will make sure atleast phone or email is not null. ie either one of them must have a value(as user can use either way to sign up)
);

CREATE TABLE posts (
	id SERIAL PRIMARY KEY,
	created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
	url VARCHAR(200) NOT NULL,
	caption VARCHAR(240),
  -- lattitude and longitude is not manditory, however, if their value is provided then we will need their validation
	lat REAL CHECK(lat IS NULL OR (lat >= -90 AND lat <= 90)), -- a valid lattitude will be between -90 and +90
	lng REAL CHECK(lng IS NULL OR (lng >= -180 AND lng <= 180)), -- a valid longitude will be between -180 and +180
	user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE -- relation to user table. user_id of post table will refer to id column of users table. When a user with a particular user_id is deleted then ON DELETE CASCADE will delete all the posts assosicated with that user_id
);

CREATE TABLE comments (
	id SERIAL PRIMARY KEY,
	created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
	contents VARCHAR(240) NOT NULL,
  -- delete the commnet if associated user and post is deleted
	user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
	post_id INTEGER NOT NULL REFERENCES posts(id) ON DELETE CASCADE
);

-- for likes we will create a polymorphic association(Polymorphic association is a term used in discussions of Object-Relational Mapping with respect to the problem of representing in the relational database domain, a relationship from one class to multiple classes).
-- basically we will use this likes table to store like for both post and commnet.
CREATE TABLE likes (
	id SERIAL PRIMARY KEY,
	created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
	user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
	post_id INTEGER REFERENCES posts(id) ON DELETE CASCADE,
	comment_id INTEGER REFERENCES comments(id) ON DELETE CASCADE,
-- when we store like for post then the comment column of that row will be null and viceversa. There must be a value in either post_id or comment_id and not in both and one of them must be null.
	CHECK(
		COALESCE((post_id)::BOOLEAN::INTEGER, 0) -- if there is a value in post_id then (post_id)::BOOLEAN will give true and then true::INTEGER will give 1 as it converts boolean to integer and then COALESCE(1,0) will give 1. Similarly, if value of post_id is null then (post_id)::BOOLEAN will give false and then false::INTEGER will give 0 as it converts boolean to integer and then COALESCE(0,0) will give 0.
		+
		COALESCE((comment_id)::BOOLEAN::INTEGER, 0) -- similarly this will give either 0 or 1
    -- and at last we check if these two expression sum is equal to 1 or not ie checking for only one value either in post_id or commnet_id
		= 1
	),
	UNIQUE(user_id, post_id, comment_id)
);

CREATE TABLE photo_tags (
	id SERIAL PRIMARY KEY,
	created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
	user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
	post_id INTEGER NOT NULL REFERENCES posts(id) ON DELETE CASCADE,
	x INTEGER NOT NULL,
	y INTEGER NOT NULL,
  -- lets say you only want a user to be taged in a photo only one time, for this check for user_id and post_id uniqueness
	UNIQUE(user_id, post_id)
);

CREATE TABLE caption_tags (
	id SERIAL PRIMARY KEY,
	created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
	user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
	post_id INTEGER NOT NULL REFERENCES posts(id) ON DELETE CASCADE,
	UNIQUE(user_id, post_id)
);

CREATE TABLE hashtags (
	id SERIAL PRIMARY KEY,
	created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
	title VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE hashtags_posts (
	id SERIAL PRIMARY KEY,
	hashtag_id INTEGER NOT NULL REFERENCES hashtags(id) ON DELETE CASCADE,
	post_id INTEGER NOT NULL REFERENCES posts(id) ON DELETE CASCADE,
	UNIQUE(hashtag_id, post_id)
);

CREATE TABLE followers (
	id SERIAL PRIMARY KEY,
	created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
	leader_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE, -- the user who is being followed
	follower_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE, -- the user who is following
	UNIQUE(leader_id, follower_id) -- a user can be followed only one time by a user or there cann't be multiple followers for the same user
);