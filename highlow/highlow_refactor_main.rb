require_relative './highlow_refactor_start'
require_relative './highlow_refactor_game'
require_relative './highlow_refactor_view'


HigherLower.new(Game.new, View.new).start
