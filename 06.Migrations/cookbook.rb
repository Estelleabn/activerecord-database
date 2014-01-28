require 'rake'
require 'yaml'

require_relative 'config/application'
require './models/recipe'


rake db:migrate