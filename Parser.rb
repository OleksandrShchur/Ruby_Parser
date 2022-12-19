require 'open-uri'
require 'byebug'
require 'nokogiri'
require './Item.rb'

class Parser

    def initialize(url)
        @url = url
    end

    def parse()
        begin
            html = URI.open(@url) { |result| result.read}
            doc = Nokogiri::HTML(html)
            i = 0
            doc.css('.products-list-el').each do |element|
                item = Item.new()
                item.name = element.css(".bottom-block").css(".title-block").text
                item.description = element.css(".bottom-block").css(".description").text
                item.price = element.css(".bottom-block").css(".add-to-card-block").css('.prices').css('.current-price').text.split(" ")[0]
                item.weight = element.css(".bottom-block").css(".under-title").text.split(" ")[1]
                item.amount = element.css(".bottom-block").css(".under-title").text.split(" ")[0].to_i
                item.id = i+1
                i= i+1
                Item.set_item(item)
            end
        rescue OpenURI::HTTPError => e
            puts e.message
        end
    end
end
