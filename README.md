# README

# Odyssey

Odyssey aims to connect travelers to freelance tour guides through the gig economy through
our web and mobile application. This is the project for the website, with fundamental 
functionalities including messaging, payment, geomap operations, authentication, reservations,
etc.

## Getting Started

In order to run you will need to run: 

```
bundle install --without production
rails db:migrate
rails -s
```
so you can install the necessary gems, account for any potential changes, 
and start a local server. 

WARNING: running on local host in a development environment will limit 
some of the features including payment, messaging, and email confirmation.

### Prerequisites

The project is compatible with ruby 2.4.2p198

## Deployment

In order to deploy go to: https://dashboard.heroku.com/apps/odyssey1

## Running the tests

You can run tests by running: 

```
rails tests
```

## Built With

Google maps API, 
geocode search API, 
Stripe API, 
and many more

## Contributing

At the moment, our project is not open to contributions

## Versioning

Only one version is available at the moment, we will implement versioning soon.

## Authors

* **Artin Kasumyan** - [artin2](https://github.com/artin2)
* **Arthur Kasumyan** - [arthurk33](https://github.com/arthurk33)
* **Fatih Celikbas** - [fatcelikbas](https://github.com/fatcelikbas)

## License

This project is yet to be licensed.

## Acknowledgments

We would like to thank Ruzica Piskac
for helping teaching us important software
engineering principles and bringing our group
together :)
