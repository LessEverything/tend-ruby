# Tend-Ruby

[![Build Status](https://travis-ci.org/LessEverything/tend-ruby.svg?branch=master)](https://travis-ci.org/LessEverything/tend-ruby)

Ruby wrapper of Tend.io API

## Installation

Add this line to your application's Gemfile:

    gem 'tend-ruby', require: "tend"

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tend-ruby

## Usage

* Add Tend user name and password:

`
Tend.user_name = "brian"
Tend.password = "sdnf9283*hwer"
`

* View all contacts

  Tend::Contact.all


## Contributing

1. Fork it ( https://github.com/lesseverything/tend-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
