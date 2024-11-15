from framework.Database import get_db
import random

def getCities():
    """
    Gets a list of cities.
    Args:
        None
    Returns:
        List of cities, OR None if no cities found.
    """
    db = get_db()
    execute = db.execute("SELECT * FROM City;")

    cities = execute.fetchall()

    if len(cities) == 0:
        return None

    return cities

def getCity(cityName):
    """
    Gets a city given a city name.
    Args:
        cityName (str): the name of the city
    Returns:
        city, OR None if no city found.
    """
    db = get_db()
    execute = db.execute("SELECT * FROM City WHERE name=?;", (cityName,))

    city = execute.fetchone()

    return city

def getHotels(cityName):
    """
    Gets a Hotels for a given city.
    Args:
        cityName (str): the name of the city
    Returns:
        List of hotels, OR None if no hotels found.
    """
    db = get_db()
    execute = db.execute("SELECT * FROM Hotel JOIN City ON (Hotel.city_id = City.city_id) WHERE City.name = ? ;", (cityName,))

    hotels = execute.fetchall()

    if len(hotels) == 0:
        return None

    return hotels

def getHotel(id):
    pass


def getEvents(cityName, category=None):
    """
    Gets a events for a given city and optionally the category of event
    Args:
        cityName (str): the name of the city
        category (opt str): Exploring, Relaxing, Guided Tours
    Returns:
        List of events, OR None if no events found.
    """ 
    db = get_db()

    sql = "SELECT * FROM ItineraryEvent JOIN City ON (ItineraryEvent.city_id = City.city_id) WHERE City.name = ? "
    param = [cityName]
    if category:
        sql += "AND category=?"
        param.append(category) 
    sql += ";"
    
    execute = db.execute(sql, param)
    events = execute.fetchall()

    if len(events) == 0:
        return None

    random.shuffle(events)
    return events

def getSpecialEvents():
    """
    Gets all special events.
    Args:
        None
    Returns:
        List of Special events, OR None if no events found.
    """ 
    db = get_db()
    execute = db.execute("SELECT * FROM ItineraryEvent WHERE category = 'Special';")

    events = execute.fetchall()

    if len(events) == 0:
        return None

    return events