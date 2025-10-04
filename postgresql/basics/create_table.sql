-- Drop the table if it is already exists --
DROP TABLE IF EXISTS users;

-- Table creation for users --
CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	username VARCHAR(50) NOT NULL,
	email VARCHAR(100),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Select all rows to see the table
SELECT * FROM users;
