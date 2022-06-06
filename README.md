# README

## Installation

Install some dependencies and setup them if needed:
  - nodejs
  - yarn
  - ruby 3.0.3
  - sqlite
  - mysql
  - postgresql
  - imagemagick

Copy `./config/secrets.yml.example` to `./config/secrets.yml`

Fill up credentials for imagekitio in `./config/secrets.yml`, to get them register on https://imagekit.io/

Review `./config/database.yml.example`, if you need to change anything, copy it to `./config/database.yml` and change to your liking.
If no, then follow up.

Run `./bin/setup` to install required packages, gems and create/seed the database.

## Development server

To run the app for development purposes, use `./bin/dev`

## Adding users from rails console examples

Open rails console by running `bin/rails console`

To add a user, run `User.create email: 'sample@example.com', password: 'sample'`

To add an admin user, run `User.create email: 'admin@example.com', password: 'sample', role: 1`

To make the existing user an admin, run `User.find_by(email: 'sample@example.com').admin_role!`


## Contributions

Feel free to update the Readme :)