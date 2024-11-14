from flask import render_template
from flask import g

from application.models.ItineraryModel import getItinerarys

class AccountController:

    def index():
        data = {}
        data['itineraries'] = getItinerarys(g.user['user_id'])
        
        return render_template('account.html', data=data)
      