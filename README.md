# Heartcheck::Cas

[![Build Status](https://github.com/locaweb/heartcheck-cas/actions/workflows/ci.yml/badge.svg)](https://github.com/locaweb/heartcheck-cas/actions/workflows/ci.yml)
[![Code Climate](https://codeclimate.com/github/locaweb/heartcheck-cas/badges/gpa.svg)](https://codeclimate.com/github/locaweb/heartcheck-cas)

A plugin to check CAS accessibility connection with [heartcheck](https://github.com/locaweb/heartcheck).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'heartcheck-cas'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install heartcheck-cas

## Usage

You can check any CAS credentials that there's in your app.

```ruby
Heartcheck.setup do |config|
  config.add :cas do |c|
    c.add_service({
        service: 'locaweb',
        username: 'username',
        password: 'password',
        server: 'https://path-to-cas-server/v1/tickets'
    })
  end
end
```

**Check Heartcheck example** [here](https://github.com/locaweb/heartcheck/blob/master/lib/heartcheck/generators/templates/config.rb)

## Development setup using Docker

The Docker Hearthcheck-Cas provides a container with the current stable version of Ruby released and requires you to have these tools available in your local environment:

*   [Docker](https://docs.docker.com/get-docker/)
*   [Docker Compose](https://docs.docker.com/compose/install/)
*   [Bash](https://www.gnu.org/software/bash/)

#### BootStrap Script to run the dockerized environment

 ```bash
 ./scripts/heartcheck-cas setup
 ```

 Run the command `./scripts/heartcheck-cas -h` to see available options.

## Contributing

1.  [Fork it](https://github.com/locaweb/heartcheck-cas/fork)
2.  Create your feature branch ( **git checkout -b my-new-feature** )
3.  Commit your changes ( **git commit -am 'Add some feature'** )
4.  Push to the branch ( **git push origin my-new-feature** )
5.  Create a new Pull Request

## License

*   [MIT License](https://github.com/locaweb/heartcheck-cas/blob/master/LICENSE.txt)
