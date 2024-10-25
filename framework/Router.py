
class Router:

    def run(app):
        
        print("Web server starting")
        
        from . import Auth
        app.register_blueprint(Auth.bp)

        #Index Page!
        from application.routes.HomeRouter import HomeRouter
        app.register_blueprint(HomeRouter, url_prefix="/")