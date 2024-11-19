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
VALUES (1, 1, 'Wyndham Grand Krakow Old Town', "city", 'https://www.wyndhamhotels.com/wyndham-grand/cracow-poland/wyndham-grand-krakow-old-town/overview', 1, "Wyndham Grand Krakow Old Town is a luxurious hotel situated in the heart of Kraków, just steps away from the city's historic Old Town and main attractions. Combining modern comforts with classic elegance, the hotel features spacious rooms, sophisticated dining options, and a range of amenities including a fitness center and meeting facilities. Its prime location, impeccable service, and stylish design make it an ideal choice for both leisure and business travelers seeking an upscale experience in one of Europe's most charming cities.", 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2561.198695652842!2d19.93787517694859!3d50.06384041512473!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47165b102c98cf73%3A0xa100e7140d72dbf!2sWyndham%20Grand%20Krakow%20Old%20Town!5e0!3m2!1sen!2sus!4v1731694303330!5m2!1sen!2sus');
INSERT INTO Hotel
VALUES (2, 1, 'Niebieski Art Hotel & Spa', "country", 'http://www.niebieski.com.pl/', 0, 'Niebieski Art Hotel & Spa is a stylish, contemporary hotel located in Kraków, Poland, offering a blend of modern design and artistic elements. With a focus on relaxation and luxury, it features a full-service spa, a range of elegant rooms, and beautiful views of the Vistula River. The hotel is known for its excellent service, inviting ambiance, and proximity to the city’s cultural and historical attractions. Ideal for both leisure and business travelers, Niebieski Art Hotel & Spa combines comfort with artistic flair.', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2561.814620135425!2d19.91480207694792!3d50.05230391595081!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47165b7649e14983%3A0x741040c51ce23536!2sNiebieski%20Art%20Hotel%20%26%20Spa!5e0!3m2!1sen!2sus!4v1731694364169!5m2!1sen!2sus');

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
(1, NULL, 'Breakfast', 'Special', '', 60, 0, "Start your day with a delicious and energizing breakfast. Whether it's a continental spread, a hearty buffet, or a traditional local breakfast, this morning meal offers a perfect opportunity to relax, enjoy fresh food, and plan for the day's adventures. Ideal for fueling up before a busy itinerary, breakfast sets a positive tone for the day ahead.", 'https://maps.google.com/maps?q=breakfast+near+me&z=14&output=embed'),
(2, NULL, 'Lunch', 'Special', '', 60, 0, "Take a midday break to enjoy a satisfying lunch, whether it's a light bite or a more substantial meal. This is the perfect time to recharge and refuel before continuing your day’s activities. From local specialties to international cuisine, lunch provides a chance to indulge in delicious flavors while relaxing and socializing.", 'https://maps.google.com/maps?q=lunch+near+me&z=14&output=embed'),
(3, NULL, 'Dinner', 'Special', '', 60, 0, "Unwind and savor a delicious evening meal, whether it's a casual dining experience or a refined gourmet dinner. This is the perfect time to reflect on the day's adventures, enjoy great company, and indulge in a variety of flavors. From local delicacies to international dishes, dinner offers a satisfying end to your day’s journey.", 'https://maps.google.com/maps?q=dinner+near+me&z=14&output=embed'),
(4, NULL, 'Hotel Check in', 'Special', '', 120, 0, "Arrive at your hotel and settle into your accommodations. During this time, you'll complete the check-in process, receive your room key, and get any necessary information about hotel amenities and services. It’s the first step in ensuring a comfortable and enjoyable stay, giving you the chance to relax and prepare for your upcoming activities.", ''),
(5, NULL, 'Hotel Check out', 'Special', '', 120, 0, "Wrap up your stay by completing the check-out process. This involves settling any outstanding bills, returning room keys, and confirming your departure details. It’s the final step before you head to your next destination, ensuring a smooth and hassle-free transition as you bid farewell to your accommodations.", ''),
(6, NULL, 'Explore City', 'Special', '', 120, 0, "Discover the highlights of the city as you embark on a sightseeing adventure. Whether you're strolling through historic streets, visiting landmarks, or immersing yourself in local culture, this event is all about experiencing the essence of the destination. Perfect for those wanting to soak in the sights, sounds, and flavors of the city at a relaxed pace.", ''),
(7, NULL, 'Fly in & Get Rental Car', 'Special', '', 180, 0, "Arrive at your destination airport, pick up your rental car, and get ready to hit the road. This event marks the start of your trip, offering the flexibility and convenience to explore the area at your own pace. Once you’ve collected your keys, you're all set to drive to your next adventure.", ''),
(8, NULL, 'Return Rental Car & fly out', 'Special', '', 180, 0, "Before heading home, return your rental car at the airport and complete the check-in process for your flight. This marks the final step of your journey, ensuring a smooth transition from your travels back to the airport for your departure.", '');

-- Krakow
INSERT INTO ItineraryEvent
VALUES
(10, 1, 'Market Square', "Exploring", 'https://visitkrakow.com/krakows-market-square/', 120, 0, "Explore the heart of Kraków by visiting the iconic Main Market Square (Rynek Główny). Surrounded by historic buildings, vibrant cafes, and street performers, this bustling square is a hub of local culture and activity. Don't miss landmarks like St. Mary's Basilica and the Cloth Hall, making it a must-see destination for any traveler.", 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2561.3022726208433!2d19.93418097694846!3d50.06190051526357!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47165b120455da67%3A0xc3c7f5071b750d33!2zUnluZWsgR8WCw7N3bnk!5e0!3m2!1sen!2sus!4v1731694464639!5m2!1sen!2sus'),
(11, 1, "St Mary's Basilica", 'Exploring', 'https://www.tripadvisor.com/Attraction_Review-g274772-d276733-Reviews-St_Mary_s_Basilica-Krakow_Lesser_Poland_Province_Southern_Poland.html', 180, 0, "One of the most famous of Poland's churches, this Gothic structure features two striking towers of different heights and surprisingly richly decorated insight, mostly thanks to the vibrant polychromy by great Polish artist Jan Matejko. The greatest masterpiece is though the Main Altar by Veit Stoss - a late Gothic illustration for St. Mary's and Jesus life, including scenes of Mary's death and Assumption. Please note that the church, including Main Altar, is currently under long maintenance and renovation works, which may be of some inconvenience.", 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3328.9518086410694!2d-112.07240652366369!3d33.45056204926007!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x872b1218c78ffd01%3A0x5b05f34d276e9848!2sSt.%20Mary&#39;s%20Roman%20Catholic%20Basilica!5e0!3m2!1sen!2sus!4v1732048400367!5m2!1sen!2sus'), 
(12, 1, 'Wawel Royal Castle', 'Exploring', 'https://www.tripadvisor.com/Attraction_Review-g274772-d276748-Reviews-Wawel_Royal_Castle-Krakow_Lesser_Poland_Province_Southern_Poland.html', 180, 0, "Explore the heart of Kraków by visiting the iconic Main Market Square (Rynek Główny). Surrounded by historic buildings, vibrant cafes, and street performers, this bustling square is a hub of local culture and activity. Don't miss landmarks like St. Mary's Basilica and the Cloth Hall, making it a must-see destination for any traveler.", 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2561.7172131183715!2d19.9329401269481!3d50.05412851582016!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47165bcb0775d95b%3A0x6c2b2c699b0abb2b!2sWawel%20Royal%20Castle!5e0!3m2!1sen!2sus!4v1732048454895!5m2!1sen!2sus'),
(13, 1, 'Auschwitz', "Guided Tours", 'https://www.auschwitz.org/en/visiting/', 180, 0, 'Learn the significance of Auschwitz-Birkenau State Museum when you visit with a guide who shares stories about its history, its former prisoners, and its survivors. Learn about the complex and its sad past as you walk through the grounds of Auschwitz I and Birkenau (Auschwitz II).', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d41004.80848928694!2d19.1781813760047!3d50.033833388555045!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47169585b5872e05%3A0xa0be85e480141fe8!2sMemorial%20and%20Museum%20Auschwitz%20I!5e0!3m2!1sen!2sus!4v1731694577678!5m2!1sen!2sus'),
(14, 1, 'Wieliczka Salt Mine Tour', "Guided Tours", 'https://www.tripadvisor.com/AttractionProductReview-g274772-d11452686-Wieliczka_Salt_Mine_Tour_from_Krakow_with_Ticket_Pickup_Options-Krakow_Lesser_Pola.html', 180, 0, "Even with just half a day to spare, get out of Kraków and visit one of Poland’s most cherished monuments on a guided tour of the Wieliczka Salt Mine. Get picked up from Kraków's city center for an easy journey to the UNESCO World Heritage Site, where you descend deep underground to explore a vast network of historic mining tunnels, saline lakes, and intricate salt sculptures carved over centuries.", 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d41018.332173768824!2d19.960889607855286!3d50.01799445815423!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4716417fc9e5376f%3A0xbf76bb461ef40071!2sWieliczka%20Salt%20Mine%20Tour%20From%20Krakow!5e0!3m2!1sen!2sus!4v1731694619855!5m2!1sen!2sus'),
(15, 1, "Schindler's Factory Museum", 'Guided Tours', 'https://www.tripadvisor.com/AttractionProductReview-g274772-d11991683-Schindler_s_Factory_Museum_Guided_Tour_in_English-Krakow_Lesser_Poland_Province_So.html', 120, 0, 'Learn about the life of Oskar Schindler, and the events that happened during Nazi-occupied Poland by visiting the Oskar Schindler Factory Museum. Discover the places that featured in the movie “Schindler’s List”, and find out about the heroic bravery and the many people that Oskar Schindler saved during World War II. Going on a guided tour allows you to skip the line, and enhances your experience with captivating commentary.', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1016.7602285697924!2d19.960700510165324!3d50.0474206989405!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47165b48b8f5e2db%3A0x32ef2980f3a497f9!2sOskar%20Schindler&#39;s%20Enamel%20Factory!5e0!3m2!1sen!2sus!4v1732047699123!5m2!1sen!2sus'),
(16, 1, 'Decius Park Krakow', 'Relaxing', 'https://krakow.travel/en/27546-krakow-decius-park', 180, 0, "One of Kraków’s oldest parks, it was designed in the 16th century by Italian architects on the commission of King Sigismund I the Old at the summer residence of the king’s secretary Justus Ludwik Decjusz. The park is still famous for its beautiful flora including ancient limes and hornbeams – the last remaining trees of the original wood destroyed during the First World War by the military units stationed here. The park covers an area of ten hectares, and it is home to the Decjusz Villa, a gallery of sculptures and paintings by Bronisław Chromy with a seasonal café, the Dom Erazma Hotel at the former annexe of the villa, and the Piwnica Pod Baranami sculpture designed by Bronisław Chromy.", 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2561.095195841664!2d19.86941247694858!3d50.06577881498583!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47165be70437317f%3A0x1a26581eb626e4cb!2sDecius%20Park!5e0!3m2!1sen!2sus!4v1732047416495!5m2!1sen!2sus'),
(17, 1, 'Beernarium Piwne Spa', 'Relaxing', 'http://krakow.piwnespa.com/', 180, 0, 'A tremendous attraction in the Krakow Main Square. Perfect for couples and groups of friends. The sauna, bath, tasting session, and leisure on straw are all great on rainy days and lazy evenings after a busy day. Experience the full relaxation offered by the Spa packages, which combine a sauna session, rejuvenating baths, tasting sessions, and heavenly leisure on straw.', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d330474.40417439176!2d19.621449038363323!3d49.676316688759215!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47165b964d368595%3A0x4b3de947a460f5ef!2sBeernarium%20Piwne%20Spa%20Krak%C3%B3w!5e0!3m2!1sen!2sus!4v1732047276205!5m2!1sen!2sus');

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