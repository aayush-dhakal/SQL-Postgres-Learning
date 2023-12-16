=>
CREATE INDEX ON users (username);
-- here we will be creating index for username for fast quering as index helps to locate data fast.
-- You can find the index inside table section in pg admin.
-- By default the table name will be users_username_idx ie tableName_columnName_idx
-- If you want to give your custom index name then put it between INDEX and ON:
=> CREATE INDEX mynewindexname ON users (username);

-- To delte an index:
=> 
DROP INDEX users_username_idx;
