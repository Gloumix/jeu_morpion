require 'bundler'
Bundler.require

require_relative 'lib/app/game'
require_relative 'lib/app/player'
require_relative 'lib/app/application'
require_relative 'lib/app/board'
require_relative 'lib/views/display'


Application.new.perform

