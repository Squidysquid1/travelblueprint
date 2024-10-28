from flask import render_template

class CityPlanController:

    def index():
        data = {}
        
        return render_template('city_plan.html', data=data)