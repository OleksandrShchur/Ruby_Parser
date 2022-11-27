class Sushi_item
    attr_accessor :id, :name, :price, :amount, :weight, :description

    def initialize(id = 0, name ='', price = 0, amount = 0, weight = '', description = '')
        @id = id
        @name = name
        @price = price
        @amount = amount
        @weight = weight
        @description = description
    end
end
