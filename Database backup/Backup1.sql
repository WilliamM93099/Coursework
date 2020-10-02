--
-- File generated with SQLiteStudio v3.0.7 on Fri Oct 2 15:15:37 2020
--
-- Text encoding used: windows-1252
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Accounts
CREATE TABLE Accounts (AccountID INTEGER PRIMARY KEY NOT NULL, Username STRING UNIQUE NOT NULL, Password STRING CONSTRAINT passwordLength CHECK (length(password) > 7) NOT NULL, Admin BOOLEAN NOT NULL);
INSERT INTO Accounts (AccountID, Username, Password, Admin) VALUES (1, 'whoIsElla', 'YOuthfulC', 0);
INSERT INTO Accounts (AccountID, Username, Password, Admin) VALUES (2, 'DyaSuki', 'Willspassword', 1);
INSERT INTO Accounts (AccountID, Username, Password, Admin) VALUES (3, 'Blexie', 'Roscoe13', 1);
INSERT INTO Accounts (AccountID, Username, Password, Admin) VALUES (4, 'Bigpower2012', 'TinyDclub', 0);
INSERT INTO Accounts (AccountID, Username, Password, Admin) VALUES (5, 'Tacedaemo', 'Howdyman', 0);
INSERT INTO Accounts (AccountID, Username, Password, Admin) VALUES (6, 'BillboMC', 'brawlStars6', 1);

-- Table: Compositions
CREATE TABLE Compositions (CharacterID INTEGER NOT NULL REFERENCES Characters (CharacterID) ON DELETE CASCADE ON UPDATE CASCADE, TeamID INTEGER REFERENCES Teams (TeamsID) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL, PRIMARY KEY (CharacterID, TeamID));

-- Table: SavedComps
CREATE TABLE SavedComps (AccountID INTEGER REFERENCES Accounts (AccountID) NOT NULL UNIQUE, TeamID INTEGER REFERENCES Characters ON DELETE CASCADE ON UPDATE CASCADE NOT NULL UNIQUE, PRIMARY KEY (AccountID, TeamID));

-- Table: Teams
CREATE TABLE Teams (TeamsID INTEGER PRIMARY KEY NOT NULL, CharacterID1 INTEGER REFERENCES Characters (CharacterID) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL, CharacterID2 INTEGER REFERENCES Characters (CharacterID) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL, CharacterID3 INTEGER REFERENCES Characters (CharacterID) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL, CharacterID4 INTEGER REFERENCES Characters (CharacterID) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL, CharacterID5 INTEGER NOT NULL REFERENCES Characters (CharacterID) ON DELETE CASCADE ON UPDATE CASCADE);

