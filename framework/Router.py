
class Router:

    def run(app):
        
        print("Web server starting")
        
        # Authentication code
        from . import Auth
        app.register_blueprint(Auth.bp)

        # Application routes
        from application.ApplicationRouter import routes

        for route in routes:
            app.register_blueprint(route)