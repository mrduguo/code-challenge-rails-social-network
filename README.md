# Sample Rails Social Network [![Build Status](https://travis-ci.org/mrduguo/code-challenge-rails-social-network.svg?branch=master)](https://travis-ci.org/mrduguo/code-challenge-rails-social-network)

A simple social network to demo basic rails knowledge.

## Requirements

This project is developed and tested in `MacOS`, it should work on `Linux` and may not work on `Windows` due to `sqlite3` dependencies.

* Ruby version: `2.6.1`

## Development

To run the server locally with `development` mode:

```
 bundle install
 bin/rails db:migrate
 bin/rails server
```

Then you can access the server at http://0.0.0.0:3000/

## Test
Run following command to execute tests

```
 bin/rails test
```

## Production

To run the standalone server with `production` mode locally:

```
 RAILS_ENV=production bin/rails db:migrate
 RAILS_ENV=production bin/rails assets:precompile
 RAILS_SERVE_STATIC_FILES=true RAILS_ENV=production bin/rails server
```

Then you can access the server at http://0.0.0.0:3000/


## Live

The app has been deployed to AWS Elastic Beanstalk via [travis-ci.org](https://travis-ci.org/mrduguo/code-challenge-rails-social-network) for demo purpose:

http://ccrsn.eu-west-1.elasticbeanstalk.com