-- Table: Characters
CREATE TABLE Characters (CharacterID INTEGER PRIMARY KEY ASC AUTOINCREMENT NOT NULL, CharacterName STRING NOT NULL UNIQUE, Health INTEGER NOT NULL CONSTRAINT "Health ammount" CHECK (Health > 0), DPS INTEGER NOT NULL CONSTRAINT "DPS ammount" CHECK (DPS > 0), Speed INTEGER NOT NULL CONSTRAINT "speed ammount" CHECK (SPeed > 0), Difficulty INTEGER NOT NULL CONSTRAINT "Difficulty ammount" CHECK (6 > Difficulty > 0), AverageCooldown DOUBLE CONSTRAINT "cooldown ammount" CHECK (AverageCooldown > 0) NOT NULL, Winrate DOUBLE CONSTRAINT "Winrate ammount" CHECK (100 > winrate > 0) NOT NULL, Class CHAR NOT NULL, RotationStatus BOOLEAN);
INSERT INTO Characters (CharacterID, CharacterName, Health, DPS, Speed, Difficulty, AverageCooldown, Winrate, Class, RotationStatus) VALUES (1, 'Torvald', 5000, 200, 20, 3, 2.5, 52.3, 'T', NULL);
INSERT INTO Characters (CharacterID, CharacterName, Health, DPS, Speed, Difficulty, AverageCooldown, Winrate, Class, RotationStatus) VALUES (2, '3ptglw
2qs', 2196, 1249, 321, 3, 1, 50, 'T', 0);
INSERT INTO Characters (CharacterID, CharacterName, Health, DPS, Speed, Difficulty, AverageCooldown, Winrate, Class, RotationStatus) VALUES (3, 'h6lqobqn', 2314, 489, 318, 1, 4, 50, 'F', 0);
INSERT INTO Characters (CharacterID, CharacterName, Health, DPS, Speed, Difficulty, AverageCooldown, Winrate, Class, RotationStatus) VALUES (4, 'qs8	9e', 2417, 1755, 316, 3, 1, 50, 'T', 0);
INSERT INTO Characters (CharacterID, CharacterName, Health, DPS, Speed, Difficulty, AverageCooldown, Winrate, Class, RotationStatus) VALUES (5, 'd3eovv5ls', 2647, 750, 352, 3, 8, 50, 'D', 1);
INSERT INTO Characters (CharacterID, CharacterName, Health, DPS, Speed, Difficulty, AverageCooldown, Winrate, Class, RotationStatus) VALUES (6, 'rgjix2q', 2640, 567, 312, 2, 9, 50, 'D', 1);
INSERT INTO Characters (CharacterID, CharacterName, Health, DPS, Speed, Difficulty, AverageCooldown, Winrate, Class, RotationStatus) VALUES (7, '0	a83', 2090, 716, 396, 3, 9, 50, 'T', 0);
INSERT INTO Characters (CharacterID, CharacterName, Health, DPS, Speed, Difficulty, AverageCooldown, Winrate, Class, RotationStatus) VALUES (8, 'idxmet ', 2821, 949, 357, 5, 4, 50, 'F', 0);
INSERT INTO Characters (CharacterID, CharacterName, Health, DPS, Speed, Difficulty, AverageCooldown, Winrate, Class, RotationStatus) VALUES (9, '6ie3w ', 2721, 1888, 307, 3, 8, 50, 'S', 0);
INSERT INTO Characters (CharacterID, CharacterName, Health, DPS, Speed, Difficulty, AverageCooldown, Winrate, Class, RotationStatus) VALUES (10, 'ms6 ', 2667, 250, 355, 5, 9, 50, 'T', 1);
INSERT INTO Characters (CharacterID, CharacterName, Health, DPS, Speed, Difficulty, AverageCooldown, Winrate, Class, RotationStatus) VALUES (11, '9jby', 2953, 540, 305, 2, 3, 50, 'T', 0);
INSERT INTO Characters (CharacterID, CharacterName, Health, DPS, Speed, Difficulty, AverageCooldown, Winrate, Class, RotationStatus) VALUES (12, 'cjnau	8rv', 2956, 429, 351, 3, 10, 50, 'T', 1);
INSERT INTO Characters (CharacterID, CharacterName, Health, DPS, Speed, Difficulty, AverageCooldown, Winrate, Class, RotationStatus) VALUES (13, 't5duh', 1879, 1036, 385, 3, 7, 50, 'T', 1);
INSERT INTO Characters (CharacterID, CharacterName, Health, DPS, Speed, Difficulty, AverageCooldown, Winrate, Class, RotationStatus) VALUES (14, '6cw	', 2005, 1209, 359, 5, 1, 50, 'T', 0);
INSERT INTO Characters (CharacterID, CharacterName, Health, DPS, Speed, Difficulty, AverageCooldown, Winrate, Class, RotationStatus) VALUES (15, 'oolc', 2967, 1773, 321, 5, 6, 50, 'T', 1);
INSERT INTO Characters (CharacterID, CharacterName, Health, DPS, Speed, Difficulty, AverageCooldown, Winrate, Class, RotationStatus) VALUES (16, ' k7m5ljvji', 2936, 948, 310, 3, 1, 50, 'T', 1);
INSERT INTO Characters (CharacterID, CharacterName, Health, DPS, Speed, Difficulty, AverageCooldown, Winrate, Class, RotationStatus) VALUES (17, '3y2o', 2329, 1611, 371, 4, 6, 50, 'D', 0);
INSERT INTO Characters (CharacterID, CharacterName, Health, DPS, Speed, Difficulty, AverageCooldown, Winrate, Class, RotationStatus) VALUES (18, 'fp8xtgz8', 2171, 1522, 324, 1, 8, 50, 'T', 0);
INSERT INTO Characters (CharacterID, CharacterName, Health, DPS, Speed, Difficulty, AverageCooldown, Winrate, Class, RotationStatus) VALUES (19, 'zo5sk0', 2379, 384, 360, 1, 8, 50, 'T', 0);
INSERT INTO Characters (CharacterID, CharacterName, Health, DPS, Speed, Difficulty, AverageCooldown, Winrate, Class, RotationStatus) VALUES (20, 'etdco', 1995, 262, 378, 4, 6, 50, 'T', 0);
INSERT INTO Characters (CharacterID, CharacterName, Health, DPS, Speed, Difficulty, AverageCooldown, Winrate, Class, RotationStatus) VALUES (21, 'fypg', 2526, 1514, 312, 2, 1, 50, 'T', 1);
INSERT INTO Characters (CharacterID, CharacterName, Health, DPS, Speed, Difficulty, AverageCooldown, Winrate, Class, RotationStatus) VALUES (22, 'e kyx50kh', 2699, 497, 393, 3, 9, 50, 'S', 1);
INSERT INTO Characters (CharacterID, CharacterName, Health, DPS, Speed, Difficulty, AverageCooldown, Winrate, Class, RotationStatus) VALUES (23, 'hrn14jwu', 2915, 368, 330, 3, 9, 50, 'T', 0);
INSERT INTO Characters (CharacterID, CharacterName, Health, DPS, Speed, Difficulty, AverageCooldown, Winrate, Class, RotationStatus) VALUES (24, 'f6fyk1	i0g', 2119, 653, 363, 2, 6, 50, 'F', 0);
INSERT INTO Characters (CharacterID, CharacterName, Health, DPS, Speed, Difficulty, AverageCooldown, Winrate, Class, RotationStatus) VALUES (25, '3aeuqvc', 2412, 1187, 386, 1, 6, 50, 'S', 0);
INSERT INTO Characters (CharacterID, CharacterName, Health, DPS, Speed, Difficulty, AverageCooldown, Winrate, Class, RotationStatus) VALUES (26, 'e
3z8bd6d7', 2524, 521, 315, 4, 4, 50, 'F', 1);
INSERT INTO Characters (CharacterID, CharacterName, Health, DPS, Speed, Difficulty, AverageCooldown, Winrate, Class, RotationStatus) VALUES (27, 'zxm	ee', 2992, 1322, 367, 3, 9, 50, 'T', 0);
INSERT INTO Characters (CharacterID, CharacterName, Health, DPS, Speed, Difficulty, AverageCooldown, Winrate, Class, RotationStatus) VALUES (28, '
v2u	vj', 2781, 782, 378, 3, 7, 50, 'S', 0);
INSERT INTO Characters (CharacterID, CharacterName, Health, DPS, Speed, Difficulty, AverageCooldown, Winrate, Class, RotationStatus) VALUES (29, '00z81c', 2247, 1377, 321, 4, 1, 50, 'S', 0);
INSERT INTO Characters (CharacterID, CharacterName, Health, DPS, Speed, Difficulty, AverageCooldown, Winrate, Class, RotationStatus) VALUES (30, 'otaicdpaqi', 2567, 1369, 359, 2, 5, 50, 'T', 1);
INSERT INTO Characters (CharacterID, CharacterName, Health, DPS, Speed, Difficulty, AverageCooldown, Winrate, Class, RotationStatus) VALUES (31, 'p8olsbwyj', 3008, 1773, 387, 2, 9, 50, 'T', 1);
INSERT INTO Characters (CharacterID, CharacterName, Health, DPS, Speed, Difficulty, AverageCooldown, Winrate, Class, RotationStatus) VALUES (32, '4gx4wf', 2653, 1463, 365, 1, 8, 50, 'D', 0);
INSERT INTO Characters (CharacterID, CharacterName, Health, DPS, Speed, Difficulty, AverageCooldown, Winrate, Class, RotationStatus) VALUES (33, '77h70	ml ', 2356, 759, 305, 4, 6, 50, 'F', 1);
INSERT INTO Characters (CharacterID, CharacterName, Health, DPS, Speed, Difficulty, AverageCooldown, Winrate, Class, RotationStatus) VALUES (34, 'xfda4', 1994, 667, 399, 2, 1, 50, 'T', 0);
INSERT INTO Characters (CharacterID, CharacterName, Health, DPS, Speed, Difficulty, AverageCooldown, Winrate, Class, RotationStatus) VALUES (35, '54p0sd
wd', 2368, 961, 310, 5, 4, 50, 'D', 1);
INSERT INTO Characters (CharacterID, CharacterName, Health, DPS, Speed, Difficulty, AverageCooldown, Winrate, Class, RotationStatus) VALUES (36, 'n0i23i3', 2749, 1800, 382, 4, 6, 50, 'T', 0);
INSERT INTO Characters (CharacterID, CharacterName, Health, DPS, Speed, Difficulty, AverageCooldown, Winrate, Class, RotationStatus) VALUES (37, '5jjoydie', 2382, 1544, 340, 2, 1, 50, 'F', 0);
INSERT INTO Characters (CharacterID, CharacterName, Health, DPS, Speed, Difficulty, AverageCooldown, Winrate, Class, RotationStatus) VALUES (38, 's13vow8r', 1847, 1330, 394, 1, 3, 50, 'T', 0);
INSERT INTO Characters (CharacterID, CharacterName, Health, DPS, Speed, Difficulty, AverageCooldown, Winrate, Class, RotationStatus) VALUES (39, ' 1iic
	c', 2496, 567, 341, 2, 4, 50, 'S', 0);
INSERT INTO Characters (CharacterID, CharacterName, Health, DPS, Speed, Difficulty, AverageCooldown, Winrate, Class, RotationStatus) VALUES (40, 'p6u6stg', 2974, 246, 382, 3, 1, 50, 'T', 0);
INSERT INTO Characters (CharacterID, CharacterName, Health, DPS, Speed, Difficulty, AverageCooldown, Winrate, Class, RotationStatus) VALUES (41, 'ah	pah uj9', 2132, 1172, 340, 3, 6, 50, 'S', 1);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
