### Tests and linter status:
![Actions Status](https://github.com/Yorickov/ipgeobase/actions/workflows/master.yml/badge.svg)

# Ipgeobase

This gem is a wrapper of service [ip-api.com](http://ip-api.com), it allows to get short information in friendly format about geo-location via IP.

## Installation

```ruby
gem 'ipgeobase'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install ipgeobase

## Usage

```ruby
Ipgeobase.lookup('<IP address>')
```

## Example

```ruby
response = Ipgeobase.lookup('8.8.8.8')

response.city # Ashburn
response.country # United States
response.countryCode # US
response.lat # 39.03
response.lon # -77.5
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Yorickov/ipgeobase.
