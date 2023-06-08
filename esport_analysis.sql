/* 1. What are the names of the players whose salary is greater than 100,000? */
select player_name
from players
where salary > 100000;

/* 2. What is the team name of the player with player_id = 3? */
select p.player_id, p.player_name, t.team_name
from players p
join teams t using (team_id)
where p.player_id = 3;

/* 3. What is the total number of players in each team? */
select t.team_name, count(*) as total_players
from players p
join teams t using (team_id)
group by 1;

/* 4. What is the team name and captain name of the team with team_id = 2? */
select t.team_id, team_name, p.player_name as captain
from teams t
join players p on t.captain_id = p.player_id
where t.team_id = 2;

/* 5. What are the player names and their roles in the team with team_id = 1? */
select player_name, role
from players
where team_id = 1;

/* 6. What are the team names and the number of matches they have won? */
select t.team_name, count(*) as matches_won
from matches m
join teams t on m.winner_id = t.team_id
group by 1;

/* 7. What is the average salary of players in the teams with country 'USA'? */
select team_name, round(avg(salary),2) as avg_salary
from players p
join teams t using(team_id)
where t.country = "USA"
group by 1;

/* 8. Which team won the most matches? */ 
select t.team_name, count(*) as matches_won
from matches m
join teams t on m.winner_id = t.team_id
group by 1 order by 2 desc
limit 1;

/* 9. What are the team names and the number of players in each team whose salary is greater than 100,000? */
select team_name, count(*) as players_count
from players p
join teams t using(team_id)
where salary > 100000
group by 1;

/* 10. What is the date and the score of the match with match_id = 3? */
select match_date, score_team1, score_team2
from matches
where match_id = 3;