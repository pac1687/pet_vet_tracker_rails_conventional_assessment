#Ruby on Rails Conventional Assessment - Pet Vet Tracker#

#####[Pet Vet Tracker] (https://pet-tracker-two.herokuapp.com/) on Heroku

#####Written by [Justin Pacubas] (https://github.com/pac1687)

###About:

This program was written as my assessment in Ruby on Rails Conventional for Epicodus Summer 2014

###Description:
This website allows the creation of an individual user account and allows a user to create, edit, delete and list all their pets and preferred veterinarians (as well as various details) to the tracker.  It also allows a user to create appointments for their pet at one of the vets they have added.

===============================
####Features
+ Basic user registration and authentication
+ Index page to show a list of pets and add pets.
+ Index page to show a list of pets and add veterinarians.
+ Show page to show details about their pets as well as add and list their appointments.
+ Show page to show details about veterinarians they've added.

####Requirements
* The current stable version of Ruby 2.1.2.
* Text Editor (Sublime 3 beta)
* Postgresql

#####Instructions:
1. Download zip file and extract to a directory.
2. Navigate to extracted directory.
3. Run bundle install
4. Run rake db:create
5. Run rake db:migrate
6. Run rails server
7. Navigate to http://localhost:3000 in your browser.

##Schema:
This program utilizes a postgresql database labeled 'pet_tracker_development' with the following schema:

![Pet Tracker Schema](http://i.imgur.com/504Msi1.png)

####License:
MIT
