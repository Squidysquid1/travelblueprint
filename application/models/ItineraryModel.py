from framework.Database import get_db


def getItinerarys(userID):
    """
    Gets a list of itinererys from a user id.
    Args:
        userID (int): users id
    Returns:
        List of itineraries, or if a user has no itineraries then return None.
    """ 
    db = get_db()

    Itinerarys = db.execute("SELECT * FROM Itinerary WHERE user_id=?;",(userID,)).fetchall()

    #if nothing is returned by db
    if len(Itinerarys) == 0:
        return None

    return Itinerarys


def getItineraryHotel(uuid4):
    """
    Gets an itinerery hotel from a uuid.
    Args:
        uuid4 (str): unique id of an itinerary 
    Returns:
        An itinerary listing, or if a code is not found then return None.
    """
    db = get_db()
    return  db.execute("SELECT * FROM Itinerary JOIN Hotel ON (Itinerary.hotel_id = Hotel.hotel_id) WHERE uuid4=?;",(uuid4,)).fetchone()

def getItineraryDays(uuid4):
    """
    Gets an itinerery from a uuid.
    Args:
        uuid4 (str): unique id of an itinerary 
    Returns:
        List of each day for a schedule, or if a code is not found then return None.
    """
    db = get_db()
    Itinerary = db.execute("SELECT * FROM Itinerary WHERE uuid4=?;",(uuid4,)).fetchone()

    # If there is itinerary with a valid uuid
    if Itinerary is not None:
        days = []

        for dayNum in range(1,8):

            day = db.execute("SELECT * FROM ItineraryDetail Join ItineraryEvent ON (ItineraryDetail.event_id = ItineraryEvent.event_id) WHERE itinerary_id=? AND day=?;",(Itinerary['itinerary_id'], dayNum)).fetchall()
            
            # if nothing is returned
            if len(day) == 0:
                break

            days.append(day)
        
        return days
    return None


def addItinerary(user_id, city_id, hotel_id, uuid4):
    """
    Adds a record for Itinerary.
    Args:
        user_id (int): Users id
        city_id (int): City id
        hotel_id (int): Hotel id
        uuid4 (str): unique id of an itinerary 
    Returns:
        id of added record.
    """
    db = get_db()
    lastrowid = db.execute("INSERT INTO Itinerary (user_id, city_id, hotel_id, uuid4) VALUES (?, ?, ?, ?);",(user_id, city_id, hotel_id, str(uuid4))).lastrowid
    db.commit()
    return lastrowid


def addItineraryDetail(itinerary_id, event_id, day, time):
    """
    Adds a record for Itinerary detail and returns id.
    Args:
        itinerary_id (int): Itinerary id
        event_id (int): Event id
        day (int): day num
        time (str): time range `8:00AM - 2:00PM`
    Returns:
        id of added record.
    """
    db = get_db()
    lastrowid = db.execute("INSERT INTO ItineraryDetail (itinerary_id, event_id, day, time) VALUES (?, ?, ?, ?);",(itinerary_id, event_id, day, time)).lastrowid
    db.commit()
    return lastrowid