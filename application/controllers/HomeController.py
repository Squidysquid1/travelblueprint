from flask import render_template

class HomeController:

    def index():
        data = {}

        return render_template('home.html', data=data)
      