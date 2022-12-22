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

            catalogue_links = MyApplicationTeam::AppSingleton.singleton_class.class_variable_get(:@@web_addresses)

            engine = Engine.new

            engine.perform_parsing(catalogue_links)
        end
    end
end
