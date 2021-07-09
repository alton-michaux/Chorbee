# README

A simple app to keep kids busy:

Chorbee is a simple way for parents to keep track of their children's productivity when it comes to doing chores. Future versions will allow users(parents) to mark chores as complete and allot monetary amounts toward each child for allowance.

Testing is still underway.

* Ruby version

This app runs on Ruby version 2.6.5

* System dependencies

Chorbee uses several gems to help it do what it does:

  -simple_calendar is used to render the calendar for the appointments index page

  -the recurring_select gem is used to allow users to select and register recurring events(appointments) through a modal

    ->the ice_cube gem is used to register recurring events and mark those dates on each respective calendar day, it is a dependency of the recurring_select gem

  -Chorbee uses the bootstrap gem for css styling and UI purposes
