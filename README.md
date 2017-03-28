# Yelp
### Makers Academy Week No. 8

[![Build Status](https://travis-ci.org/KatHicks/yelp.svg?branch=master)](https://travis-ci.org/KatHicks/yelp) [![Coverage Status](https://coveralls.io/repos/github/KatHicks/yelp/badge.svg?branch=master)](https://coveralls.io/github/KatHicks/yelp?branch=master) [![Code Climate](https://codeclimate.com/github/KatHicks/thermostat/badges/gpa.svg)](https://codeclimate.com/github/KatHicks/thermostat)

### Instructions

We worked through the challenges throughout the week in rotating pairs.

> You'll use Rails to build a clone of Yelp, an app for reviewing restaurants.
> Yelp is a popular web application that allows users to rate and review restaurants, and find other diner's ratings and comments. For the rest of the week you will be building a clone of this site using Rails.

### Objectives

* Are you having fun?
* Are you a better developer than you were yesterday?
* **Can you use Rails and its conventions to build a web app?**

### Using my application

* Download the source code using `$ git clone`
* Navigate into the root of the directory using `$ cd yelp`
* Install all the dependencies by running the command `$ bundle` in the root directory
* Download PostgreSQL (if you do not already have it installed)
* Within the command line, run `$ bin/rake db:create` and then `$ bin/rake db:migrate`
* Run the app using the command `$ bin/rails server`
* Go to `localhost:3000` in a browser to view and interact with the app

### Running the tests

* Within the root of the directory, run `$ rspec` to run the tests and see the results in the command line

### Dependencies

* Application written in **Ruby 2.4.0**
* Built using **Ruby on Rails**
* Based on a **PostgreSQL** database with **ActiveRecord** as the ORM
* Tested using **RSpec** and **Capybara**
* Uses **Paperclip** for image upload
* Uses **OmniAuth** for sign-in with Facebook

### Approach

* Wasn't much independence in the approach with this challenge as part of the challenge was getting used to *convention over configuration*
* Was really interesting using OmniAuth with Facebook

### Reflections

* One of my favourite things about rails is the way that the route configuration forces you to use RESTful routes - think that is really cool!
* Also really appreciate that the database schema is so strict - really good to have such a clear history of how the database has been built
* Makes me a bit uncomfortable that there are so many files and directories created on initialisation of a rails app - many of which you have no idea what they're doing

### Ideas for extension

* Our app currently has no styling so would be nice to make it look more like a finished product
* Would also be nice to add an endorsement feature and use AJAX so that endorsements could appear instantly

### Collaborators

Mike Field-May, Mitch Goldbay, Rob Holden
