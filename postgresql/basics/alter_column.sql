-- Change the age column from INT to VARCHAR(3)
ALTER TABLE users
ALTER COLUMN age TYPE VARCHAR(3);

-- Showing the table info
SELECT * FROM users;
