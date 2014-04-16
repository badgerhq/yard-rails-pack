require "yard-rails-pack/version"

YARD::Templates::Engine.register_template_path File.dirname(__FILE__) + '/../templates'

require 'yard-rails-pack/base'
require 'yard-rails-pack/validations'
require 'yard-rails-pack/callbacks'
require 'yard-rails-pack/assocations'
require 'yard-rails-pack/rails_scopes'
require 'yard-rails-pack/nested_attributes'
require 'yard-rails-pack/included'
require 'yard-rails-pack/routes'

require 'yard-rails-pack/devise'
require 'yard-rails-pack/alfreds'
require 'yard-rails-pack/rspec'

#YardRailsPack::Routes.process
