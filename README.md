# README

## Getting started

To run this project run:

```bash
# build the app image
docker-compose build

# Setup the application
docker-compose run app rails db:setup
docker-compose run app bundle

docker-compose up app
```

## Running tests

```bash
bundle exec rspec
```

# Test users credentials

user:
    - email: user@mail.com
    - password: 123456

admin:
    - email: admin@mail.com
    - password: 123456