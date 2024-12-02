from flask import render_template, request, redirect, g, url_for, flash

from framework.Auth import login_required
from application.models.ItineraryModel import getItineraryHotel, getItineraryDays, addItinerary, addItineraryDetail
from application.models.LocationModel import getCity, getHotels, getEvents, getSpecialEvents

from datetime import datetime, timedelta
import uuid
import random
import re

class ItineraryController:

    def index():
        data = {}
        
        # Error if no code is in param
        if request.args.get('code') is None or not validUuid4(request.args.get('code')) :
            flash("Please generate an itinerary as one has not been generated for you yet")
            return redirect(url_for('cityplan_controller.index'))

        code  = request.args.get('code')
        data["code"] = code
        data["days"] = getItineraryDays(code)
        data["hotel"] = getItineraryHotel(code)

        # Error if days is was not found
        if data["days"] is None:
            flash("Itinerary code is not valid")
            return redirect(url_for('cityplan_controller.index'))

        return render_template('schedule.html', data=data)
    
    def printItinerary():
        data = {}

        # Error if no code is in param
        if request.args.get('code') is None or not validUuid4(request.args.get('code')) :
            flash("Please generate an itinerary as one has not been generated for you yet")
            return redirect(url_for('cityplan_controller.index'))

        code  = request.args.get('code')
        data["days"] = getItineraryDays(code)
        data["hotel"] = getItineraryHotel(code)

        # Error if days is was not found
        if data["days"] is None:
            flash("Itinerary code is not valid")
            return redirect(url_for('cityplan_controller.index'))

        return render_template('print_schedule.html', data=data)


    @login_required
    def createItinerary():
        """Creates an Itinerary and redirects user after it is created."""
        #Flash error if form not valid and redirect
        form = request.form.to_dict()

        if(not validForm(request.form.to_dict())):
            flash("Form is not valid, resubmit")
            return redirect(url_for('cityplan_controller.index'))

        days = int(form['days'])
        city = getCity(form['city'])
        uniqueCode = uuid.uuid4()

        # get all hotels for the selected choice and get a random one from that list
        hotels = [hotel for hotel in getHotels(city['name']) if hotel['location_pref'] == form['living_preference']]
        hotel = random.choice(hotels)

        # add an itinerary and get the id to use in all events
        itinerary_id = addItinerary(g.user['user_id'], city['city_id'], hotel['hotel_id'], uniqueCode)

        # Get all relaxed events
        relaxedSites = getEvents(city['name'], "Relaxing")
        sites = [event for event in getEvents(city['name']) if event not in relaxedSites]
        specialEvents = getSpecialEvents()

        #could clean up with one MEGA loop but meh
        #####################First Day#####################
        curTime = "8:00AM"
        events = []
        events.append(findSpecialEvent(specialEvents, 7)) # fly in
        events.append(findSpecialEvent(specialEvents, 6)) # Explore
        events.append(findSpecialEvent(specialEvents, 2)) # Lunch
        events.append(findSpecialEvent(specialEvents, 4)) # Checkin
        events.append(relaxedSites[0]) # relaxing site 1
        events.append(findSpecialEvent(specialEvents, 3)) # Dinner

        for event in events:
            addItineraryDetail(itinerary_id, event['event_id'], 1, createRange(curTime, event['average_duration'])) 
            curTime = addMinutes(curTime, event['average_duration'])

        
        #####################Middle Days#####################        
        for dayNum in range(2,days):
            curTime = "8:00AM"
            events = []
            events.append(findSpecialEvent(specialEvents, 1)) # Breakfast
            events.append(sites.pop()) # site 1
            events.append(findSpecialEvent(specialEvents, 2)) # Lunch
            events.append(sites.pop()) # site 2
            events.append(findSpecialEvent(specialEvents, 3)) # Dinner

            for event in events:
                addItineraryDetail(itinerary_id, event['event_id'], dayNum, createRange(curTime, event['average_duration'])) 
                curTime = addMinutes(curTime, event['average_duration'])
        #####################Last Day#####################
        curTime = "8:00AM"
        events = []
        events.append(findSpecialEvent(specialEvents, 1)) # Breakfast
        events.append(findSpecialEvent(specialEvents, 5)) # Checkout
        events.append(relaxedSites[1]) # relaxing site 2
        events.append(findSpecialEvent(specialEvents, 2)) # Lunch
        events.append(findSpecialEvent(specialEvents, 8)) # fly out

        for event in events:
            addItineraryDetail(itinerary_id, event['event_id'], days, createRange(curTime, event['average_duration'])) 
            curTime = addMinutes(curTime, event['average_duration'])

        return redirect(url_for('itinerary_controller.index', code=uniqueCode))


# is validate form
def validForm(formDict):
    """Checks if the survey form has all needed valid elements and returns true if so"""
    
    if "city" not in formDict:
        return False
    if "days" not in formDict and formDict['days'] not in range(3,6):
        return False
    if "living_preference" not in formDict:
        return False

    return True


def validUuid4(uuid4):
    """Checks if valid UUID and returns true if so"""
    UUID_PATTERN = re.compile(r'^[\da-f]{8}-([\da-f]{4}-){3}[\da-f]{12}$', re.IGNORECASE)

    return bool(UUID_PATTERN.match(uuid4))


def addMinutes(start_time, minutes_to_add):
  """Adds minutes to a given start time."""

  # Convert start_time to datetime object if it's a string
  if isinstance(start_time, str):
    start_time = datetime.strptime(start_time, "%I:%M%p")

  # Calculate new time
  new_time = start_time + timedelta(minutes=minutes_to_add)

  return new_time.strftime("%I:%M%p")


def createRange(start_time, minutes_to_add):
    """Creates range of minutes"""

    if isinstance(start_time, str):
        start_time = datetime.strptime(start_time, "%I:%M%p")

    # Calculate new time
    new_time = start_time + timedelta(minutes=minutes_to_add)

    return start_time.strftime("%I:%M%p") + " - " + new_time.strftime("%I:%M%p")


def findSpecialEvent(events, id):
    """Finds and returns a special event in a list of events. If none is found None is returned"""
    for event in events:
        if event['event_id'] == id:
            return event

    return None