# TravelBlueprint
> [!WARNING]  
> THIS PRODUCT IS IN EARLY ALPHA AND SHOULD NOT BE USED IN PRODUCTION

An easy to use travel itinerary generator

## Installation
Install latest version of python3 and ensure pip is installed at download and you add python to path.

Install python3:
https://www.python.org/downloads/

Install with pip:
(Please make sure you are in the directory of the repository when running)
```
$ pip install -r requirements.txt
```
Restart your terminal to make the flask command accessible.
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
├── application/
│   ├── ApplicationRouter.py
│   ├── controllers/
│   │   ├── AccountController.py
│   │   ├── CityPlanController.py
│   │   ├── FaqController.py
│   │   ├── HomeController.py
│   │   └── ItineraryController.py
│   ├── models/
│   │   ├── FaqModel.py
│   │   ├── ItineraryModel.py
│   │   └── LocationModel.py
│   ├── static/
│   └── views/
├── app.py
├── config.py
├── data.db
├── framework/
│   ├── Auth.py
│   ├── Database.py
│   ├── Router.py
│   └── schema.sql
├── README.md
└── requirements.txt
```

## Debugging

In my development debugging was ran by running relevant pieces of code and testing out what ive been developing. If any bugs came about then I tracked my major bugs through an excel spreadsheet with expected resolution date.

## Reference

Offical Website

- [Flask](https://flask.palletsprojects.com/en/stable/)

- [Flask - Tutorial](https://flask.palletsprojects.com/en/stable/tutorial/)

- [gunicorn - Can be used for production](http://gunicorn.org/)

