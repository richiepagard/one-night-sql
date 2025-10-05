-- Insert data into 'users' table which created in the 'create_table.sql' --

-- Insert one data (if the file run just once) --
INSERT INTO users (username, email)
VALUES ('richie', 'richiepagard@gmail.com');

-- Insert more than one data to the 'users' table --
INSERT INTO users (username, email)
VALUES
	('jadi', 'jadijadi@gmail.com'),
	('rcseacord', 'rcseacord@gmail.com'),
	('bagder', 'daniel@haxx.se');


-- Select all rows to show the table --
SELECT * FROM users;
