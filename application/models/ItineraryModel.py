



def getItinerarys(userID):
    pass

def getItinerary(code):
    """
    Gets an itinerery from a hash

    :param code: hash of an itinerary
    :return: List of each day for a schedule, or if a code is not found then return None
    """

    days = []

    if code is 123:
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
    else:
        return None

    return days