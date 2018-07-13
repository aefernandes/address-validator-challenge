# Address Validator Coding Challenge

Having accurate addresses is important for Vote.org. In this challenge you will be given a 
very basic rails app that consists of a form with a field for 
- street address 
- city
- state 
- zip

The goal is to have the form validate the input to see if it forms a valid address
and if so, save the address components in the respective columns.

While not all addresses will have a value for every column it is important not to lose any
address information provided. For example if an address post direction value or unit value
is provided, those must be saved. Additionally any addresses that are not real addresses 
should not be saved. As a rule, all addresses should have
 - house number
 - street name 
 - city 
 - state (saved as 2 letter state abbreviation)
 - 5 digit zip code (only numbers) 

It is your job to update the Address model and controller so that all validated 
addresses are saved to the database and no invalid addresses are saved. The Address model
also has a `#to_s` method that needs to be filled in so that it returns the address as 
a string. 
 
While front end validation and feedback to the user is expected, you should not rely only on 
front end validations. Additionally a suggested layout has been included in a file labeled 
"wireframe.png". Feel free to use this mock or come up with a different design of the frontend. 

A few test cases have been provided to help get you started. You are encouraged to write more
tests as you go, but DO NOT delete any of the existing tests. Also, you may not change the
schema.

## Prerequisites

You'll need the following installed on your system:
1. ruby
2. rails
3. sqlite3

Instructions can be found here: http://guides.rubyonrails.org/getting_started.html#installing-rails

## Getting started

To run the project as is:
1. `bundle install`
2. `rake db:create`
3. `rake db:migrate`
4. `rails s`

To run the tests:
1. `rails generate rspec:install`
  (When prompted to overwrite spec/spec_helper.rb enter `n`)
2. `rspec` (or `bundle exec rspec`)

If everything is set up properly you should see `10 examples, 7 failures` to start. 
 
Here are some useful resources for Ruby On Rails:
- https://www.tutorialspoint.com/ruby-on-rails/rails-controllers.htm
- http://guides.rubyonrails.org/active_model_basics.html
- http://guides.rubyonrails.org/action_controller_overview.html
- http://guides.railsgirls.com/app
- https://www.railstutorial.org/book/toy_app
- https://relishapp.com/rspec/rspec-rails/v/3-7/docs (docs for rspec testing)

Information on Address standards / validations:
- https://pe.usps.com/text/pub28/28c1_001.htm

Here are some services that can be used for address validation:
- https://developers.google.com/maps/documentation/geocoding/intro
- https://wiki.openstreetmap.org/wiki/Nominatim
- https://developers.arcgis.com/rest/geocode/api-reference/overview-world-geocoding-service.htm
If you need an api key or are interested in using another service please let us know.

Your finished project should:
- validate addresses
- not save any invalid addresses
- be styled on the front end
- validate fields on the front end
- display feedback to the user
- be well-tested

When submitting the project please answer the following questions:
 1. What gems if any did you choose to use and why?

    I chose to use Bootstrap for front-end components because of ease of designing, and familiarity given time constraints. I also installed JQuery as a dependency.

    I installed Geocoder, a well-documented and commonly-downloaded gem, to verify that the addresses submitted were real locations. I also relied on StreetAddress to handle regex parsing of the user-inputted street addresses.  

    Finally, I installed wdm to avoid a warning from rake.

 2. Were there any specific challenges or struggles you faced along the way?

    As this was my first time working with Ruby, I spent a good deal of time becoming familiar with Rails and RSpec. I found myself translating back and forth between other concepts I was familiar with to better understand this project.
    
    Additionally, when validating street addresses, I found that the standardized format used by USPS cannot be expressed completely using regular expressions, as there is no context-free grammar for it. Thus, the street address validation has some inherent limitations. After much research into other APIs and services, it seems that there are certain ones worth paying for, but if we want to fit the USPS standard, I'd like to know if there is a way to abide by their license terms.

    I also spent a lot of time thinking about the end "user" for this project, in an attempt to design a site that would best fit their needs. I debated with myself over design decisions such as the choice to add a state selection dropdown instead of a text field. 


 3. Is there anything you'd want to improve or optimize if you had more time?

    I would want to investigate the use of other street parsing and geocoding services, in particular SmartyStreets. I would also add more detailed and explicit feedback for the user when there is invalid input, such as differentiating between empty fields and values that don't match a given pattern. I would also want to save their input so it could be edited after they received an error message. More generally, I would add far more tests, especially JS unit tests. 

    Additionally, one reach idea I implemented on a separate branch is forgoing text-parsing at all in favor of using the Google Places API's autocomplete feature. This allows the user to start typing an address and select the correct one from Google's dropdown. I'd be interested to conduct user research to see how people interact with the different methods of address validation.



 4. If you were to take this project to production, what would be on your list of things to do?

    I would want to conduct more extensive security and accessibility testing on the front end, especially across browsers. I would want to automate testing and builds, add more logging, fix the rate limiting on the geocoding API, and run load tests. 





