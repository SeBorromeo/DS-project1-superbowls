USE nfl_dw;

SELECT player_name, COUNT(player_name) AS number_of_superbowl_mvps, COUNT(DISTINCT team_name) AS number_of_teams_won_mvp_with
FROM fact_superbowls
JOIN dim_players 
	ON fact_superbowls.player_key = dim_players.player_key
JOIN dim_teams
	ON fact_superbowls.winning_team_key = dim_teams.team_key
GROUP BY player_name
ORDER BY number_of_superbowl_mvps DESC
