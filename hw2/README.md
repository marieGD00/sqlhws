# Homework: Single Table Queries - Board Game Dataset

## Introduction

For this assignment you will be writing SQL and will be using a PostgreSQL server, which provides a standards-compliant SQL implementation.  
We are using version 10.6 of Postgres, so the documentation at https://www.postgresql.org/docs/10.6/static/ may be useful as well.

You will need access to a postgresql client that supports version 10 or later. On debian/ubuntu machines this is as simple as installing the PSQL client 
via:
`sudo apt install postgresql-client-common postgresql-client-10`

You will connect to Postgres to use a preloaded database using:

`psql -d boardgames -U dbstudent -h addison.cs.uchicago.edu`

when it asks you for the password use *dbrocks33*  
Note that you can add a password to avoid having to type in the password every time https://www.postgresql.org/docs/10.6/static/libpq-pgpass.html

psql should be installed on the csil machines(linux.cs.uchicago.edu) so you can use it from there.

Alternatively you can use OmniDB (or another SQL Gui) to connect. 

Database Name=boardgames
host = addison.cs.uchicago.edu
Database User = dbstudent

For this homework we will be using the database server addison.cs.uchicago.edu which is publicly accessible from anywhere.


## Dataset
We will use a slightly expanded database of the boardgames dataset.
This now includes attributes minplaytime and maxplaytime for the games relation.
In addition there is a categories relation and gamecat relation that maps games to categories.

Once connected, there are two kinds of commands useful to a database user. The first kind are the psql client meta-commands
and the second are SQL statements (which end in a ;).
The most important command is \?, which gives you help on meta-commands. There are two others you will find very useful.  

First, you can list the tables in the database with \dt

```
boardgames=> \dt
           List of relations
 Schema |    Name    | Type  |  Owner   
--------+------------+-------+----------
 public | categories | table | postgres
 public | desgame    | table | postgres
 public | designers  | table | postgres
 public | gamecat    | table | postgres
 public | games      | table | postgres
(5 rows)


```

Second, you can view the schema  of a given table with \d *table_name*

```
boardgames=> \d games
                         Table "public.games"
   Column    |          Type          | Collation | Nullable | Default
-------------+------------------------+-----------+----------+---------
 g_id        | integer                |           | not null |
 name        | character varying(100) |           | not null |
 avgscore    | numeric(7,6)           |           |          |
 numvotes    | numeric(6,1)           |           |          |
 minplayers  | smallint               |           |          |
 maxplayers  | smallint               |           |          |
 minplaytime | smallint               |           |          |
 maxplaytime | smallint               |           |          |
Indexes:
    "games_pkey" PRIMARY KEY, btree (g_id)
Referenced by:
    TABLE "desgame" CONSTRAINT "desgame_g_id_fkey" FOREIGN KEY (g_id) REFERENCES games(g_id)
    TABLE "gamecat" CONSTRAINT "gamecat_g_id_fkey" FOREIGN KEY (g_id) REFERENCES games(g_id)
```

The second class of useful commands are SQL commands. All SQL queries in PostgreSQL must be terminated with a semi-colon.
For example, to get a list of 10 records in the `games` table, you would type:

`SELECT * FROM games LIMIT 10;`

This query  requests a max 10 rows from the table. Using **LIMIT**  in this manner one can explore the data small bits at a time. If you really wanted to produce all the records, though, the query is:

`SELECT * FROM games;`

You can use Ctrl+C to end a query that is taking too long (it is very possible to write such bad queries even unintentionally).
Note that using the LIMIT keyword by itself offers no guarantee on which 10 rows from the result are
returned, so do not assume an ordering. \\

Finally, you can change the way psql displays the result sets to suit you better.
In particular, wrapped lines in `less` can make the output of wide tables hard to read. If this bothers you, you can try exiting the client
(you can use Ctrl+D) and starting it again with the LESS  env. variable set like this:

` LESS='-S' psql`



### Notes

If you are trying to add a predicate for a character attribute, you must wrap the value in a single quote (e.g name = 'Bob').


## Autograder
To allow you quickly debug your SQL statements we will provide an autograder on gradescope that will let you enter your answer and compare this against our expected right answer. **If your schema is not what
we expect then it will not compare results.** If your answer is identical it will let you know. If you answer is partially right the comments give some hints and in some cases it will give you a sample record you missed or a sample record in your result that we are not expecting. The autograder is not perfect so if you are confident in your result and it does not think so let us know!

The output messages are not the best (blame Aaron). For example on prob 1 in the homework if you give `select name from games where avgscore > 6` you will get the following output, which is trying to tell you that your answer is different than ours as your records are wrong and it thinks you 96 more records than the answer does.

```
Autograder thinks:
SQL Result Comparison [TooManyRecords quantity=96]
SQL Result Comparison [RecordsWrong]
Your SQL: select name from games where avgscore > 6
```



### Submission

You have to submit 1 file for each item in a problem:  your query in SQL
(the file extension should be .sql).

For example, let’s assume that there is a problem 0 and item a, which
asks you to find the distinct names of 10 games. You have to create the following file named 0a.sql:

Contents:

`select distinct name from games limit 10;`

All the .sql  files for your answers are already creates, so you just need to insert your answers.
*No output is needed*


## Problems
Schemas for output as provided in parentheses. *Note that all SQL must run as a single SQL statement (eg no temp tables).*

### 1
What is the name of the game with an avgscore of 6.226650 (given as name)

### 2
What are the names of games that either have (a) an avgscore >7.3 and < 7.6 or (b) have maxplayers = 9

### 3
What is the highest and lowest avgscore among all games (given as max,min)

### 4
What is the mean (eg average) avgscore, broken down by maxplayers (hint group by), sorted by maxplayers ascending (given as avg, maxplayers)?

### 5
For the above query, only show results where the mean avgscore (eg avg) is above 6, still sorted by maxplayers ascending (given as avg, maxplayers)

### 6
What is the mean (eg average) avgscore, broken down by maxplayers (hint group by) only considering games that have a maxplaytime < 100, sorted by maxplayers ascending (given as avg, maxplayers)?

### 7
What are the names and avgscore of the 10 highest rated games (avgscore) by avgscore in descending order (given as name, avgscore)







