from flask import render_template

class HomeController:

    def index():
        data = {}
        data['testvar'] = "put this cool data in here"
        data['cooler_data'] = "put this really neat data in here"

        return render_template('home.html', data=data)
      