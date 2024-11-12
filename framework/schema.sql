PRAGMA foreign_keys = 1;

DROP TABLE IF EXISTS User;
CREATE TABLE User (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL,
  isAdmin TINYINT -- Boolean
);

DROP TABLE IF EXISTS `City`;
    CREATE TABLE `City` (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(255),
    country VARCHAR(255), -- Could make country a separate table but meh
    img VARCHAR(255),
    desc TEXT
    );

DROP TABLE IF EXISTS `Itinerary`;
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

DROP TABLE IF EXISTS `ItineraryDetail`;
CREATE TABLE `ItineraryDetail` (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  itineraryID INTEGER,
  siteID INTEGER,
  date NUMERIC, -- mm/dd/yyyy
  time INTEGER, -- possibly Epoch of utc
  FOREIGN KEY (itineraryID) REFERENCES Itinerary(id),
  FOREIGN KEY (siteID) REFERENCES Hotel(id)
);

DROP TABLE IF EXISTS `Site`;
CREATE TABLE `Site` (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  cityID INTEGER,
  name VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  averageDuration int, -- in min
  url TEXT NOT NULL,
  isPreffered TINYINT, -- Boolean
  FOREIGN KEY (cityID) REFERENCES City(id)
);

DROP TABLE IF EXISTS `Hotel`;
CREATE TABLE `Hotel` (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  cityID INTEGER,
  name VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  url TEXT NOT NULL,
  isPreffered TINYINT, -- Boolean
  FOREIGN KEY (cityID) REFERENCES City(id)
);

DROP TABLE IF EXISTS FAQ;
CREATE TABLE FAQ (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  question TEXT UNIQUE NOT NULL,
  answer TEXT NOT NULL
);

---------------------- TEST DATA BELOW ----------------------

-- BEGIN FAQ TEST DATA
INSERT INTO FAQ (question, answer) 
VALUES ('What do you do?', 'Here at travel blueprint we strive to streamline the process of getting a personalized itinerary made for your trip.'); 

INSERT INTO FAQ (question, answer) 
VALUES ('Does it cost anything?', 'We are currently in an open beta to get the most amount of feedback possible. We plan to move to a more sustainable payment model if we receive positive feedback.'); 

INSERT INTO FAQ (question, answer) 
VALUES ('test1', 'asdasd'); 

INSERT INTO FAQ (question, answer) 
VALUES ('test2', 'adsafsjfsakfas;');
-- END FAQ TEST DATA

-- BEGIN City TEST DATA
INSERT INTO City (`name`, `country`, `img`, `desc`)
VALUES ('Krakow', 'Poland', '/img/countries/poland/krakow/card_icon.jpg', 'Experience a land of wonder!');

INSERT INTO City (`name`, `country`, `img`, `desc`)
VALUES ('Warsaw', 'Poland', '/img/countries/poland/warsaw/card_icon.jpg', 'Experience a land of wonder!');

INSERT INTO City (`name`, `country`, `img`, `desc`)
VALUES ('Yosemite', 'USA', '/img/countries/usa/yosemite/card_icon.jpg', 'Experience a land of wonder!');

INSERT INTO City (`name`, `country`, `img`, `desc`)
VALUES ('London', 'United Kingdom', '/img/countries/united_kingdom/london/card_icon.jpg', 'Experience a land of wonder!');

INSERT INTO City (`name`, `country`, `img`, `desc`)
VALUES ('Berlin', 'Germany', '/img/countries/germany/berlin/card_icon.webp', 'Experience a land of wonder!');

INSERT INTO City (`name`, `country`, `img`, `desc`)
VALUES ('Oslo', 'Norway', '/img/countries/norway/oslo/card_icon.png', 'Experience a land of wonder!');

INSERT INTO City (`name`, `country`, `img`, `desc`)
VALUES ('Paris', 'France', '/img/countries/france/paris/card_icon.jpg', 'Experience a land of wonder!');

INSERT INTO City (`name`, `country`, `img`, `desc`)
VALUES ('Rome', 'Italy', '/img/countries/italy/rome/card_icon.jpg', 'Experience a land of wonder!');

INSERT INTO City (`name`, `country`, `img`, `desc`)
VALUES ('', '', '', 'Experience a land of wonder!');
-- END City TEST DATA
