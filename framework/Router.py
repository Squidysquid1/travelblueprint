
class Router:

    def run(app):
        
        print("Web server starting")
        
        # Authentication code
        from . import Auth
        app.register_blueprint(Auth.bp)

        #Home
        from application.routes.ApplicationRouter import HomeRouter
        app.register_blueprint(HomeRouter, url_prefix="/")

        #Schedule
        from application.routes.ApplicationRouter import ScheduleRouter
        app.register_blueprint(ScheduleRouter, url_prefix="/")

        #Faq
        from application.routes.ApplicationRouter import FaqRouter
        app.register_blueprint(FaqRouter, url_prefix="/")

        #Plan
        from application.routes.ApplicationRouter import CityPlanRouter
        app.register_blueprint(CityPlanRouter, url_prefix="/")

        from application.routes.ApplicationRouter import ItineraryRouter
        app.register_blueprint(ItineraryRouter, url_prefix="/")
        