SELECT nameFirst, nameLast FROM people p 
INNER JOIN halloffame h ON p.playerID = h.playerID 
WHERE h.yearid = "2017"; 

SELECT nameFirst, nameLast FROM people p
INNER JOIN fielding f ON f.playerID = p.playerId
WHERE f.POS = "1B" AND f.teamID="PIT" AND f.yearID="2012";

SELECT * FROM batting b
LEFT JOIN allstarfull a ON a.yearID = b.yearID AND a.playerID = b.playerID
WHERE b.teamID = "PIT" AND b.yearID = "2015" AND b.G >= 100;

SELECT gameID, GP,p.* FROM allstarfull a
RIGHT JOIN pitching p ON p.yearID = a.yearID AND p.playerID = a.playerID
WHERE p.teamID = "PIT" AND p.yearID = "2015" AND p.W >= 7;

SELECT DISTINCT p.playerID, schoolID FROM pitching p
LEFT JOIN collegeplaying c ON c.playerID = p.playerID
WHERE p.teamID = "BOS" AND p.yearID = "2018" AND p.playerID LIKE "%01";

SELECT p.playerID, p.nameFirst, p.nameLast, b.yearID, m.yearID FROM people p
INNER JOIN batting b ON b.playerID = p.playerID
INNER JOIN managers m ON m.playerID = p.playerID
WHERE b.yearID > 2010 AND m.yearID = 2019;