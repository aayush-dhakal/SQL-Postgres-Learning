-- Create a sample table:
=>
CREATE TABLE accounts (
  id SERIAL PRIMARY KEY,
  name VARCHAR(20) NOT NULL,
  balance INTEGER NOT NULL
);

-- insert sample data:
=>
INSERT INTO accounts (name, balance) 
VALUES 
 ('Gia', 100)
 ('Alyson', 100);

-- view table:
=>
SELECT * FROM accounts;

-- To start transaction use begin:
=>
BEGIN 
-- this will create sort of like a seperate individual environment which is detached with other connections

-- now if you update you table like:
=> 
UPDATE accounts
SET balance = balance - 50
WHERE name = 'Alyson';

-- and then view the data:
=>
SELECT * FROM accounts;
-- you will now see the updated data. But this is only for this transaction as if you open the new query tool and run this SELECT statement then you will not see the updated data as we have not closed this transaction.

-- To make the changes permanent in the table run commit:
=>
COMMIT;
-- with this now every other connection will be able to see the changes

-- If your connection to the ongoing transcation is disconnected then there will be no changes in the table and that transaction is automatically deleted on rollbacked.

-- Also, if there is an error in query at any point like:
=>
SELECT * from asdsafdsaf; -- non existing table
-- such error will halt the transcation and show this error: current transaction is aborted
-- In this case, you have to manually end the transaction by using rollback:
=>
ROLLBACK;
