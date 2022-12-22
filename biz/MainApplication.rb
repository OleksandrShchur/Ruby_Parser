require_relative 'MyApplicationTeam.rb'
require_relative '../helpers/InputReader.rb'
require_relative '../engine/Engine.rb'

class MainApplication
    include MyApplicationTeam

    class Application
        def initialize
            @reporting_email = "osur12709@gmail.com"
        end

        def run
            input_reader = InputReader.new

            catalogue_link = MyApplicationTeam::AppSingleton.singleton_class.class_variable_get(:@@web_address)

            engine = Engine.new

            engine.perform_parsing(catalogue_link)
        end
    end
end
