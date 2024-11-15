from framework.Database import get_db

def getItinerarys(userID):
    """
    Gets a list of itinererys from a user id

    :param userID: user id
    :return: List of itineraries, or if a user has no itineraries then return None
    """

    db = get_db()
    # Possible TODO make it check by username idk yet
    Itinerarys = db.execute("SELECT * FROM Itinerary WHERE user_id=?;",(userID,)).fetchall()

    #if nothing is returned by db
    if len(Itinerarys) == 0:
        return None

    return Itinerarys

def getItinerary(uuid):
    """
    Gets an itinerery from a uuid

    :param uuid: unique id of an itinerary
    :return: List of each day for a schedule, or if a code is not found then return None
    """
    db = get_db()
    Itinerary = db.execute("SELECT * FROM Itinerary WHERE uuid4=?;",(uuid,)).fetchone()

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
    db = get_db()
    lastrowid = db.execute("INSERT INTO Itinerary (user_id, city_id, hotel_id, uuid4) VALUES (?, ?, ?, ?);",(user_id, city_id, hotel_id, str(uuid4))).lastrowid
    db.commit()
    return lastrowid

def addItineraryDetail(itinerary_id, event_id, day, time):
    db = get_db()
    lastrowid = db.execute("INSERT INTO ItineraryDetail (itinerary_id, event_id, day, time) VALUES (?, ?, ?, ?);",(itinerary_id, event_id, day, time)).lastrowid
    db.commit()
    return lastrowid