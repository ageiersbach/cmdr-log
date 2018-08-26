# CMDR Log

An Elite Dangerous event logger.

Works with [cmdr-log-cli](https://github.com/ageiersbach/cmdr-log-cli),
which reads the player log and sends the data to the rails app.

# Set up

_This is a work in progress_. Both applications need to be installed locally
and can only be used in a dev environment.

1) Install [ruby 2.4](https://www.ruby-lang.org/en/downloads/) locally
2) `gem install bundle`
3) Download this repository, `rake db:migrate RAILS_ENV=test`
4) `rails test`

If the tests pass, the server can be run (after migration) with `rails s`, as
usual, and will be available at localhost:3000.

5) Install [cmdr-log-cli](https://github.com/ageiersbach/cmdr-log-cli) locally.
