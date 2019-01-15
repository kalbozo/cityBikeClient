# README

To run a query you have two options:

/search?[params] 
/stations?[params]

ex: https://client-bike-api.herokuapp.com/stations?city=denver&sort=free_bikes


'city' is a required parameter. There is no 'get all' for this api as that would be a very large set of data.
'sort' is optional, but will sort on the following criteria for stations:
       name
       timestamp
       longitude
       latitude
       empty_slots
       free_bikes
       id
       href
       
note that some sorts will not apply to both apis entry points. If a parameter does not exist, sort defaults to what the api responded with.

