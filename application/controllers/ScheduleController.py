from flask import render_template

class ScheduleController:

    def index():
        data = {}
        
        return render_template('schedule.html', data=data)