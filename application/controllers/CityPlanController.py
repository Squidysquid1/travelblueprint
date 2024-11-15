from flask import render_template
from application.models.LocationModel import getCities


class CityPlanController:

    def index():
        data = {}
        # put cities into the template  

        data['cities'] = getCities()

        return render_template('city_plan.html', data=data)