-- 1a
SELECT *
FROM Game
ORDER BY time DESC
;
-- 1b
SELECT *
FROM Game
WHERE time LIKE '%2020-10-23%'
OR time LIKE '%2020-10-22%'
OR time LIKE '%2020-10-21%'
OR time LIKE '%2020-10-20%'
OR time LIKE '%2020-10-19%'
OR time LIKE '%2020-10-18%'
OR time LIKE '%2020-10-17%'
;
-- 1c
SELECT *
FROM Player
WHERE name IS NOT NULL
;
-- 1d
SELECT playerID
FROM PlayerGame
WHERE score > 2000
;
-- 1e
SELECT *
FROM Player
WHERE emailAddress LIKE '%@gmail%'
;
------------------------------------------------------------------
--2a
SELECT score
FROM Player, PlayerGame
WHERE Player.ID = PlayerGame.playerID
AND Player.name = 'The King'
ORDER BY score DESC
;
-- 2b
SELECT name
FROM Player, PlayerGame
WHERE PlayerGame.playerID = Player.ID
AND score = ( 
	SELECT max(score)
	FROM PlayerGame, Game
	WHERE time = '2006-06-28 13:20:00'
	AND PlayerGame.gameID = Game.ID)
;
-- 2c
-- The clause looks at 2 players with identical usernames, and determines the name of
    -- the one that was entered into the table first (i.e. has the lesser ID assuming
    -- they were entered sequentially)

-- 2d
-- When you're trying to find all the names of subparts of some part, it's possible
    -- some subparts can have subparts themselves, so you'd need to merge tables