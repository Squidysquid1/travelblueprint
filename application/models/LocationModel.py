def getCitys():
    """
    DROP TABLE IF EXISTS `City`;
    CREATE TABLE `City` (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(255),
    country VARCHAR(255), -- Could make country a separate table
    img VARCHAR(255),
    desc TEXT
    );
    """
    cities = []
    cities.append( dict(name = "Krakow", country="Poland", img = "/img/countries/poland/krakow/card_icon.jpg", desc ="Experience a land of wonder!") )
    cities.append( dict(name = "Warsaw", country="Poland", img = "/img/countries/poland/warsaw/card_icon.jpg", desc ="Experience a land of wonder!") )
    cities.append( dict(name = "Yosemite", country="USA", img = "/img/countries/usa/yosemite/card_icon.jpg", desc ="Experience a land of wonder!") )
    cities.append( dict(name = "London", country="United Kingdom", img = "/img/countries/united_kingdom/london/card_icon.jpg", desc ="Experience a land of wonder!") )
    cities.append( dict(name = "Berlin", country="Germany", img = "/img/countries/germany/berlin/card_icon.webp", desc ="Experience a land of wonder!") )
    cities.append( dict(name = "Oslo", country="Norway", img = "/img/countries/norway/oslo/card_icon.png", desc ="Experience a land of wonder!") )
    cities.append( dict(name = "Paris", country="France", img = "/img/countries/france/paris/card_icon.jpg", desc ="Experience a land of wonder!") )
    cities.append( dict(name = "Rome", country="Italy", img = "/img/countries/italy/rome/card_icon.jpg", desc ="Experience a land of wonder!") )
    return cities

def getHotels(cityName):
    """
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
    """
    hotels = []
    if cityName == "Krakow":
        hotels.append( dict(name = "Wyndham Grand Krakow Old Town", desc="insert desc", locationPref="city",url="https://www.wyndhamhotels.com/wyndham-grand/cracow-poland/wyndham-grand-krakow-old-town/overview",isPreffered="1"))
        hotels.append( dict(name = "Niebieski Art Hotel & Spa", desc="insert desc", locationPref="country",url="http://www.niebieski.com.pl/",isPreffered="0"))
    else:
        hotels = None

    return hotels



def getSites(cityName):
    """
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
    """
    # category type: Exploring, Relaxing, Guided Tours 
    sites = []
    if cityName == "Krakow":
        sites.append( dict(name = "auschwitz", desc="insert Desc", category = "Guided Tours", averageDuration="180", url="https://www.auschwitz.org/en/visiting/", isPreffered="0"))
        sites.append( dict(name = "Wieliczka Salt Mine Tour", desc="insert Desc", category = "Guided Tours", averageDuration="180",url="https://www.tripadvisor.com/AttractionProductReview-g274772-d11452686-Wieliczka_Salt_Mine_Tour_from_Krakow_with_Ticket_Pickup_Options-Krakow_Lesser_Pola.html", isPreffered="0"))
        sites.append( dict(name = "Market Square", desc="insert Desc", category = "Exploring", averageDuration="120", url="https://visitkrakow.com/krakows-market-square/", isPreffered="0"))
        sites.append( dict(name = "", desc="insert Desc", category = "", averageDuration="", url="", isPreffered="0"))
        sites.append( dict(name = "", desc="insert Desc", category = "", averageDuration="", url="", isPreffered="0"))
        sites.append( dict(name = "", desc="insert Desc", category = "", averageDuration="", url="", isPreffered="0"))
        sites.append( dict(name = "", desc="insert Desc", category = "", averageDuration="", url="", isPreffered="0"))
        sites.append( dict(name = "", desc="insert Desc", category = "", averageDuration="", url="", isPreffered="0"))
        sites.append( dict(name = "", desc="insert Desc", category = "", averageDuration="", url="", isPreffered="0"))
        sites.append( dict(name = "", desc="insert Desc", category = "", averageDuration="", url="", isPreffered="0"))

    else:
        sites = None

    return sites