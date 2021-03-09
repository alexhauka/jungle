# Jungle

## At a glance

Jungle is a mini e-commerce application built on Ruby and Rails. Users can sign up, log in, and add or purchase items using Stripe for secure transactions. Behavior-Driven-Development was used with testing being done via Rspec, Capybara, and Poltergeist. 

## Features

- Products are listed on the homepage
- Users can add/remove/adjust quantity of items from  the Cart
- Admins can add/edit/remove existing categories or products via the Admin dashboard
- Items out of stock are marked as 'Sold Out'
- Encrypted passwords via bcrypt

## Stack

**Front-End:** Ruby, Jquery-Rails, SCSS

**Back-End:** Rails, PSQL

**Testing:** Rspec, Capybara, Poltergeist, Phantom


## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
