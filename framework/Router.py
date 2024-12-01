from framework import Auth
from application.ApplicationRouter import routes

class Router:

    def run(app):
        print("Routes being created...")
        
        # Auth Routes
        app.register_blueprint(Auth.bp)

        # Application routes
        for route in routes:
            app.register_blueprint(route)

        print("Routes successfully created!")