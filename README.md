# WeatherApp

This is a Ruby on Rails app developed using data from [National Weather Service](https://api.weather.gov) public API to get weather data for given location. 

# Gems Used:
geocoder: Provides geocoding solution based on the address
bootstrap: bootstrap v5 for CSS
oj: Faster JSON parsing
httparty: Making API call to external end points
rspec-rails: rspec for testing
webmock: Web mock to stub requests during testing
vcr: Used to make an actual API call and test result which can be played later for testing

## Cache:

Caching mechanism has been used to store weather forecast data for 30 minutes. Uses rails file_store based cache for developmental purposes.

## RSpec Test Cases

Test cases have been implemented using Rspec

## Notes & caveats

* There is a stateless app so no database is required.
* Developed using ruby 3.2.2 with rails 6.1

## Contact

* siva.rorm9@gmail.com