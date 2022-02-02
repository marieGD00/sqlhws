# Homework: Queries II - Board Game Dataset

## Introduction

For this assignment you will be writing SQL and will be using a PostgreSQL server, and will continue using the same dataset and database from HW2 (see prior instructions for details on connecting and schema).

## Autograder
To allow you quickly debug your SQL statements we will provide a web interface to our autograder that will let you enter your answer and compare this against our expected right answer. If your schema is not what
we expect then it will not compare results. If your answer is identical it will let you know. If you answer is partially right the comments give some hints and in some cases it will give you a sample record you missed or a sample record in your result that we are not expecting. The autograder is not perfect so if you are confident in your result and it does not think so let us know!


### Submission

You have to submit 1 file for each item in a problem:  your query in SQL
(the file extension should be .sql).

For example, let’s assume that there is a problem 0 and item a, which
asks you to find the distinct names of all departments. You have to create the following file named 0a.sql:

Contents:

`select distinct name from games limit 10;`

All the .sql  files for your answers are already creates, so you just need to insert your answers.
*No output is needed*


## Problems
Schemas for output as provided in parentheses. *Note that all SQL must run as a single SQL statement (eg no temp tables).*

### 1
 Find games whose name contains the word *edition* with either uppercase or lowercase 'e'. (given as name)

### 2
Find the 10 longest game titles (by characters)  that allow for between 3 and 5 players inclusive (e.g. games that need at minimum 3 people to play (minplayers) and support a maximum of 5 players (maxplayers)) . (given as name, namelen)

Hint: See https://www.postgresql.org/docs/10/functions-string.html 

### 3
Find the category id and count of games in the category, for categories that have at least 15 games in them. (given as c_id, cnt)

### 4
Find the category name of the most 5 popular categories, where popularity is defined as the highest average(e.g. mean) of avgscore for all  games in the category (given as category, avg). Order the categories by average (e.g. mean) of avgscore descending, followed by category name ascending. Avgscore is an attribute of games that indicates what the game’s score is (where the values contributing to this come from users and are not included in the dataset).

### 5
Extend the query for problem 4 to only show categories that have at least 15 games in them. (given as category, avg). Maintain the same sort order.

### 6
For all groupings of minplayers and maxplayers (e.g.  group by minplayers,maxplayers) show the minimum number of hours and maximum **number of hours** sorted minplayers and then maxplayers (ascending for both). *Note that min/maxplaytime is given in minutes*. Do not round or truncate hours. (given as minhours,maxhours,minplayers,maxplayers)

### 7
For each category show the designer that has the longest possible game as max (maxplaytime) -- considering only the games that have designers associated with them (e.g. you can omit games that have no designer).

Subsequently, only consider categories that have at least one designer associated with its respective games (e.g. 'if no designer exists for any game in a category, then omit the category' or alternatively 'if there does not exist any game in this category with a designer, then ignore the category').
In case of a tie for the longest game and/or if a game has multiple designers, show all designers. Do not show the same designer multiple times per category. 

The final output relation should given as (designer,category,max)  and sorted by category descending, designer ascending

Two categories  from my expected answer to pay attention to or hopefully help guide you 

```
  Matt Leacock        | Word Game                 |   0
```

```
  Francesco Nepitello | Novel-based               | 240
  Marco Maggi         | Novel-based               | 240
  Roberto Di Meglio   | Novel-based               | 240
```








