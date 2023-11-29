CREATE DATABASE nfl;

USE nfl;

DROP TABLE IF EXISTS superbowls;
CREATE TABLE superbowls ( 
	game_date varchar(50) DEFAULT NULL,
    superbowl_title varchar(50) DEFAULT NULL,
    winner varchar(50) DEFAULT NULL,
    winner_points tinyint DEFAULT '0',
    loser varchar(50) DEFAULT NULL,
    loser_points tinyint DEFAULT '0',
    mvp varchar(50) DEFAULT NULL,
    stadium varchar(50) DEFAULT NULL,
    city varchar(50) DEFAULT NULL,
    state varchar(50) DEFAULT NULL
);

# Because MySQL server running with --secure-file-priv, superbowl.csv uploaded to ProgramData/MySQL/MySQL Server 8.1/Uploads
LOAD DATA INFILE '../Uploads/superbowl.csv'
INTO TABLE superbowls
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

SET SQL_SAFE_UPDATES=0;
UPDATE superbowls SET game_date = str_to_date( game_date, '%m/%d/%Y')
