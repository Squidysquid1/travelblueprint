PRAGMA foreign_keys = 1;
-- Drop existing tables
DROP TABLE IF EXISTS `ItineraryDetail`;
DROP TABLE IF EXISTS `ItineraryEvent`;
DROP TABLE IF EXISTS `Itinerary`;
DROP TABLE IF EXISTS `Hotel`;
DROP TABLE IF EXISTS `City`;
DROP TABLE IF EXISTS `User`;
DROP TABLE IF EXISTS `FAQ`;
-- Create new tables

CREATE TABLE User (
  `user_id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `username` TEXT UNIQUE NOT NULL,
  `password` TEXT NOT NULL,
  `is_admin` TINYINT -- Boolean
);

CREATE TABLE `City` (
  `city_id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `name` VARCHAR(255),
  `country` VARCHAR(255), -- Could make country a separate table but meh
  `img` VARCHAR(255),
  `desc` TEXT
);

CREATE TABLE `Itinerary`(
  `itinerary_id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `user_id` INTEGER,
  `city_id` INTEGER,
  `hotel_id` INTEGER,
  `uuid4` VARCHAR(255) NOT NULL,
  FOREIGN KEY (`user_id`) REFERENCES User(`user_id`),
  FOREIGN KEY (`city_id`) REFERENCES City(`city_id`),
  FOREIGN KEY (`hotel_id`) REFERENCES Hotel(`hotel_id`)
);

CREATE TABLE `ItineraryDetail` (
  `itinerary_detail_id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `itinerary_id` INTEGER,
  `event_id` INTEGER,
  `day` INTEGER,
  `time` VARCHAR(255),
  FOREIGN KEY (`itinerary_id`) REFERENCES Itinerary(`itinerary_id`),
  FOREIGN KEY (`event_id`) REFERENCES ItineraryEvent(`event_id`)
);

CREATE TABLE `ItineraryEvent` ( -- change to event
  `event_id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `city_id` INTEGER,
  `title` VARCHAR(255) NOT NULL,
  `category` VARCHAR(255) NOT NULL,
  `url` VARCHAR(255) NOT NULL,
  `average_duration` int, -- in min
  `is_preffered` TINYINT, -- Boolean
  `information` TEXT NOT NULL,
  FOREIGN KEY (`city_id`) REFERENCES City(`city_id`)
);

CREATE TABLE `Hotel` (
  `hotel_id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `city_id` INTEGER,
  `name` VARCHAR(255) NOT NULL,
  `location_pref` VARCHAR(255) NOT NULL,
  `url` VARCHAR(255) NOT NULL,
  `is_preffered` TINYINT, -- Boolean
  `description` TEXT NOT NULL,
  FOREIGN KEY (`city_id`) REFERENCES City(`city_id`)
);

