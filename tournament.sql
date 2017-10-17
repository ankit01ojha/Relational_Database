-- Dropping the database if exists , for a fresh start everytime the file is imported.
DROP DATABASE IF EXISTS tournament ;

--creating the database tournament.
CREATE DATABASE tournament ;

--Connecting to the database tournament.
\c tournament

-- Dropping all the tables , for a fresh start everytime the file is imported.
DROP TABLE IF EXISTS information ;
DROP TABLE IF EXISTS matches ;

--Dropping views if they exists.
DROP VIEW IF EXISTS score ;

--This table is for the player's information.
CREATE TABLE information (
            id serial PRIMARY KEY,
            name text
) ;

-- This table is for keeping the records of the matches played by a player.
CREATE TABLE matches (
            match_id integer PRIMARY KEY ,
            winner integer,
            loser integer
) ;

-- This creates a view which counts the wins of a player and the number of matches played by that player in the tournament.
CREATE view score AS
select player.id, player.name,
(select count(*) from matches where player.id=winner) as wins,
(select count(*) from matches where player.id in (winner,loser)) as matches_played
from player
group by player.id order by wins desc ;