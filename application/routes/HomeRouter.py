from flask import Blueprint
from application.controllers.HomeController import HomeController

HomeRouter = Blueprint('home_controller', __name__)

HomeRouter.route('/', methods=['GET'])(HomeController.index)