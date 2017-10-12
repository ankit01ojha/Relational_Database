-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

CREATE TABLE information (
            id serial,
            name text
) ;

CREATE TABLE score_table (
            id serial,
            name text,
            wins integer,
            matches integer,
            score integer

) ;

