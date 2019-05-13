## About the project

I like travelling a lot, and I always try to record my journey in a simple way.
This mini-journi web application is a dynamic CRUD application built by using ActiveRecords from Ruby on Rails. It is designed to help you create your own blog by keep track of the places you visited and some nice food you had during a day. You can upload your photo and add a description to it. At the end of the day, all the info you entered will be generated into a blog for the day.

##  Project Idea

Every time when I try to sit down and write sth about my trip, I gave up halfway. If we can just record this little by little while having the trip, things are much easier. You don't have to worry about missing the part and eventually once you have all the little piece of information, this app will put everything together for you! Awesome!


##  view project here:[mini-journi](https://mini-journi.herokuapp.com/) 

## Project Progress
#### Day 1 
Come up with idea and basic function for the app

#### Day 2

Build backend routes using ruby sinatra including login 

#### Day 3 

Add google API

#### Day 4

Add CSS and deployment

## Project challenges

#### 1 geting confused with different route and redirection

When I have different routes for similar Path, sometimes it confused me which file or what the page is linked to and what variables needed for the erb file. I practise a few time, but with all the information and route in the same file makes it a bit harder to find the things needed.
#### 2 database model  
I have dropped my table a few times to find out a better-structured database model.
And I progressed on the project, I also add more column to different tables to meet my app requirement
Need to have a clear concept of what the pros and cons of different database to decide what type and structure suit the app.

#### 3 google API pass in parameters
The google map API is quite straightforward to use, get the API KEY and follow the config. Then you have the map div in your app.
The difficult part is to pass in a parameter like address and then use it in the google map to show the location. I have added a few columns in my places table of the database, including location,lat and lng.
the lat and lng are obtained behind the scene by talking to google geocoding through ruby httparty. and then pass the lat and lng through js function.

#### 4 file upload using carrierwave



## Skills learned

#### 1 google API pass in parameters
#### 2 file upload using carrierwave
#### 3 bootstrap for css styling


## Things need to impprove
can add only one photo each time
need edit function





