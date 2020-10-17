--
-- This SQL script builds a monopoly database, deleting any pre-existing version.
--
-- @author kvlinden
-- @version Summer, 2015
--

-- Drop previous versions of the tables if they they exist, in reverse order of foreign keys.
DROP TABLE IF EXISTS PlayerGame;
DROP TABLE IF EXISTS Game;
DROP TABLE IF EXISTS Player;
DROP TABLE IF EXISTS PropertyTypes;
DROP TABLE IF EXISTS OwnedProperties;

-- Create the schema.
CREATE TABLE Game (
	ID integer PRIMARY KEY, 
	time timestamp
	);

CREATE TABLE Player (
	ID integer PRIMARY KEY, 
	emailAddress varchar(50) NOT NULL,
	name varchar(50)
	);

CREATE TABLE PlayerGame (
	gameID integer REFERENCES Game(ID), 
	playerID integer REFERENCES Player(ID),
	--score integer,
	cash integer,
	currentLocation varchar(20) -- Space name
	);

CREATE TABLE PropertyTypes (
	ID integer PRIMARY KEY,
	propName varchar(10) -- Commonly "House" or "Hotel"
	);

CREATE TABLE OwnedProperties ( --locationName and gameID provide unique rows
	gameID integer REFERENCES Game(ID),
	ownerID integer REFERENCES Player(ID),
	quantity integer,
	propertyTypeID integer REFERENCES PropertyTypes(ID),
	locationName varchar(30)
	);

-- Allow users to select data from the tables.
GRANT SELECT ON Game TO PUBLIC;
GRANT SELECT ON Player TO PUBLIC;
GRANT SELECT ON PlayerGame TO PUBLIC;
GRANT SELECT ON PropertyTypes TO PUBLIC;
GRANT SELECT ON OwnedProperties TO PUBLIC;
-- Add sample records.
INSERT INTO Game VALUES (1, '2006-06-27 08:00:00');
INSERT INTO Game VALUES (2, '2006-06-28 13:20:00');
INSERT INTO Game VALUES (3, '2006-06-29 18:41:00');

INSERT INTO Player(ID, emailAddress) VALUES (1, 'me@calvin.edu');
INSERT INTO Player VALUES (2, 'king@gmail.edu', 'The King');
INSERT INTO Player VALUES (3, 'dog@gmail.edu', 'Dogbreath');

INSERT INTO PlayerGame VALUES (1, 1, 0.00, 'ParkPlace');
INSERT INTO PlayerGame VALUES (1, 2, 0.00, 'Jail');
INSERT INTO PlayerGame VALUES (1, 3, 2350.00, 'CommunityChest1');
INSERT INTO PlayerGame VALUES (2, 1, 1000.00,'BalticAvenue');
INSERT INTO PlayerGame VALUES (2, 2, 0.00,'VermontAvenue');
INSERT INTO PlayerGame VALUES (2, 3, 500.00, 'IllinoisAvenue');
INSERT INTO PlayerGame VALUES (3, 2, 0.00, 'St.JamesPlace');
INSERT INTO PlayerGame VALUES (3, 3, 5500.00, 'NorthCarolinaAvenue');

--These probably wouldn't change unless you changed game versions
INSERT INTO PropertyTypes VALUES (1,'House');
INSERT INTO PropertyTypes VALUES (2,'Hotel');

INSERT INTO OwnedProperties VALUES (1,2,2,1,'Boardwalk'); -- in game 1, player 2 owns 2 houses on Boardwalk
INSERT INTO OwnedProperties VALUES (1,2,3,1,'MarvinGardens'); -- in game 1, player 2 owns 3 houses on Marvin Gardens
INSERT INTO OwnedProperties VALUES (1,3,1,2,'ReadingRailroad'); -- in game 1, player 3 owns 1 hotel on Reading Railroad