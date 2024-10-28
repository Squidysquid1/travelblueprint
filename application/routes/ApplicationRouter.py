from flask import Blueprint
from application.controllers.HomeController import HomeController
from application.controllers.ScheduleController import ScheduleController
from application.controllers.FaqController import FaqController
from application.controllers.CityPlanController import CityPlanController

HomeRouter = Blueprint('home_controller', __name__)
HomeRouter.route('/', methods=['GET'])(HomeController.index)

ScheduleRouter = Blueprint('schedule_controller', __name__)
ScheduleRouter.route('/schedule', methods=['GET'])(ScheduleController.index)

FaqRouter = Blueprint('faq_controller', __name__)
FaqRouter.route('/faq', methods=['GET'])(FaqController.index)

CityPlanRouter = Blueprint('cityplan_controller', __name__)
CityPlanRouter.route('/plan', methods=['GET'])(CityPlanController.index)