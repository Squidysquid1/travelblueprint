from flask import render_template

class AccountController:

    def index():
        data = {}

        return render_template('construction.html', data=data)
      