require './MyApplicationTeam.rb'
require './InputReader.rb'
require './Engine.rb'

class MainApplication
    include MyApplicationTeam

    class Application
        def initialize
            @reporting_email = "osur12709@gmail.com"
        end

        def run
            input_reader = InputReader.new

            catalogue_link = "https://chernivtsi.sushi-master.ua/ua/menu/aktsii"

            engine = Engine.new

            engine.perform_parsing(catalogue_link)
        end
    end
end
