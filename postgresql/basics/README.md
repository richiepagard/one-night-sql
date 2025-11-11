# SQL (PostgreSQL) Basics
Basic SQL commands over the **PostgreSQL** database to study them at first and show how, when, and why use them.

## Create Table

#### Database Connection
To creating a table in a database, first needs to connect to a database, I'm using a database with name `study` here and I'm running the scripts exactly like I mentioned in the `README.md` file:

```
sudo -u <username> psql -d <db-name> -f <file-name.sql>
```

I write the SQL codes in all capital letters for a cleaner code structure.
To create a new table with name `users` in a database (e.g. `study`):
```sql
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)
```

#### Code Explanation
- `CREATE TABLE`: For creating a new table.
- `users`:  The table name will created.
- `id SERIAL PRIMARY KEY`: Creating new column to give each user an unique ID which is using `PRIMARY KEY` field type including `SERIAL` to give each created user an ID automatically, no need to give user's ID dynamically.
- `username VARCHAR(50) NOT NULL`: Creating a new column to give user's a username, it's not unique, but it is required because I used `NOT NULL` here, the `VARCHAR(50)` means this column value cannot be more than `50` letters.
- `email VARCHAR(100)`: Same as `username` field but with `100` maximum letters and this column could be empty because it does not have any `NOT NULL` option.
- `created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP`: To save the date-time of when user created, it's using default value which is a current time(`DEFAULT CURRENT_TIMESTAMP`).

---

## Insert Data To The Table

Needs `INSERT INTO`  statement to inserting data into a table.
The structure is something like this
```sql
INSERT INTO <table-name> (<column-name>, <column-name>, ...)
VALUES
	('value of column-1', 'value of column-2', ...),
	('value of column-1', 'value of column-2', ...);
```

#### Inserting One Row Data
Following SQL code will insert one row data into the `users` table.
```sql
INSERT INTO users (username, email)
VALUES ('richie', 'richiepagard@gmail.com')
```
If see the following message on the terminal:
`INSERT 0 1`  means that one row was inserted.

#### Inserting Multiple Rows
Following SQL command will insert multiple data into the `users` table.
```sql
INSERT INTO users (username, email)
VALUES
	('richie', 'richiepagard@gmail.com'),
	('jadi', 'jadijadi@gmail.com'),
	('rcseacord', 'rcseacord@gmail.com'),
	('bagder', 'daniel@haxx.se');
```

#### Displaying The Table
To display the table after added some data to it, needs to run the following SQL command:
```sql
SELECT * FROM users;
```

---

## Fetching Data From The Table
To retrieve data from a database, use the `SELECT` statement.
The structures is something like this:
```postgresql
SELECT <column-name>, <column-name> FROM <table-name>;
SELECT * FROM <table-name>;
```

#### Specify Columns
By specifying the column names, we can choose which columns to select.
Following SQL command shows how to select the chosen columns from the `users` table:
```postgresql
SELECT username, email FROM users;
```
It will return all the data inside the `users` table from the `username` and `email` fields.

#### All Columns
Specify a `*` instead of the column names to select all columns.
The following SQL command shows how to return all columns from the `users` table:
```postgresql
SELECT * FROM users;
```

---


## Adding Column To A Table
To add a column to an existing table, we have to use the `ALTER TABLE` statement.
The `ALTER TABLE` statement is used to **add**, **delete**, or **modify columns** in an existing table.
Now, I want to add a column named `age` to our `users` table.
When adding columns we must also **specify the data type** of the column. The `age` column will be an `integer` for now, and we specify `integer` types with the `INT` keyword.
The structure of the `ALTER TABLE` is something like this for adding a new column to a table:
```postgresql
ALTER TABLE <table-name>
ADD <new-column-name> <data-type>;
```

Now, lets add `age` column to the `users` table with the `INT` data type:
```postgresql
ALTER TABLE users
ADD age INT;
```

---

## Update, Modifying An Existing Value

To updating a value's column we should first know this that this value and the column are exist.
For updating (modifying) a value's column we should use `UPDATE` statement.
The `UPDATE` statement use to modify a value field and it uses under the certain table.
The structure of the `UPDATE` for modifying a value is this:
```postgresql
UPDATE <table-name>
SET <column-name> = <new-value>
WHERE <column-name> = <existing-value>;
```

Now, let's modify all users with **richie** username by updating `age` column to a value like `22`:
```postgresql
UPDATE users
SET age = 22
WHERE username = 'richie';
```

---

## Alter Column
This is actually the `ALTER TABLE` statement which apply on a column.
To change the data type or the size of a table column we must use the `ALTER TABLE` statement.
The `ALTER TABLE` statement is used to **add**, **delete**, or **modify** columns in an existing table.
The `ALTER TABLE` statement is also used to **add** and **drop** various constraints on an existing table.
The structure of the `ALTER TABLE` statement to modify a column in a way that change the column's data type is this:
```postgresql
ALTER TABLE <table-name>
ALTER COLUMN <column-name> TYPE <data-type>;
```

Well, now I want to change the data type of the `age` column in the `users` table from `INT` to `VARCHAR(3)`:
```postgresql
ALTER TABLE users
ALTER COLUMN age TYPE VARCHAR(3);
```
