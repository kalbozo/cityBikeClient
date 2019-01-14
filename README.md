# README

To run a query you have two options:

/search?[params] 
/stations?[params]

ex: https://client-bike-api.herokuapp.com/stations?city=denver

Search will return a list of networks based on your criteria. (Currently only 'city' is supported as a param)
Search caches a list of networks for 15min, so repeated searches of the same city will return much quicker.

Stations will return a large list of all Bike stations in the specified city. (Currently only 'city' is supported)
Stations will also cache the networks portion of the search, but station caching is not yet implemented. Adding this functionality would be very similiar to networks, with the additional association of searches -> networks -> stations


