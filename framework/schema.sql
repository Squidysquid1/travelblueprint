PRAGMA foreign_keys = 1;

DROP TABLE IF EXISTS User;
CREATE TABLE User (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL
);

DROP TABLE IF EXISTS `City`;
CREATE TABLE `City` (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(255),
  country VARCHAR(255) -- Could make country a separate table
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
