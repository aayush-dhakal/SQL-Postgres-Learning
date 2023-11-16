* Group by user_id:
=> SELECT user_id FROM comments GROUP BY user_id;
-- this will group the rows according to the similar user_id so each group has one unique user_id and its row will be multiple datas with same user_id as group's user_id 
-- Note:  