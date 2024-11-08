from flask import render_template
from flask import request
from flask import redirect
from flask import url_for
from flask import flash
import uuid
from application.models.ItineraryModel import getItinerary, getItinerarys

class ItineraryController:

    def index():
        data = {}
        
        # Error if no code is in param
        if request.args.get('code') is None:
            flash("Please generate an itinerary as one has not been generated for you yet")
            return redirect(url_for('cityplan_controller.index'))

        code  = int(request.args.get('code'))
        data["days"] = getItinerary(code)

        # Error if days is was not found
        if data["days"] is None:
            flash("Itinerary code is not valid")
            return redirect(url_for('cityplan_controller.index'))
        


        return render_template('schedule.html', data=data)

        


    def createItinerary():
        #Flash error if form not valid and redirect
        if(not validForm(request.form.to_dict())):
            flash("Form is not valid, resubmit")
            return redirect(url_for('cityplan_controller.index'))

        # day one will be a light day getting over jetlag etc and checking into hotel in morning # and getting rental car 
        # Fly in!
        # Get rental car preferably near airport add note if they arent comfortable with driving in a different country then having to taxi everywhere will be very expensive 
        # 2pm-4pm check into hotel and get settled in
        
        # mid days will be heavy
        # 2 - 4 sites

        # last day will be light and include checking out of hotel right before lunch include car rental 
        # one site before
        # 11am checkout
        # 12pm lunch
        # 4pm return car and fly home!
        uniqueCode = uuid.uuid4()
        

        return redirect(url_for('itinerary_controller.index', code="123"))


# validate form
def validForm(formDict):
        if "city" not in formDict:
            return False
        if "days" not in formDict and formDict['days'] not in range(3,8):
            return False
        if "living_preference" not in formDict:
            return False

        return True
