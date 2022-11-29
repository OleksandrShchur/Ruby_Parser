require "./Item.rb"

class Sushi
    @@sushi = []

    def self.set_item(item)
        @@sushi.push(item)
    end

    def self.get_All()
        @@sushi
    end
end
