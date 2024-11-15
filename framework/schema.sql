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
  `map_url` TEXT NOT NULL,
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
  `map_url` TEXT NOT NULL,
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
VALUES (1, 1, 'Wyndham Grand Krakow Old Town', "city", 'https://www.wyndhamhotels.com/wyndham-grand/cracow-poland/wyndham-grand-krakow-old-town/overview', 1, 'insert desc', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2561.198695652842!2d19.93787517694859!3d50.06384041512473!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47165b102c98cf73%3A0xa100e7140d72dbf!2sWyndham%20Grand%20Krakow%20Old%20Town!5e0!3m2!1sen!2sus!4v1731694303330!5m2!1sen!2sus');
INSERT INTO Hotel
VALUES (2, 1, 'Niebieski Art Hotel & Spa', "country", 'http://www.niebieski.com.pl/', 0, 'insert desc', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2561.814620135425!2d19.91480207694792!3d50.05230391595081!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47165b7649e14983%3A0x741040c51ce23536!2sNiebieski%20Art%20Hotel%20%26%20Spa!5e0!3m2!1sen!2sus!4v1731694364169!5m2!1sen!2sus');

--Warsaw
INSERT INTO Hotel
VALUES (3, 2, 'Hotel 1', "city", '#', 1, 'insert desc', '#');
INSERT INTO Hotel
VALUES (4, 2, 'Hotel 2', "country", '#', 0, 'insert desc', '#');

--Yosemite
INSERT INTO Hotel
VALUES (5, 3, 'Hotel 1', "city", '#', 1, 'insert desc', '#');
INSERT INTO Hotel
VALUES (6, 3, 'Hotel 2', "country", '#', 0, 'insert desc', '#');

--London
INSERT INTO Hotel
VALUES (7, 4, 'Hotel 1', "city", '#', 1, 'insert desc', '#');
INSERT INTO Hotel
VALUES (8, 4, 'Hotel 2', "country", '#', 0, 'insert desc', '#');

--Berlin
INSERT INTO Hotel
VALUES (9, 5, 'Hotel 1', "city", '#', 1, 'insert desc', '#');
INSERT INTO Hotel
VALUES (10, 5, 'Hotel 2', "country", '#', 0, 'insert desc', '#');

--Oslo
INSERT INTO Hotel
VALUES (11, 6, 'Hotel 1', "city", '#', 1, 'insert desc', '#');
INSERT INTO Hotel
VALUES (12, 6, 'Hotel 2', "country", '#', 0, 'insert desc', '#');

--Paris
INSERT INTO Hotel
VALUES (13, 7, 'Hotel 1', "city", '#', 1, 'insert desc', '#');
INSERT INTO Hotel
VALUES (14, 7, 'Hotel 2', "country", '#', 0, 'insert desc', '#');

--Rome
INSERT INTO Hotel
VALUES (15, 8, 'Hotel 1', "city", '#', 1, 'insert desc', '#');
INSERT INTO Hotel
VALUES (16, 8, 'Hotel 2', "country", '#', 0, 'insert desc', '#');

-- END Hotel TEST DATA

-- BEGIN ItineraryEvent TEST DATA
--Special/General
INSERT INTO ItineraryEvent
VALUES
(1, NULL, 'Breakfast', 'Special', '#', 60, 0, 'insert desc', 'https://maps.google.com/maps?q=breakfast+near+me&z=14&output=embed'),
(2, NULL, 'Lunch', 'Special', '#', 60, 0, 'insert desc', 'https://maps.google.com/maps?q=lunch+near+me&z=14&output=embed'),
(3, NULL, 'Dinner', 'Special', '#', 60, 0, 'insert desc', 'https://maps.google.com/maps?q=dinner+near+me&z=14&output=embed'),
(4, NULL, 'Hotel Check in', 'Special', '#', 60, 0, 'insert desc', ''),
(5, NULL, 'Hotel Check out', 'Special', '#', 60, 0, 'insert desc', ''),
(6, NULL, 'Explore City', 'Special', '#', 60, 0, 'insert desc', ''),
(7, NULL, 'Fly in & Get Rental Car', 'Special', '#', 60, 0, 'insert desc', ''),
(8, NULL, 'Return Rental Car & fly out', 'Special', '#', 60, 0, 'insert desc', '');

-- Krakow
INSERT INTO ItineraryEvent
VALUES
(10, 1, 'Market Square', "Exploring", 'https://visitkrakow.com/krakows-market-square/', 120, 0, 'insert desc', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2561.3022726208433!2d19.93418097694846!3d50.06190051526357!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47165b120455da67%3A0xc3c7f5071b750d33!2zUnluZWsgR8WCw7N3bnk!5e0!3m2!1sen!2sus!4v1731694464639!5m2!1sen!2sus'),
(11, 1, 'Site2 Name', 'Exploring', '#', 180, 0, 'insert desc', '#'), 
(12, 1, 'Site3 Name', 'Exploring', '#', 180, 0, 'insert desc', '#'),
(13, 1, 'Auschwitz', "Guided Tours", 'https://www.auschwitz.org/en/visiting/', 180, 0, 'insert desc', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d41004.80848928694!2d19.1781813760047!3d50.033833388555045!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47169585b5872e05%3A0xa0be85e480141fe8!2sMemorial%20and%20Museum%20Auschwitz%20I!5e0!3m2!1sen!2sus!4v1731694577678!5m2!1sen!2sus'),
(14, 1, 'Wieliczka Salt Mine Tour', "Guided Tours", 'https://www.tripadvisor.com/AttractionProductReview-g274772-d11452686-Wieliczka_Salt_Mine_Tour_from_Krakow_with_Ticket_Pickup_Options-Krakow_Lesser_Pola.html', 180, 0, 'insert desc', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d41018.332173768824!2d19.960889607855286!3d50.01799445815423!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4716417fc9e5376f%3A0xbf76bb461ef40071!2sWieliczka%20Salt%20Mine%20Tour%20From%20Krakow!5e0!3m2!1sen!2sus!4v1731694619855!5m2!1sen!2sus'),
(15, 1, 'Site6 Name', 'Guided Tours', '#', 180, 0, 'insert desc', '#'),
(16, 1, 'Site7 Name', 'Relaxing', '#', 180, 0, 'insert desc', '#'),
(17, 1, 'Site8 Name', 'Relaxing', '#', 180, 0, 'insert desc', '#');
--Warsaw
INSERT INTO ItineraryEvent
VALUES
(18, 2, 'Site1 Name', 'Exploring', '#', 180, 0, 'insert desc', '#'),
(19, 2, 'Site2 Name', 'Exploring', '#', 180, 0, 'insert desc', '#'), 
(20, 2, 'Site3 Name', 'Exploring', '#', 180, 0, 'insert desc', '#'),
(21, 2, 'Site4 Name', 'Guided Tours', '#', 180, 0, 'insert desc', '#'), 
(22, 2, 'Site5 Name', 'Guided Tours', '#', 180, 0, 'insert desc', '#'), 
(23, 2, 'Site6 Name', 'Guided Tours', '#', 180, 0, 'insert desc', '#'),
(24, 2, 'Site7 Name', 'Relaxing', '#', 180, 0, 'insert desc', '#'),
(25, 2, 'Site8 Name', 'Relaxing', '#', 180, 0, 'insert desc', '#');

--Yosemite
INSERT INTO ItineraryEvent
VALUES
(26, 3, 'Site1 Name', 'Exploring', '#', 180, 0, 'insert desc', '#'), 
(27, 3, 'Site2 Name', 'Exploring', '#', 180, 0, 'insert desc', '#'), 
(28, 3, 'Site3 Name', 'Exploring', '#', 180, 0, 'insert desc', '#'),
(29, 3, 'Site4 Name', 'Guided Tours', '#', 180, 0, 'insert desc', '#'), 
(30, 3, 'Site5 Name', 'Guided Tours', '#', 180, 0, 'insert desc', '#'), 
(31, 3, 'Site6 Name', 'Guided Tours', '#', 180, 0, 'insert desc', '#'),
(32, 3, 'Site7 Name', 'Relaxing', '#', 180, 0, 'insert desc', '#'),
(33, 3, 'Site8 Name', 'Relaxing', '#', 180, 0, 'insert desc', '#');

--London
INSERT INTO ItineraryEvent
VALUES
(34, 4, 'Site1 Name', 'Exploring', '#', 180, 0, 'insert desc', '#'), 
(35, 4, 'Site2 Name', 'Exploring', '#', 180, 0, 'insert desc', '#'), 
(36, 4, 'Site3 Name', 'Exploring', '#', 180, 0, 'insert desc', '#'),
(37, 4, 'Site4 Name', 'Guided Tours', '#', 180, 0, 'insert desc', '#'), 
(38, 4, 'Site5 Name', 'Guided Tours', '#', 180, 0, 'insert desc', '#'), 
(39, 4, 'Site6 Name', 'Guided Tours', '#', 180, 0, 'insert desc', '#'),
(40, 4, 'Site7 Name', 'Relaxing', '#', 180, 0, 'insert desc', '#'),
(41, 4, 'Site8 Name', 'Relaxing', '#', 180, 0, 'insert desc', '#');

--Berlin
INSERT INTO ItineraryEvent
VALUES
(42, 5, 'Site1 Name', 'Exploring', '#', 180, 0, 'insert desc', '#'),
(43, 5, 'Site2 Name', 'Exploring', '#', 180, 0, 'insert desc', '#'), 
(44, 5, 'Site3 Name', 'Exploring', '#', 180, 0, 'insert desc', '#'),
(45, 5, 'Site4 Name', 'Guided Tours', '#', 180, 0, 'insert desc', '#'), 
(46, 5, 'Site5 Name', 'Guided Tours', '#', 180, 0, 'insert desc', '#'), 
(47, 5, 'Site6 Name', 'Guided Tours', '#', 180, 0, 'insert desc', '#'),
(48, 5, 'Site7 Name', 'Relaxing', '#', 180, 0, 'insert desc', '#'),
(49, 5, 'Site8 Name', 'Relaxing', '#', 180, 0, 'insert desc', '#');

--Oslo
INSERT INTO ItineraryEvent
VALUES
(50, 6, 'Site1 Name', 'Exploring', '#', 180, 0, 'insert desc', '#'), 
(51, 6, 'Site2 Name', 'Exploring', '#', 180, 0, 'insert desc', '#'), 
(52, 6, 'Site3 Name', 'Exploring', '#', 180, 0, 'insert desc', '#'),
(53, 6, 'Site4 Name', 'Guided Tours', '#', 180, 0, 'insert desc', '#'), 
(54, 6, 'Site5 Name', 'Guided Tours', '#', 180, 0, 'insert desc', '#'), 
(55, 6, 'Site6 Name', 'Guided Tours', '#', 180, 0, 'insert desc', '#'),
(56, 6, 'Site7 Name', 'Relaxing', '#', 180, 0, 'insert desc', '#'),
(57, 6, 'Site8 Name', 'Relaxing', '#', 180, 0, 'insert desc', '#');

--Paris
INSERT INTO ItineraryEvent
VALUES
(58, 7, 'Site1 Name', 'Exploring', '#', 180, 0, 'insert desc', '#'), 
(59, 7, 'Site2 Name', 'Exploring', '#', 180, 0, 'insert desc', '#'), 
(60, 7, 'Site3 Name', 'Exploring', '#', 180, 0, 'insert desc', '#'),
(61, 7, 'Site4 Name', 'Guided Tours', '#', 180, 0, 'insert desc', '#'), 
(62, 7, 'Site5 Name', 'Guided Tours', '#', 180, 0, 'insert desc', '#'), 
(63, 7, 'Site6 Name', 'Guided Tours', '#', 180, 0, 'insert desc', '#'),
(64, 7, 'Site7 Name', 'Relaxing', '#', 180, 0, 'insert desc', '#'),
(65, 7, 'Site8 Name', 'Relaxing', '#', 180, 0, 'insert desc', '#');

--Rome
INSERT INTO ItineraryEvent
VALUES
(66, 8, 'Site1 Name', 'Exploring', '#', 180, 0, 'insert desc', '#'),
(67, 8, 'Site2 Name', 'Exploring', '#', 180, 0, 'insert desc', '#'), 
(68, 8, 'Site3 Name', 'Exploring', '#', 180, 0, 'insert desc', '#'),
(69, 8, 'Site4 Name', 'Guided Tours', '#', 180, 0, 'insert desc', '#'), 
(70, 8, 'Site5 Name', 'Guided Tours', '#', 180, 0, 'insert desc', '#'), 
(71, 8, 'Site6 Name', 'Guided Tours', '#', 180, 0, 'insert desc', '#'),
(72, 8, 'Site7 Name', 'Relaxing', '#', 180, 0, 'insert desc', '#'),
(73, 8, 'Site8 Name', 'Relaxing', '#', 180, 0, 'insert desc', '#');

-- END ItineraryEvent TEST DATA




-- BEGIN Itinerary TEST DATA
INSERT INTO Itinerary
VALUES
(1,1,1,2,'396cb101-8150-4fe2-a1a4-5cca437ac5a9');

INSERT INTO ItineraryDetail
VALUES
(1, 1, 7, 1, '8:00AM - 9:00AM'),
(2, 1, 6, 1, '9:00AM - 10:00AM'),
(3, 1, 2, 1, '10:00AM - 11:00AM'),
(4, 1, 4, 1, '11:00AM - 12:00PM'),
(5, 1, 1, 1, '12:00PM - 3:00PM'),
(6, 1, 3, 1, '3:00PM - 4:00PM'),

(7, 1, 1, 2, '8:00AM - 9:00AM'),
(8, 1, 13, 2, '9:00AM - 12:00PM'),
(9, 1, 2, 2, '12:00PM - 1:00PM'),
(10, 1, 11, 2, '1:00PM - 4:00PM'),
(11, 1, 3, 2, '4:00PM - 5:00PM'),

(12, 1, 1, 3, '8:00AM - 9:00AM'),
(13, 1, 12, 3, '9:00AM - 12:00PM'),
(14, 1, 2, 3, '12:00PM - 1:00PM'),
(15, 1, 10, 3, '1:00PM - 3:00PM'),
(16, 1, 3, 3, '3:00PM - 4:00PM'),

(17, 1, 1, 4, '8:00AM - 9:00AM'),
(18, 1, 15, 4, '9:00AM - 12:00PM'),
(19, 1, 2, 4, '12:00PM - 1:00PM'),
(20, 1, 14, 4, '1:00PM - 4:00PM'),
(21, 1, 3, 4, '4:00PM - 5:00PM'),

(22, 1, 1, 5, '8:00AM - 9:00AM'),
(23, 1, 5, 5, '9:00AM - 10:00AM'),
(24, 1, 17, 5, '10:00AM - 1:00PM'),
(25, 1, 2, 5, '1:00PM - 2:00PM'),
(26, 1, 8, 5, '2:00PM - 3:00PM');
-- END Itinerary TEST DATA