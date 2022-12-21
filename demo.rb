require 'csv'

require './Parser.rb'
require './Cart.rb'
require './Zipper.rb'

parser = Parser.new('https://chernivtsi.sushi-master.ua/ua/menu/aktsii')

cart = Cart.new()

parser.parse()
cart.save_to_csv()
cart.save_to_json()
cart.save_to_yml()

directory_to_zip = "./"
output_file = "./out.zip"
zf = Zipper.new(directory_to_zip, output_file)
zf.write()
