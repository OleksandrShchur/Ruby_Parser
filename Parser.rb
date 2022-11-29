require 'open-uri'
require 'byebug'
require 'nokogiri'
require './Sushi.rb'
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
                sushi = Item.new()
                sushi.name = element.css(".bottom-block").css(".title-block").text
                sushi.description = element.css(".bottom-block").css(".description").text
                sushi.price = element.css(".bottom-block").css(".add-to-card-block").css('.prices').css('.current-price').text.split(" ")[0]
                sushi.weight = element.css(".bottom-block").css(".under-title").text.split(" ")[1]
                sushi.amount = element.css(".bottom-block").css(".under-title").text.split(" ")[0].to_i
                sushi.id = i+1
                i= i+1
                Sushi.set_item(sushi)
            end
        rescue OpenURI::HTTPError => e
            puts e.message
        end
    end
end
