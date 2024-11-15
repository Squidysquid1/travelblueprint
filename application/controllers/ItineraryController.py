from flask import render_template
from flask import request
from flask import redirect
from flask import g
from flask import url_for
from flask import flash
import uuid
import random
from application.models.ItineraryModel import getItinerary, getItinerarys, addItinerary, addItineraryDetail
from application.models.LocationModel import getCity, getHotels, getEvents

class ItineraryController:

    def index():
        data = {}
        
        # Error if no code is in param
        if request.args.get('code') is None:
            flash("Please generate an itinerary as one has not been generated for you yet")
            return redirect(url_for('cityplan_controller.index'))

        code  = request.args.get('code') # TODO: Validate this
        data["days"] = getItinerary(code)

        # Error if days is was not found
        if data["days"] is None:
            flash("Itinerary code is not valid")
            return redirect(url_for('cityplan_controller.index'))
        


        return render_template('schedule.html', data=data)

        


    def createItinerary():
        #Flash error if form not valid and redirect
        form = request.form.to_dict()

        if(not validForm(request.form.to_dict())):
            flash("Form is not valid, resubmit")
            return redirect(url_for('cityplan_controller.index'))

        days = int(form['days'])
        city = getCity(form['city'])
        uniqueCode = uuid.uuid4()
        hotels = [hotel for hotel in getHotels(city['name']) if hotel['location_pref'] == form['living_preference']]
        hotel = random.choice(hotels)
        itinerary_id = addItinerary(g.user['user_id'], city['city_id'], hotel['hotel_id'], uniqueCode)

        sites = getEvents(city['name'])
        relaxedSites = getEvents(city['name'], "Relaxing")


        #####################First Day#####################
        addItineraryDetail(itinerary_id, 7, 1, "8:00AM - 10:30AM") # fly in 
        addItineraryDetail(itinerary_id, 6, 1, "10:30AM - 12:00PM") # Explore
        addItineraryDetail(itinerary_id, 2, 1, "12:00PM - 1:30PM") # Lunch
        addItineraryDetail(itinerary_id, 4, 1, "2:00PM - 4:00PM") # Checkin
        addItineraryDetail(itinerary_id, relaxedSites[0]['event_id'], 1, "4:30PM - 6:30PM") # relaxing site 1
        addItineraryDetail(itinerary_id, 3, 1, "6:30PM - 8:00PM") # Dinner
        
        #####################Middle Days#####################
        # 2 - 4 sites
        for dayNum in range(2,days):
            addItineraryDetail(itinerary_id, 1, dayNum,"8:30AM - 9:30AM") # Breakfast
            addItineraryDetail(itinerary_id, 2, dayNum,"12:00PM - 1:00PM") # Lunch
            addItineraryDetail(itinerary_id, 3, dayNum,"6:00PM - 7:00PM") # Dinner
        #####################Last Day#####################
        addItineraryDetail(itinerary_id,1, days, "8:30AM - 9:30AM") # Breakfast
        addItineraryDetail(itinerary_id,5, days, "9:30AM - 10:30AM") # Checkout
        addItineraryDetail(itinerary_id,relaxedSites[1]['event_id'], days, "10:30AM - 12:30PM")
        addItineraryDetail(itinerary_id,2, days, "1:00PM - 2:00PM") # Lunch
        addItineraryDetail(itinerary_id,8, days, "2:00PM - 4:00PM") # fly out

        

        return redirect(url_for('itinerary_controller.index', code=uniqueCode))


# validate form
def validForm(formDict):
    if "city" not in formDict:
        return False
    if "days" not in formDict and formDict['days'] not in range(3,8):
        return False
    if "living_preference" not in formDict:
        return False

    return True
