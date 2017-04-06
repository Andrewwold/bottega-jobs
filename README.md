# Dev Installation

* Rails 5.0.2

bundle install

bundle exec rails db:setup

rails s

# In a new console window

to start scheduled jobs:

* bin/delayed_job start

to stop schedule jobs:

* bin/delayed_job stop

# TODO

* Add url to job_posts model/database
* Add url to all 3 APIs (under lib/api)
* Add additional fields from Dice API
* Add the ability to mark a job as 'applied' and optionally 'favorited'
* Integrate into devcamp application
