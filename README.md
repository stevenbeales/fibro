# Mental Test

[![Build Status](https://travis-ci.org/stevenbeales/fibro.png)](https://travis-ci.org/stevenbeales/fibro)

[![Maintainability](https://api.codeclimate.com/v1/badges/6574b93819edbc0cff7d/maintainability)](https://codeclimate.com/github/stevenbeales/fibro/maintainability)

[![Inline docs](http://inch-ci.org/github/stevenbeales/fibro.svg?branch=master)](http://inch-ci.org/github/stevenbeales/fibro)

[![license](https://img.shields.io/github/license/mashape/apistatus.svg)](https://opensource.org/licenses/MIT)

Disclaimer. These statements have not been validated by the FDA. This skill is not intended to diagnose or treat any condition.

An Alexa skill for Fibromyalgia sufferers written in Ruby using the Sinatra framework.

Installation instructions for developers

Ruby Version

2.4.4 or higher

To install dependencies -

1) Install Postgres 9.4 or higher.
2) Use bundler - bundle install - to install all other gems from the Gemfile.
3) bundle exec rake db:setup - To generate test and development databases and seed the databases with test data
4) Supports Travis online Continuous Integration if you have linked Travis CI and Github accounts. (see./travis.yml for configuration)
5) Supports CodeClimate online Code Quality and Coverage if you have linked CodeClimate account. (see ./codeclimate.yml for configuration)
6) Supports Inch online Documentation Quality checks if you have linked Inch account (see ./inch.yml for configuration)

To run the test suite -

1) bundle exec rake spec

To generate the skill documentation -

1) rake rdoc

## Contributing

See the [Contribution Guidelines](https://github.com/stevenbeales/fibro/blob/master/CONTRIBUTING.md)

This project is intended to be a space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

Please install Overcommit (gem install overcommit) before committing any code.

Overcommit Git hooks exist to check check-in comments and to verify code against:

1) Reek (check for code smells - see ./config.reek for configuration)
2) Bundle-audit (check for security vulnerabilities)
3) Rubocop (lint code - see ./rubocop.yml for configuration)
4) Fasterer (performance checks - see ./fasterer.yml for configuration)

See ./overcommit.yml for Overcommit configuration

## Deployment

The project may be deployed to Heroku. Full details of this deployment are beyond the scope of this README. The ./Procfile exists to support Heroku16 deployment.

### Resources

- [Git Repository](https://github.com/stevenbeales/fibro)
- [Git Repository fibro Alexa Skill CLI](https://github.com/stevenbeales/fibro-friend)
