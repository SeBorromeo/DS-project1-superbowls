# ds2002-project1-superbowls
Project 1 for DS2002. Creating a fact table and accompanying dimension tables for historical Super Bowl data

The Jupyter Notebook file Project-1.ipynb takes data from three distinct sources a few local CSV files, a MySQL table, and JSON objects returned by an API call and creates a Data Warehouse. The project creates a 
fact table containing each data from every Super Bowl in history including the teams playing, MVPs, ending score, date, stadium, and certain weather statistics from the day of the game. Teams, stadiums, and players
are all individual dimension tables and are referenced by a foreign key by the fact table. A date dimension is also used in the fact table but is generated using the provided code from class.

To get started with the project, the Super Bowl table had to be created first. To do this, a cCSVsv with the data, superbowl.csv, was used by SuperbowlsSQLCreation.sql to create a table locally in the database "nfl"
(NOTE: the data from this CSV could have been used directly in the same way the other CSV data was but for the purposes of the assignment, I converted it to a table to demonstrate querying and using data from a
relational database in Python).

The Notebook starts by first creating the DW. The players dimension tables was created by querying the specific column from the Super Bowl MySQL table and assigning each entry to a unique primary key. This process
wasn't exactly the same for stadiums, as both SQL data and CSV data were used combining the stadiums as listed in the Super Bowl data as well as today's current stadiums which are listed with their respective
NFL team in nfl_teams.csv. In addition, a geocoding API was used to include the latitude and longitude of each stadium in the dimension table. The teams dimension table was made from just using nfl_teams.csv. All
three were then loaded into the DW.

To create the fact table, which would list each Super Bowl, I used lookups and utilized the three new dimension tables placing foreign keys in the data over the MVP, stadium, winning team, and losing team.
A fourth dimension table was introduced as well, the date dimension, which then replaced the game_date column. Lastly, weather data was introduced using another API call to a service that returned various
statistics given a day and location. Of these statistics, the maximum and minimum temperature at 2m, the precipitation sum, and	the windspeed max at 10m were included in the fact table.
