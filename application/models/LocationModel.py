from framework.Database import get_db

def getCitys():
    db = get_db()
    execute = db.execute("SELECT * FROM City;")

    cities = []
    cities = execute.fetchall()

    return cities

def getCity(id):
    pass

def getHotels(cityName):
    db = get_db()
    execute = db.execute("SELECT * FROM Hotel JOIN City ON (Hotel.cityID = City.id) WHERE City.name = ? ;", (cityName,))

    hotels = []
    hotels = execute.fetchall()

    return hotels

def getHotel(id):
    pass


def getSites(cityName):

    # category type: Exploring, Relaxing, Guided Tours 
    db = get_db()
    execute = db.execute("SELECT * FROM Site JOIN City ON (Site.cityID = City.id) WHERE City.name = ? ;", (cityName,))

    sites = []
    sites = execute.fetchall()

    return sites