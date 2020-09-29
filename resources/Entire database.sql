--
-- File generated with SQLiteStudio v3.0.7 on Tue Sep 29 12:09:46 2020
--
-- Text encoding used: windows-1252
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Compositions
CREATE TABLE Compositions (CharacterID INTEGER NOT NULL REFERENCES Characters (CharacterID) ON DELETE CASCADE ON UPDATE CASCADE, TeamID INTEGER REFERENCES Teams (TeamsID) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL, PRIMARY KEY (CharacterID, TeamID));

-- Table: Teams
CREATE TABLE Teams (TeamsID INTEGER PRIMARY KEY NOT NULL, CharacterID1 INTEGER REFERENCES Characters (CharacterID) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL, CharacterID2 INTEGER REFERENCES Characters (CharacterID) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL, CharacterID3 INTEGER REFERENCES Characters (CharacterID) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL, CharacterID4 INTEGER REFERENCES Characters (CharacterID) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL, CharacterID5 INTEGER NOT NULL REFERENCES Characters (CharacterID) ON DELETE CASCADE ON UPDATE CASCADE);

-- Table: Characters
CREATE TABLE Characters (CharacterID INTEGER PRIMARY KEY ASC AUTOINCREMENT NOT NULL, CharacterName STRING NOT NULL UNIQUE, Health INTEGER NOT NULL CONSTRAINT "Health ammount" CHECK (Health > 0), DPS INTEGER NOT NULL CONSTRAINT "DPS ammount" CHECK (DPS > 0), Speed INTEGER NOT NULL CONSTRAINT "speed ammount" CHECK (SPeed > 0), Difficulty INTEGER NOT NULL CONSTRAINT "Difficulty ammount" CHECK (6 > Difficulty > 0), AverageCooldown DOUBLE CONSTRAINT "cooldown ammount" CHECK (AverageCooldown > 0) NOT NULL, Winrate DOUBLE CONSTRAINT "Winrate ammount" CHECK (100 > winrate > 0) NOT NULL, Class CHAR NOT NULL, RotationStatus BOOLEAN);
INSERT INTO Characters (CharacterID, CharacterName, Health, DPS, Speed, Difficulty, AverageCooldown, Winrate, Class, RotationStatus) VALUES (1, 'Torvald', 5000, 200, 20, 3, 2.5, 52.3, 'T', NULL);

-- Table: SavedComps
CREATE TABLE SavedComps (AccountID INTEGER REFERENCES Accounts (AccountID) NOT NULL UNIQUE, TeamID INTEGER REFERENCES Characters ON DELETE CASCADE ON UPDATE CASCADE NOT NULL UNIQUE, PRIMARY KEY (AccountID, TeamID));

-- Table: Accounts
CREATE TABLE Accounts (AccountID INTEGER PRIMARY KEY NOT NULL, Username STRING UNIQUE NOT NULL, Password STRING CONSTRAINT passwordLength CHECK (length(password) > 7) NOT NULL, Admin BOOLEAN NOT NULL);
INSERT INTO Accounts (AccountID, Username, Password, Admin) VALUES (1, 'whoIsElla', 'YOuthfulC', 0);
INSERT INTO Accounts (AccountID, Username, Password, Admin) VALUES (2, 'DyaSuki', 'Willspassword', 1);
INSERT INTO Accounts (AccountID, Username, Password, Admin) VALUES (3, 'Blexie', 'Roscoe13', 1);
INSERT INTO Accounts (AccountID, Username, Password, Admin) VALUES (4, 'Bigpower2012', 'TinyDclub', 0);
INSERT INTO Accounts (AccountID, Username, Password, Admin) VALUES (5, 'Tacedaemo', 'Howdyman', 0);
INSERT INTO Accounts (AccountID, Username, Password, Admin) VALUES (6, 'BillboMC', 'brawlStars6', 1);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
