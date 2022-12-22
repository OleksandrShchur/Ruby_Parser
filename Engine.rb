require 'logger'

require './Parser.rb'
require './Cart.rb'
require './Zipper.rb'
require './EmailSender.rb'

class Engine

    def initialize()
        @email_to_send = 'osur12709@gmail.com'
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

        begin
            email_sender = Email::EmailSender.new
            email_sender.send(@email_to_send, "501 - Ruby", "Subject", './out.zip') # throw an timeout error

            @logger.info('Email with attachment is sent')
        rescue StandardError => e
            @logger.error(e)
        end
    end

end
