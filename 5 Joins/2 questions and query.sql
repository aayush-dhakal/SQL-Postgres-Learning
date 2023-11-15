* Show the content of the comments and the username of the user who wrote it: 
=> SELECT contents,username 
    FROM comments 
    JOIN users ON users.id = comments.user_id;
// we use JOIN when we want to access data from multiple tables. First, FROM comments is executed which selects the comments table then JOIN is performed which sort of creates a virtual table by joining all columns of these tables then SELECT is executed which take the relevant coloums defined for it
=> SELECT * FROM comments 
   JOIN users ON users.id = comments.user_id;
// this gets all the coloums from comments and based on its user_id it matches it with user table's id and prints the row value correctly(ie accuratley give user info who created the comment for eg. in comment if user_id is 2 then it looks up for user with id 2 and fills in the row value with username whose id is 2).
// '

// There is one thing to note though. This * prints every coloum of commnets and users table so there will be two id column one from comments table and other from users table. So if you do 
- SELECT id FROM comments 
  JOIN users ON users.id = comments.user_id;
// this will give ambiguous error as it cannot decide which table id it should print.
# If you want to get the id of comments table only then you have to specify the table name too like this:
=> SELECT comments.id
   FROM comments
   JOIN users ON users.id = comments.user_id;

// you can also give custom name to the id like:
=> SELECT comments.id AS comment_id, users.id as user_id
   FROM comments
   JOIN users ON users.id = comments.user_id;
// when you select two table id like this then the column name will be distinct(without as custom_name both columns will be named as id)

// you can also give custom short name to tables and use that alias like:
=> SELECT c.id AS comment_id, users.id as user_id
   FROM comments AS c
   JOIN users ON users.id = c.user_id;
// as is optional so you can also write
=> SELECT c.id AS comment_id, users.id as user_id
   FROM comments c
   JOIN users ON users.id = c.user_id;

// Note you can join the tables in any order if you only wish to do the INNER or simple JOIN:
=> SELECT comments.id AS comment_id
   FROM users
   JOIN comments ON users.id = comments.user_id;
// in some case the order of coloums will give different result according to the order of joining tables especially if there are null values in foreign keys or if JOIN condition is not matched. You can difference in left, outer and full joins


* For each comment, list the contents of the comment and the URL of the photo the comment was added to:
=> SELECT contents, url
    FROM comments JOIN photos ON comments.photo_id = photos.id;
