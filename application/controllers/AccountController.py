from flask import render_template, g

from framework.Auth import login_required
from application.models.ItineraryModel import getItinerarys

class AccountController:

    @login_required
    def index():
        data = {}
        data['itineraries'] = getItinerarys(g.user['user_id'])
        
        return render_template('account.html', data=data)
      