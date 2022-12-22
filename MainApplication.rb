require './MyApplicationTeam.rb'

class MainApplication
    include MyApplicationTeam

    attr_accessor :path_to_saving_files
    
    def initialize(path_to_saving_files)
        @path_to_saving_files = path_to_saving_files
    end
end
