require 'logger'
require_relative 'Parser.rb'
require_relative 'Cart.rb'
require_relative 'Zipper.rb'


class Engine

    def initialize()
        @logger = Logger.new(STDOUT)
    end 

    def perform_parsing(url)
        parser = Parser.new('https://chernivtsi.sushi-master.ua/ua/menu/aktsii')

        cart = Cart.new()
        @logger.info('New Cart is created')

        parser.parse
        @logger.info('Website is parsed')

        cart.save_to_csv()
        cart.save_to_json()
        cart.save_to_yml()

        directory_to_zip = "./"
        output_file = "./out.zip"
        zf = Zipper.new(directory_to_zip, output_file)
        zf.write()
    end

end
