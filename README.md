# Yard Rails Pack

[![Gem Version](http://img.shields.io/gem/v/yard-rails-pack.svg)][gem]
[![Code Climate](http://img.shields.io/codeclimate/github/jhnvz/yard-rails-pack.svg)][codeclimate]
[![Dependency Status](http://img.shields.io/gemnasium/jhnvz/yard-rails-pack.svg)][gemnasium]

[gem]: https://rubygems.org/gems/yard-rails-pack
[codeclimate]: https://codeclimate.com/github/jhnvz/yard-rails-pack
[gemnasium]: https://gemnasium.com/jhnvz/yard-rails-pack

Adds handlers for the following Rails behaviour:
- Routes
- Schema
- Assocations
- Validations
- Nested attributes
- Controller filters
- Callbacks
- Active support concern
- Observers
 
Adds handlers for the following gems:
- Alfred (https://github.com/jhnvz/alfred)
- RSpec (https://github.com/rspec/rspec)
- Devise (https://github.com/platformatec/devise)
- Has scope (https://github.com/?/has_scope

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'yard-rails-pack', :group => 'development', :require => false
```

And then execute:
```
$ bundle
```

Add the following to your .yardopts:
```
--plugin rails-pack
"{lib,app}/**/*.rb" 
"spec/{models,controllers,logic,routing,mailers,lib,observers,serializers}/**/*.rb" 
"{spec/alfreds}/**/*.rb" 
"db/schema.rb" 
- '*.md'
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
