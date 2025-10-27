/* Single inner join */
SELECT * FROM games g
INNER JOIN screenshots s ON g.game_id = s.game_id
WHERE g.game_id = 13104;

SELECT * FROM games g
LEFT JOIN websites w ON w.game_id = g.game_id
WHERE g.NAME LIKE "%Final Fantasy%";


SELECT g.name title, g.summary, w.url website FROM websites w
RIGHT JOIN games g ON g.game_id = w.game_id
WHERE g.NAME LIKE "%Final Fantasy%";