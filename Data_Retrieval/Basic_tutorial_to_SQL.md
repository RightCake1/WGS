I am using Linux and MySQL

# Installation
```bash
sudo apt install mysql-server -y # install
```
```bash
sudo systemctl status mysql # check status
```
```bash
sudo mysql # start MySQL
```

# SQL Basics
- Use `;` after completed commands.
- Use `,` when continuing or adding more.
- Use `()` for parentheses, e.g., adding rows, columns, and numbers.
- `int` - integer.
- `varchar` - variable character or strings.
- `describe` to show details about tables.
- Defining the table with columns and rows is defining the schema or how our database is arranged.
- Write strings in `""`.
- `insert into` inserts data into the specified table.
- `select` pulls data from tables.
- Use `*` wildcard to pull everything from the table.
- `asc` = ascending, `desc` = descending.
- `alter` to change a table that is already created.
- `boolean` = true/false (1 = true, 0 = false).

## Make a Database
```sql
show databases;
use db_name;
create database db_name;
use db_name;
```

## Make a Table in the Database
```sql
show tables;
create table table_name (
    id int,
    name varchar(299),
    age int
);
show tables;
describe table_name;
insert into table_name values (1, "name", 25);
```

## Pull Data from the Table
```sql
select * from table_name;
select name from table_name;
select * from table_name where column_name = value;
select * from table_name where column_name = value or column_name = another_value;
select id from table_name where age < 30;
select * from table_name where not column_name = value;
```

## Remove Data from the Table
```sql
delete from table_name where column_name = value;
```

## Update Data
```sql
update table_name set column_name = new_value where column_name = value;
```

## Sorting
```sql
select * from table_name order by column_name asc;
select * from table_name order by column_name desc;
```

## Alter Table
```sql
alter table table_name add new_column boolean;
```
