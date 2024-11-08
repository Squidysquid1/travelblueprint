from flask import Blueprint
from application.controllers.HomeController import HomeController
from application.controllers.FaqController import FaqController
from application.controllers.CityPlanController import CityPlanController
from application.controllers.ItineraryController import ItineraryController
from application.controllers.AccountController import AccountController

routes = []

HomeRouter = Blueprint('home_controller', __name__)
HomeRouter.route('/', methods=['GET'])(HomeController.index)
routes.append(HomeRouter)

FaqRouter = Blueprint('faq_controller', __name__)
FaqRouter.route('/faq', methods=['GET'])(FaqController.index)
routes.append(FaqRouter)

CityPlanRouter = Blueprint('cityplan_controller', __name__)
CityPlanRouter.route('/plan', methods=['GET'])(CityPlanController.index)
routes.append(CityPlanRouter)

ItineraryRouter = Blueprint('itinerary_controller', __name__)
ItineraryRouter.route('/schedule', methods=['GET'])(ItineraryController.index)
ItineraryRouter.route('/create-itinerary', methods=['POST'])(ItineraryController.createItinerary)
routes.append(ItineraryRouter)

AccountRouter = Blueprint('account_controller', __name__)
AccountRouter.route('/account', methods=['GET'])(AccountController.index)
routes.append(AccountRouter)