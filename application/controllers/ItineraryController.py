from flask import render_template
from flask import request
from flask import redirect
from flask import url_for
from flask import jsonify

def validateForm(formDict):
        if "name" not in formDict:
            return False
        if "city" not in formDict:
            return False
        if "living_preference" not in formDict:
            return False

        return True

class ItineraryController:

    def index():
        data = {}

        return render_template('home.html', data=data)

    def createItinerary():
        if(validateForm(request.form.to_dict())):
            flash("Form is not valid resubmit")
            return redirect(url_for('plan'))

        return redirect(url_for('schedule_controller.index', code="123"))


    