require './MyApplicationTeam.rb'

class Item
    include MyApplicationTeam

    include Comparable
    include Enumerable

    @@items = []

    attr_accessor :id, :name, :price, :amount, :weight, :description

    def initialize(id = 0, name ='', price = 0, amount = 0, weight = '', description = '')
        @id = id
        @name = name
        @price = price
        @amount = amount
        @weight = weight
        @description = description
    end

    def each(&block)
        @items.each do |element|
          block.call(element)
        end
    end

    def <=>(other)
        price <=> other.price and
        weight <=> other.weight
    end

    def to_s()
        [
            @id, 
            @name,
            @price, 
            @amount, 
            @weight, 
            @description
        ]
    end

    def to_h()
        {
            'id' => @id, 
            'name'=> @name, 
            'price' => @price, 
            'amount' => @amount, 
            'weight' => @weight, 
            'description' => @description
        }
    end

    def info()
        yield
    end

end
