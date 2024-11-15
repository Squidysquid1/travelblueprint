from framework.Database import get_db
import random

def getCities():
    db = get_db()
    execute = db.execute("SELECT * FROM City;")

    cities = []
    cities = execute.fetchall()

    return cities

def getCity(cityName):
    db = get_db()
    execute = db.execute("SELECT * FROM City WHERE name=?;", (cityName,))

    city = execute.fetchone()

    return city

def getHotels(cityName):
    db = get_db()
    execute = db.execute("SELECT * FROM Hotel JOIN City ON (Hotel.city_id = City.city_id) WHERE City.name = ? ;", (cityName,))

    hotels = []
    hotels = execute.fetchall()
    
    return hotels

def getHotel(id):
    pass


def getEvents(cityName, category=None):
    # category type: Exploring, Relaxing, Guided Tours 
    db = get_db()
    sql = "SELECT * FROM ItineraryEvent JOIN City ON (ItineraryEvent.city_id = City.city_id) WHERE City.name = ? "
    param = [cityName]
    if category:
        sql += "AND category=?"
        param.append(category) 
    sql += ";"
    
    execute = db.execute(sql, param)
    events = execute.fetchall()
    random.shuffle(events)
    return events