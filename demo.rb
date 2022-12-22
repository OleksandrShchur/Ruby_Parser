require 'csv'

require './Parser.rb'
require './Cart.rb'
require './Zipper.rb'
require './MainApplication.rb'

parser = Parser.new(MainApplication.singleton_class.class_variable_get(:@@web_address))

cart = Cart.new()

parser.parse()
cart.save_to_csv()
cart.save_to_json()
cart.save_to_yml()

directory_to_zip = "./"
output_file = "./out.zip"
zf = Zipper.new(directory_to_zip, output_file)
zf.write()
