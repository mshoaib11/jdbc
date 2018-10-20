CREATE DATABASE SHIPS_N_BATTLES;
USE SHIPS_N_BATTLES;
CREATE TABLE Classes (
	class VARCHAR(20) PRIMARY KEY,
	"type" VARCHAR(20),
	country VARCHAR(20),
	numGuns NUMERIC,
	bore NUMERIC,
	displacement NUMERIC
);

CREATE TABLE Battles (
	name VARCHAR(20) PRIMARY KEY,
	startdate DATE,
	enddate DATE
);

CREATE TABLE Ships (
	name VARCHAR(20) PRIMARY KEY,
	class VARCHAR(20) REFERENCES Classes,
	launched NUMERIC(4) CHECK (launched <= 1945) 
);

CREATE TABLE Outcomes (
	ship varchar(20) REFERENCES Ships,
	battle varchar(20) REFERENCES Battles,
	result varchar(20) CHECK (result = 'ok' OR result = 'sunk' OR result = 'damaged'),
	PRIMARY KEY (ship, battle)
);

-- Sample data for Classes

INSERT INTO Classes VALUES ('Bismarck', 'bb', 'Germany', 8, 15, 42000);
INSERT INTO Classes VALUES ('Iowa', 'bb', 'USA', 9, 16, 46000);
INSERT INTO Classes VALUES ('Kongo', 'bc', 'Japan', 8, 14, 32000);
INSERT INTO Classes VALUES ('North Carolina', 'bb', 'USA', 9, 16, 37000);
INSERT INTO Classes VALUES ('Renown', 'bc', 'Gt. Britain', 6, 15, 32000);
INSERT INTO Classes VALUES ('Revenge', 'bb', 'Gt. Britain', 8, 15, 29000);
INSERT INTO Classes VALUES ('Tennessee', 'bb', 'USA', 12, 14, 32000);
INSERT INTO Classes VALUES ('Yamato', 'bb', 'Japan', 9, 18, 65000);

-- Sample data for Battles

INSERT INTO Battles VALUES ('Denmark Strait', '1941-05-24', '1941-05-27');
INSERT INTO Battles VALUES ('Guadalcanal', '1942-11-15', '1942-11-15');
INSERT INTO Battles VALUES ('North Cape', '1943-12-26', '1943-12-26');
INSERT INTO Battles VALUES ('Surigao Strait', '1944-10-25', '1944-10-25');

-- Sample data for Ships

INSERT INTO Ships VALUES ('California', 'Tennessee', 1921);
INSERT INTO Ships VALUES ('Haruna', 'Kongo', 1915);
INSERT INTO Ships VALUES ('Hiei', 'Kongo', 1914);
INSERT INTO Ships VALUES ('Iowa', 'Iowa', 1943);
INSERT INTO Ships VALUES ('Kirishima', 'Kongo', 1915);
INSERT INTO Ships VALUES ('Kongo', 'Kongo', 1913);
INSERT INTO Ships VALUES ('Missouri', 'Iowa', 1944);
INSERT INTO Ships VALUES ('Musashi', 'Yamato', 1942);
INSERT INTO Ships VALUES ('New Jersey', 'Iowa', 1943);
INSERT INTO Ships VALUES ('North Carolina', 'North Carolina', 1941);
INSERT INTO Ships VALUES ('Ramillies', 'Revenge', 1917);
INSERT INTO Ships VALUES ('Renown', 'Renown', 1916);
INSERT INTO Ships VALUES ('Repulse', 'Renown', 1916);
INSERT INTO Ships VALUES ('Resolution', 'Revenge', 1916);
INSERT INTO Ships VALUES ('Revenge', 'Revenge', 1916);
INSERT INTO Ships VALUES ('Royal Oak', 'Revenge', 1916);
INSERT INTO Ships VALUES ('Royal Sovereign', 'Revenge', 1916);
INSERT INTO Ships VALUES ('Tennessee', 'Tennessee', 1920);
INSERT INTO Ships VALUES ('Washington', 'North Carolina', 1941);
INSERT INTO Ships VALUES ('Wisconsin', 'Iowa', 1944);
INSERT INTO Ships VALUES ('Yamato', 'Yamato', 1941);

-- Sample data for Outcomes

INSERT INTO Outcomes VALUES ('California', 'Surigao Strait', 'ok');
INSERT INTO Outcomes VALUES ('Kirishima', 'Guadalcanal', 'sunk');
INSERT INTO Outcomes VALUES ('Tennessee', 'Surigao Strait', 'ok');
INSERT INTO Outcomes VALUES ('Washington', 'Guadalcanal', 'ok');

