class MainApplication
    class << self
        @@web_address = "https://chernivtsi.sushi-master.ua/ua/menu/aktsii"

        @@validator = -> (pages) { pages >= 5 && pages <= 100 }

        @@file_ext = ["rb"]

        @@parse_item = /<div class="products-list-el">(.*)<\/div>/
    end

    attr_accessor :path_to_saving_files
    def initialize(path_to_saving_files)
        @path_to_saving_files = path_to_saving_files
    end
end
