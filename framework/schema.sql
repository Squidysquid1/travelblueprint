PRAGMA foreign_keys = 1;
-- Drop existing tables
DROP TABLE IF EXISTS `Site`;
DROP TABLE IF EXISTS `ItineraryDetail`;
DROP TABLE IF EXISTS `Itinerary`;
DROP TABLE IF EXISTS `Hotel`;
DROP TABLE IF EXISTS `City`;
DROP TABLE IF EXISTS `User`;
DROP TABLE IF EXISTS `FAQ`;
-- Create new tables

CREATE TABLE User (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL,
  isAdmin TINYINT -- Boolean
);

CREATE TABLE `City` (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(255),
  country VARCHAR(255), -- Could make country a separate table but meh
  img VARCHAR(255),
  desc TEXT
);

CREATE TABLE `Itinerary`(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  userID INTEGER,
  cityID INTEGER,
  hotelID INTEGER,
  hash VARCHAR(255) NOT NULL, -- Might need to be larger depending on what hashing algo we intend on using
  FOREIGN KEY (userID) REFERENCES User(id),
  FOREIGN KEY (cityID) REFERENCES City(id),
  FOREIGN KEY (hotelID) REFERENCES Hotel(id)
);

CREATE TABLE `ItineraryDetail` (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  itineraryID INTEGER,
  siteID INTEGER,
  date NUMERIC, -- mm/dd/yyyy
  time INTEGER, -- possibly Epoch of utc
  FOREIGN KEY (itineraryID) REFERENCES Itinerary(id),
  FOREIGN KEY (siteID) REFERENCES Hotel(id)
);

CREATE TABLE `Site` (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  cityID INTEGER,
  name VARCHAR(255) NOT NULL,
  category VARCHAR(255) NOT NULL,
  url VARCHAR(255) NOT NULL,
  averageDuration int, -- in min
  isPreffered TINYINT, -- Boolean
  description TEXT NOT NULL,
  FOREIGN KEY (cityID) REFERENCES City(id)
);

CREATE TABLE `Hotel` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `cityID` INTEGER,
  `name` VARCHAR(255) NOT NULL,
  `locationPref` VARCHAR(255) NOT NULL,
  `url` VARCHAR(255) NOT NULL,
  `isPreffered` TINYINT, -- Boolean
  `description` TEXT NOT NULL,
  FOREIGN KEY (`cityID`) REFERENCES City(`id`)
);

CREATE TABLE FAQ (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  question TEXT UNIQUE NOT NULL,
  answer TEXT NOT NULL
);

---------------------- TEST DATA BELOW ----------------------

-- BEGIN TEST ADMIN USER
INSERT INTO User
VALUES (1,"scrypt:32768:8:1$vGE1pDr5F2xkKLhq$e8fa50a3c0a9fd7e3f06cdf5dc732cf4eac3592bad75cbdc6f79379ef558fdabbda698522807b9ab01c5ee5bc8ba05d4b40dbc47d9efbad52f3ca6ab4dbb83a8",1);
-- END TEST ADMIN USER

-- BEGIN FAQ TEST DATA
INSERT INTO FAQ
VALUES (1, 'What do you do?', 'Here at travel blueprint we strive to streamline the process of getting a personalized itinerary made for your trip.'); 

INSERT INTO FAQ
VALUES (2, 'Does it cost anything?', 'We are currently in an open beta to get the most amount of feedback possible. We plan to move to a more sustainable payment model if we receive positive feedback.'); 

INSERT INTO FAQ
VALUES (3, 'test1', 'asdasd'); 

INSERT INTO FAQ
VALUES (4, 'test2', 'adsafsjfsakfas;');
-- END FAQ TEST DATA

-- BEGIN City TEST DATA
INSERT INTO City
VALUES (1, 'Krakow', 'Poland', '/img/countries/poland/krakow/card_icon.jpg', 'Experience a land of wonder!');

INSERT INTO City
VALUES (2, 'Warsaw', 'Poland', '/img/countries/poland/warsaw/card_icon.jpg', 'Experience a land of wonder!');

INSERT INTO City
VALUES (3, 'Yosemite', 'USA', '/img/countries/usa/yosemite/card_icon.jpg', 'Experience a land of wonder!');

