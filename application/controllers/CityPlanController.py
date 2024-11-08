from flask import render_template
from application.models.LocationModel import getCitys


class CityPlanController:

    def index():
        data = {}
        # put cities into the template  

        data['cities'] = getCitys()

        return render_template('city_plan.html', data=data)