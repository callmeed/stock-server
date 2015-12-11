Stock Server
=====

A Ruby on Rails-based, open-source stock photographer server. Designed for
people who want to distribute free stock photography (e.g. Unsplash, Pexels,
Stock Up, etc.).

Demo 
-----
You can find a demo at: 

https://childrenusingdevices.herokuapp.com/

Requirements
-----

* Ruby and Rails
* A database (probably MySQL or Postgres)
* An Amazon AWS account (S3 for storage, CloudFront for CDN)

Running
-----
* Run `bundle install`
* Edit the settings.yml file with your details (site name, admin password, etc.)
* Create a .env file with your S3 information
* Run `rake db:migrate`
* Run `rake db:seed`

Deploying to Heroku
-----
