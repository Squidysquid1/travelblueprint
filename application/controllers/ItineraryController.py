from flask import render_template
from flask import request

class ItineraryController:

    def index():
        data = {}

        return render_template('home.html', data=data)
      

    def createItinerary():
        
        print(request.form.get("name"))

        return "asd"