CREATE TABLE FAQ (
  `faq_id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `question` TEXT NOT NULL,
  `answer` TEXT NOT NULL
);

---------------------- TEST DATA BELOW ----------------------

-- BEGIN TEST ADMIN USER
INSERT INTO User
VALUES (1, "test", "scrypt:32768:8:1$vGE1pDr5F2xkKLhq$e8fa50a3c0a9fd7e3f06cdf5dc732cf4eac3592bad75cbdc6f79379ef558fdabbda698522807b9ab01c5ee5bc8ba05d4b40dbc47d9efbad52f3ca6ab4dbb83a8",1);
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

-- BEGIN ItineraryEvent TEST DATA

-- Krakow
INSERT INTO ItineraryEvent
VALUES
(1, 1, 'Market Square', "Exploring", 'https://visitkrakow.com/krakows-market-square/', 120, 0, 'insert desc'),
(2, 1, 'Site2 Name', 'Exploring', '#', 180, 0, 'insert desc'), 
(3, 1, 'Site3 Name', 'Exploring', '#', 180, 0, 'insert desc'),
(4, 1, 'Auschwitz', "Guided Tours", 'https://www.auschwitz.org/en/visiting/', 180, 0, 'insert desc'),
(5, 1, 'Wieliczka Salt Mine Tour', "Guided Tours", 'https://www.tripadvisor.com/AttractionProductReview-g274772-d11452686-Wieliczka_Salt_Mine_Tour_from_Krakow_with_Ticket_Pickup_Options-Krakow_Lesser_Pola.html', 180, 0, 'insert desc'),
(6, 1, 'Site6 Name', 'Guided Tours', '#', 180, 0, 'insert desc'),
(7, 1, 'Site7 Name', 'Relaxing', '#', 180, 0, 'insert desc'),
(8, 1, 'Site8 Name', 'Relaxing', '#', 180, 0, 'insert desc');
--Warsaw
INSERT INTO ItineraryEvent
VALUES
(9, 2, 'Site1 Name', 'Exploring', '#', 180, 0, 'insert desc'), 
(10, 2, 'Site2 Name', 'Exploring', '#', 180, 0, 'insert desc'), 
(11, 2, 'Site3 Name', 'Exploring', '#', 180, 0, 'insert desc'),
(12, 2, 'Site4 Name', 'Guided Tours', '#', 180, 0, 'insert desc'), 
(13, 2, 'Site5 Name', 'Guided Tours', '#', 180, 0, 'insert desc'), 
(14, 2, 'Site6 Name', 'Guided Tours', '#', 180, 0, 'insert desc'),
(15, 2, 'Site7 Name', 'Relaxing', '#', 180, 0, 'insert desc'),
(16, 2, 'Site8 Name', 'Relaxing', '#', 180, 0, 'insert desc');

--Yosemite
INSERT INTO ItineraryEvent
VALUES
(17, 3, 'Site1 Name', 'Exploring', '#', 180, 0, 'insert desc'), 
(18, 3, 'Site2 Name', 'Exploring', '#', 180, 0, 'insert desc'), 
(19, 3, 'Site3 Name', 'Exploring', '#', 180, 0, 'insert desc'),
(20, 3, 'Site4 Name', 'Guided Tours', '#', 180, 0, 'insert desc'), 
(21, 3, 'Site5 Name', 'Guided Tours', '#', 180, 0, 'insert desc'), 
(22, 3, 'Site6 Name', 'Guided Tours', '#', 180, 0, 'insert desc'),
(23, 3, 'Site7 Name', 'Relaxing', '#', 180, 0, 'insert desc'),
(24, 3, 'Site8 Name', 'Relaxing', '#', 180, 0, 'insert desc');

--London
INSERT INTO ItineraryEvent
VALUES
(25, 4, 'Site1 Name', 'Exploring', '#', 180, 0, 'insert desc'), 
(26, 4, 'Site2 Name', 'Exploring', '#', 180, 0, 'insert desc'), 
(27, 4, 'Site3 Name', 'Exploring', '#', 180, 0, 'insert desc'),
(28, 4, 'Site4 Name', 'Guided Tours', '#', 180, 0, 'insert desc'), 
(29, 4, 'Site5 Name', 'Guided Tours', '#', 180, 0, 'insert desc'), 
(30, 4, 'Site6 Name', 'Guided Tours', '#', 180, 0, 'insert desc'),
(31, 4, 'Site7 Name', 'Relaxing', '#', 180, 0, 'insert desc'),
(32, 4, 'Site8 Name', 'Relaxing', '#', 180, 0, 'insert desc');

--Berlin
INSERT INTO ItineraryEvent
VALUES
(33, 5, 'Site1 Name', 'Exploring', '#', 180, 0, 'insert desc'), 
(34, 5, 'Site2 Name', 'Exploring', '#', 180, 0, 'insert desc'), 
(35, 5, 'Site3 Name', 'Exploring', '#', 180, 0, 'insert desc'),
(36, 5, 'Site4 Name', 'Guided Tours', '#', 180, 0, 'insert desc'), 
(37, 5, 'Site5 Name', 'Guided Tours', '#', 180, 0, 'insert desc'), 
(38, 5, 'Site6 Name', 'Guided Tours', '#', 180, 0, 'insert desc'),
(39, 5, 'Site7 Name', 'Relaxing', '#', 180, 0, 'insert desc'),
(40, 5, 'Site8 Name', 'Relaxing', '#', 180, 0, 'insert desc');

--Oslo
INSERT INTO ItineraryEvent
VALUES
(41, 6, 'Site1 Name', 'Exploring', '#', 180, 0, 'insert desc'), 
(42, 6, 'Site2 Name', 'Exploring', '#', 180, 0, 'insert desc'), 
(43, 6, 'Site3 Name', 'Exploring', '#', 180, 0, 'insert desc'),
(44, 6, 'Site4 Name', 'Guided Tours', '#', 180, 0, 'insert desc'), 
(45, 6, 'Site5 Name', 'Guided Tours', '#', 180, 0, 'insert desc'), 
(46, 6, 'Site6 Name', 'Guided Tours', '#', 180, 0, 'insert desc'),
(47, 6, 'Site7 Name', 'Relaxing', '#', 180, 0, 'insert desc'),
(48, 6, 'Site8 Name', 'Relaxing', '#', 180, 0, 'insert desc');

--Paris
INSERT INTO ItineraryEvent
VALUES
(49, 7, 'Site1 Name', 'Exploring', '#', 180, 0, 'insert desc'), 
(50, 7, 'Site2 Name', 'Exploring', '#', 180, 0, 'insert desc'), 
(51, 7, 'Site3 Name', 'Exploring', '#', 180, 0, 'insert desc'),
(52, 7, 'Site4 Name', 'Guided Tours', '#', 180, 0, 'insert desc'), 
(53, 7, 'Site5 Name', 'Guided Tours', '#', 180, 0, 'insert desc'), 
(54, 7, 'Site6 Name', 'Guided Tours', '#', 180, 0, 'insert desc'),
(55, 7, 'Site7 Name', 'Relaxing', '#', 180, 0, 'insert desc'),
(56, 7, 'Site8 Name', 'Relaxing', '#', 180, 0, 'insert desc');

--Rome
INSERT INTO ItineraryEvent
VALUES
(57, 8, 'Site1 Name', 'Exploring', '#', 180, 0, 'insert desc'), 
(58, 8, 'Site2 Name', 'Exploring', '#', 180, 0, 'insert desc'), 
(59, 8, 'Site3 Name', 'Exploring', '#', 180, 0, 'insert desc'),
(60, 8, 'Site4 Name', 'Guided Tours', '#', 180, 0, 'insert desc'), 
(61, 8, 'Site5 Name', 'Guided Tours', '#', 180, 0, 'insert desc'), 
(62, 8, 'Site6 Name', 'Guided Tours', '#', 180, 0, 'insert desc'),
(63, 8, 'Site7 Name', 'Relaxing', '#', 180, 0, 'insert desc'),
(64, 8, 'Site8 Name', 'Relaxing', '#', 180, 0, 'insert desc'),


--Special/General
(65, NULL, 'Breakfast', 'Special', '#', 60, 0, 'insert desc'),
(66, NULL, 'Lunch', 'Special', '#', 60, 0, 'insert desc'),
(67, NULL, 'Dinner', 'Special', '#', 60, 0, 'insert desc'),
(68, NULL, 'Hotel Check in', 'Special', '#', 60, 0, 'insert desc'),
(69, NULL, 'Hotel Check out', 'Special', '#', 60, 0, 'insert desc'),
(70, NULL, 'Explore City', 'Special', '#', 60, 0, 'insert desc'),
(71, NULL, 'Get Rental Car', 'Special', '#', 60, 0, 'insert desc');
-- END ItineraryEvent TEST DATA




-- BEGIN Itinerary TEST DATA


INSERT INTO Itinerary
VALUES
(1,1,1,1,'b75171b8-1023-4ff3-acfc-0047f6e37079');

INSERT INTO ItineraryDetail
VALUES
(1,1, 65, 1, "9am-10am"), --breakfast
(2,1, 1, 1, "11am-12pm"), --
(3,1, 2, 1, "1pm-3pm"), --
(4,1, 3, 1, "4pm-5pm"), --

(5,1, 65, 2, "9am-10am"), --breakfast
(6,1, 4, 2, "11am-12pm"), --
(7,1, 5, 2, "1pm-3pm"), --
(8,1, 6, 2, "4pm-6pm"), --

(9,1, 65, 3, "9am-10am"),  --breakfast
(10,1, 69, 3, "11:00am-11:30am"), --checkout
(11,1, 7, 3, "12pm-1pm"), --
(12,1, 8, 3, "1pm-3pm"), --
(13,1, 66, 3, "4pm-6pm"); --
-- END Itinerary TEST DATA