INSERT INTO City
VALUES (4, 'London', 'United Kingdom', '/img/countries/united_kingdom/london/card_icon.jpg', 'Experience a land of wonder!');

INSERT INTO City
VALUES (5, 'Berlin', 'Germany', '/img/countries/germany/berlin/card_icon.webp', 'Experience a land of wonder!');

INSERT INTO City
VALUES (6, 'Oslo', 'Norway', '/img/countries/norway/oslo/card_icon.png', 'Experience a land of wonder!');

INSERT INTO City
VALUES (7, 'Paris', 'France', '/img/countries/france/paris/card_icon.jpg', 'Experience a land of wonder!');

INSERT INTO City
VALUES (8, 'Rome', 'Italy', '/img/countries/italy/rome/card_icon.jpg', 'Experience a land of wonder!');
-- END City TEST DATA


-- BEGIN Hotel TEST DATA

-- Krakow
INSERT INTO Hotel
VALUES (1, 1, 'Wyndham Grand Krakow Old Town', "city", 'https://www.wyndhamhotels.com/wyndham-grand/cracow-poland/wyndham-grand-krakow-old-town/overview', 1, 'insert desc');
INSERT INTO Hotel
VALUES (2, 1, 'Niebieski Art Hotel & Spa', "country", 'http://www.niebieski.com.pl/', 0, 'insert desc');

--Warsaw
INSERT INTO Hotel
VALUES (3, 2, 'Hotel 1', "city", '#', 1, 'insert desc');
INSERT INTO Hotel
VALUES (4, 2, 'Hotel 2', "country", '#', 0, 'insert desc');

--Yosemite
INSERT INTO Hotel
VALUES (5, 3, 'Hotel 1', "city", '#', 1, 'insert desc');
INSERT INTO Hotel
VALUES (6, 3, 'Hotel 2', "country", '#', 0, 'insert desc');

--London
INSERT INTO Hotel
VALUES (7, 4, 'Hotel 1', "city", '#', 1, 'insert desc');
INSERT INTO Hotel
VALUES (8, 4, 'Hotel 2', "country", '#', 0, 'insert desc');

--Berlin
INSERT INTO Hotel
VALUES (9, 5, 'Hotel 1', "city", '#', 1, 'insert desc');
INSERT INTO Hotel
VALUES (10, 5, 'Hotel 2', "country", '#', 0, 'insert desc');

--Oslo
INSERT INTO Hotel
VALUES (11, 6, 'Hotel 1', "city", '#', 1, 'insert desc');
INSERT INTO Hotel
VALUES (12, 6, 'Hotel 2', "country", '#', 0, 'insert desc');

--Paris
INSERT INTO Hotel
VALUES (13, 7, 'Hotel 1', "city", '#', 1, 'insert desc');
INSERT INTO Hotel
VALUES (14, 7, 'Hotel 2', "country", '#', 0, 'insert desc');

--Rome
INSERT INTO Hotel
VALUES (15, 8, 'Hotel 1', "city", '#', 1, 'insert desc');
INSERT INTO Hotel
VALUES (16, 8, 'Hotel 2', "country", '#', 0, 'insert desc');

-- END Hotel TEST DATA

-- BEGIN Site TEST DATA
-- category type: Exploring, Relaxing, Guided Tours 
-- Krakow
INSERT INTO Site
VALUES (1, 1, 'Auschwitz', "Guided Tours", 'https://www.auschwitz.org/en/visiting/', 180, 0, 'insert desc');
INSERT INTO Site
VALUES (2, 1, 'Wieliczka Salt Mine Tour', "Guided Tours", 'https://www.tripadvisor.com/AttractionProductReview-g274772-d11452686-Wieliczka_Salt_Mine_Tour_from_Krakow_with_Ticket_Pickup_Options-Krakow_Lesser_Pola.html', 180, 0, 'insert desc');
INSERT INTO Site
VALUES (3, 1, 'Market Square', "Exploring", 'https://visitkrakow.com/krakows-market-square/', 120, 0, 'insert desc');

--Warsaw


--Yosemite


--London


--Berlin


--Oslo


--Paris


--Rome


-- END Site TEST DATA