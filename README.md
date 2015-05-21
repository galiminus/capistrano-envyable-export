# capistrano-envyable-export

Export your [Envyable](https://github.com/philnash/envyable) configuration and an optional env file to your remote servers with Capistrano.

[![Build Status](https://travis-ci.org/philnash/envyable.png?branch=master)](https://travis-ci.org/philnash/envyable)

## Installation

Add this line to your application's Gemfile:

    gem 'capistrano-envyable-export', group: [:development]

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-envyable-export

Add the following line in your `Capfile`

```
require "capistrano/envyable-export"
```

## Configuration

```
set :envyable_roles, [:app] # default: :all
set :envyable_path: "config/configuration.yml" # default: config/env.yml
set :envyable_env_path: "/var/www/.env" # no default, will not export the env file if not set
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
