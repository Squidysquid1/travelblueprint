from flask import render_template
from flask import request
from flask import redirect
from flask import url_for

class ScheduleController:

    def index():

        if request.args.get('code') == "123":
            data = {}
            days = []

            day1Schedule = [dict(time="9:00 AM - 10:00 AM", title="Registration and Coffee", information="Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                            dict(time="10:00 AM - 11:00 AM", title="Explore City", information="Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                            dict(time="11:00 AM - 12:30 PM", title="Get rental car", information="Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                            dict(time="12:30 PM - 1:30 PM", title="Lunch break", information="Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                            dict(time="6:00 PM - 7:00 PM", title="Dinner", information="Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")]

            days.append(day1Schedule)

            day2Schedule = [dict(time="9:00 AM - 10:00 AM", title="Eat breakfast", information="Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                            dict(time="10:00 AM - 11:00 AM", title="Go Hiking", information="Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                            dict(time="11:00 AM - 12:30 PM", title="Get rental car", information="Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                            dict(time="12:30 PM - 1:30 PM", title="Lunch break", information="Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                            dict(time="6:00 PM - 7:00 PM", title="Dinner", information="Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")]

            days.append(day2Schedule)

            day3Schedule = [dict(time="9:00 AM - 10:00 AM", title="Something else", information="Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                            dict(time="10:00 AM - 11:00 AM", title="Explore City", information="Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                            dict(time="6:00 PM - 7:00 PM", title="Dinner", information="Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")]

            days.append(day3Schedule)

            day4Schedule = [dict(time="9:00 AM - 10:00 AM", title="Something else", information="Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                            dict(time="10:00 AM - 11:00 AM", title="Explore City", information="Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                            dict(time="11:00 AM - 12:30 PM", title="Get rental car", information="Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                            dict(time="12:30 PM - 1:30 PM", title="Lunch break", information="Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                            dict(time="6:00 PM - 7:00 PM", title="Dinner", information="Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")]

            days.append(day4Schedule)
         
            
            data["days"] = days

            return render_template('schedule.html', data=data)

        return redirect(url_for('cityplan_controller.index'))