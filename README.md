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
$ flask run --debug
```
In flask, Default port is `5000`

### Run flask for production
App has not been tested in production and not yet ready for widespread use as still in alpha

[](https://flask.palletsprojects.com/en/stable/deploying/)

** Run with gunicorn **

```
$ gunicorn -w 4 -b 127.0.0.1:5000 run:app

```


## Flask Configuration

### Configuring From Files
Configure in config.py file


## Flask Application Structure 
* update with my tree left in here as example
```
.
|──────application/
| |────api/
| | |────Controller/
| | |────Model/
| | |────View/
| |────Framework/
| |────util/
|──────run.py
|──────tests/

```


 



## Reference

Offical Website

- [Flask](https://flask.palletsprojects.com/en/stable/)

-[Flask - Tutorial](https://flask.palletsprojects.com/en/stable/tutorial/)

- [gunicorn](http://gunicorn.org/)

