from flask import render_template

class CityPlanController:

    def index():
        data = {}
        # put cities into the template  
        cities = []
        cities.append( dict(name = "Krakow", country="Poland", img = "/img/countries/poland/krakow/card_icon.jpg", desc ="Experience a land of wonder!") )
        cities.append( dict(name = "Warsaw", country="Poland", img = "/img/countries/poland/warsaw/card_icon.jpg", desc ="Experience a land of wonder!") )
        cities.append( dict(name = "Yosemite", country="USA", img = "/img/countries/usa/yosemite/card_icon.jpg", desc ="Experience a land of wonder!") )
        cities.append( dict(name = "London", country="United Kingdom", img = "/img/countries/united_kingdom/london/card_icon.jpg", desc ="Experience a land of wonder!") )
        cities.append( dict(name = "Berlin", country="Germany", img = "/img/countries/germany/berlin/card_icon.webp", desc ="Experience a land of wonder!") )
        cities.append( dict(name = "Oslo", country="Norway", img = "/img/countries/norway/oslo/card_icon.png", desc ="Experience a land of wonder!") )
        cities.append( dict(name = "Paris", country="France", img = "/img/countries/france/paris/card_icon.jpg", desc ="Experience a land of wonder!") )
        cities.append( dict(name = "Rome", country="Italy", img = "/img/countries/italy/rome/card_icon.jpg", desc ="Experience a land of wonder!") )
       

        data['cities'] = cities

        return render_template('city_plan.html', data=data)