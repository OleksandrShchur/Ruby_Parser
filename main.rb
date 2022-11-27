require 'csv'
require './Sushi_parser.rb'

sushi_parser = Sushi_parser.new('https://tsunami.cv.ua/')
sushi_parser.parse()
sushi_parser.save()