# TravelBlueprint
> [!WARNING]  
> THIS PRODUCT IS IN EARLY ALPHA AND SHOULD NOT BE USED IN PRODUCTION

An easy to use travel itinerary generator

## Installation
Install latest version with python3 and ensure pip is installed at download

Install with pip:
```
$ pip install -r requirements.txt
```

## Run Flask
### Run flask for develop
```
#Initilize Database
$ flask init-db
#Run Application
$ flask run --debug
```
In flask, Default port is `5000`

### Run flask for production
> [!IMPORTANT]  
> App has not been tested in production and not yet ready for widespread use as still in alpha.

Please refer to the following for info for deploying a flask application.

[https://flask.palletsprojects.com/en/stable/deploying/](https://flask.palletsprojects.com/en/stable/deploying/)


## Flask Configuration

### Configuring From Files
Configure in config.py file

### Test admin user
> [!NOTE] 
> Admin users have limited functionaility in its current state.

```
Username: test
Password: test
```

## Flask Application Structure 
```
.
├── application
│   ├── controllers
│   │   ├── AccountController.py
│   │   ├── CityPlanController.py
│   │   ├── FaqController.py
│   │   ├── HomeController.py
│   │   └── ItineraryController.py
│   ├── models
│   │   ├── ItineraryModel.py
│   │   ├── LocationModel.py
│   │   └── UserModel.py
│   ├── routes
│   │   └── ApplicationRouter.py
│   ├── static
│   └── views
│       ├── auth
│       │   ├── login.html
│       │   └── register.html
│       ├── city_plan.html
│       ├── common
│       │   ├── base.html
│       │   ├── footer.html
│       │   └── header.html
│       ├── construction.html
│       ├── faq.html
│       ├── home.html
│       └── schedule.html
├── app.py
├── config.py
├── framework
│   ├── Auth.py
│   ├── Database.py
│   ├── Router.py
│   └── schema.sql
├── README.md
└── requirements.txt
```

## Reference

Offical Website

- [Flask](https://flask.palletsprojects.com/en/stable/)

- [Flask - Tutorial](https://flask.palletsprojects.com/en/stable/tutorial/)

- [gunicorn - Can be used for production](http://gunicorn.org/)

