# Heartcheck::Cas

A plugin to check CAS accessibility and our credencials

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

You can add a check to cas when configure the heartcheck

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

## Contributing

1. Fork it ( https://github.com/locaweb/heartcheck-cas )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request