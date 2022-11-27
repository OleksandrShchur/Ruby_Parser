require 'open-uri'
require 'byebug'
require 'nokogiri'
require 'csv'
require './Sushi.rb'
require './sushi_item.rb'

class Sushi_parser


    def initialize(url)
        @url = url
    end

    def parse()
        begin
            html = open(@url) { |result| result.read}
            doc = Nokogiri::HTML(html)

            i = 0
            doc.css('.product-small .box').each do |element|
                sushi = Sushi_item.new()
                sushi.name = element.css(".title-wrapper").css(".quick-view").text
                priceAndWeight = element.css(".price-wrapper").css(".amount").text
                sushi.description = element.css(".prod_descr").css("p").text
                sushi.price = priceAndWeight.split("/")[0].split(" ")[0]
                sushi.weight = priceAndWeight.split("/")[1].split(" ")[1]
                sushi.amount = priceAndWeight.split("/")[1].split(" ")[0].to_i
                sushi.id = i+1
                i= i+1
                Sushi.set_item(sushi)
            end
        rescue OpenURI::HTTPError => e
            puts e.message
        end
    end

    def save()
        path = './sushi_all.csv'
        sushi = Sushi.get_All()
        begin  
            File.new(path, "w")
            CSV.open(path, "w", headers: ['Id', 'Name', 'Price', 'Amount', 'Weight', 'Description'], write_headers: true) do |csv|
                sushi.each do |product|
                    csv << [product.id, product.name, product.price, product.amount, product.weight, product.description]
                end
            end
            puts "Successfully writen in the file"
        rescue StandardError => e
            puts e.message
            puts "Can not open the file for wtiting"
        end
    end
end