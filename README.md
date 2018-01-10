
Cold Open is a basic CRUD app designed to track the inventory (and expiration dates) of items in your freezer. It's aim is to reduce food waste and prevent freezer burn. All expiration dates are FDA guidelines.

This is a web app developed with Ruby on Rails and can be accessed by going to https://cold-open.herokuapp.com/

Production database used is Postgres, with authentication using Omniauth.

Installation

To down load this app for use on a local server, please:
  1. fork and clone the master branch of the GitHub repository https://github.com/KatieLars/cold-open ;
  2. run bundle install to install Gem files;
  3. cd into the directory cold-open in your terminal
  4. run rake db:migrate to set up your database;
  5. start your local server running rails s
  6. Enjoy!

Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'katmae83-37533'/aic-info-cli-app. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor Covenant code of conduct.

License

The gem is available as open source under the terms of the MIT License.
