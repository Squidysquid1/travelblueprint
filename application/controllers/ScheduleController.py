from flask import render_template

class ScheduleController:

    def index():
        data = {}
        days = []

        day1Schedule = [dict(time="9:00 AM - 10:00 AM", title="Registration and Coffee", information="Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                        dict(time="10:00 AM - 11:00 AM", title="Explore City", information="Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                        dict(time="11:00 AM - 12:30 PM", title="Get rental car", information="Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                        dict(time="12:30 PM - 1:30 PM", title="Lunch break", information="Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                        dict(time="6:00 PM - 7:00 PM", title="Dinner", information="Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")]

        days.append(day1Schedule)

        day2Schedule = [dict(time="9:00 AM - 10:00 AM", title="Something else", information="Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                        dict(time="10:00 AM - 11:00 AM", title="Explore City", information="Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                        dict(time="11:00 AM - 12:30 PM", title="Get rental car", information="Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                        dict(time="12:30 PM - 1:30 PM", title="Lunch break", information="Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                        dict(time="6:00 PM - 7:00 PM", title="Dinner", information="Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")]

        days.append(day2Schedule)
        
        data["days"] = days

        return render_template('schedule.html', data=data)