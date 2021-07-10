# README

Chorbee: A chores app for kids!

Chorbee is a simple way for parents to keep track of their children's productivity when it comes to doing chores. The current version allows for admins(parents) to assign chores to each child and assign an appointment schedule that will render a calendar view of the appointment based on a daily or weekly basis.

*Future versions will allow admins to mark chores complete and allot monetary amounts toward each child for allowance*

All model and controller specs pass using rspec testing.

* Ruby version:

  This app runs on Ruby version 2.6.5

* Rails version:

  This app runs on Rails 5.0.7.2

* System dependencies:

  Chorbee uses several gems to help it do what it does:

    -simple_calendar is used to render the calendar for the appointments index page

    -the recurring_select gem is used to allow users to select and register recurring events(appointments) through a modal, this gem also gives us access to the ice_cube gem:

      -the ice_cube gem is used to register recurring events and mark those dates on each respective calendar day, it is a dependency of the recurring_select gem

    -Chorbee uses the bootstrap gem for css styling and UI purposes

* Testing:

  Software: Rspec
  Number of tests: 45
  Type of testing: Model and Controller(request)
