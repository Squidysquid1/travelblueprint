from flask import render_template

from application.models.LocationModel import getCities

class CityPlanController:    
    def index():
        data = {}

        data['cities'] = getCities()

        return render_template('city_plan.html', data=data)