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

## Screenshots

!["Home Page"](https://github.com/alexhauka/jungle/blob/master/docs/Home%20Page.png?raw=true)*Home Page routes to all products*
!["About Jungle"](https://github.com/alexhauka/jungle/blob/master/docs/jungle%20About.png?raw=true)*Jungle's About page*
!["Category"](https://github.com/alexhauka/jungle/blob/master/docs/Category.png?raw=true)*Example of sorting by category*
!["Sign Up"](https://github.com/alexhauka/jungle/blob/master/docs/Sign%20Up.png?raw=true)*Registration Page*
!["Cart"](https://github.com/alexhauka/jungle/blob/master/docs/Cart.png?raw=true)*A loaded Cart*
!["Post Order"](https://github.com/alexhauka/jungle/blob/master/docs/Post%20Order.png?raw=true)*The Confirmed Order page*
!["Admin Categories"](https://github.com/alexhauka/jungle/blob/master/docs/Admin%20Categories.png?raw=true)*Categories control page via Admin Dashboard*
!["Testing Code"](https://github.com/alexhauka/jungle/blob/master/docs/rspec-capybara-phantom.png?raw=true)*Rspec/Capybara example spec*

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
- If you do not wish to use/test e-commerce capabilities, skip ahead to step 8
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
