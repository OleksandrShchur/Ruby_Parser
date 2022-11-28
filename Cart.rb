require 'open-uri'
require 'byebug'
require 'nokogiri'
require 'csv'
require 'json'
require './Sushi.rb'
require './Item.rb'

class Cart

    def save_to_csv()
        path_csv = './sushi_all.csv'
        sushi = Sushi.get_All()
        begin  
            File.new(path_csv, "w")
            
            CSV.open(path_csv, "w", headers: ['Id', 'Name', 'Price', 'Amount', 'Weight', 'Description'], write_headers: true) do |csv|
                sushi.each do |product|
                    csv << [product.id, product.name, product.price, product.amount, product.weight, product.description]
                end
            end

            puts "Successfully writen in the csv file"
        rescue StandardError => e
            puts e.message
            puts "Can not open the csv file for writing"
        end

    def save_to_json()
        path_json = './sushi_all.json'
        sushi = Sushi.get_All()

        begin 
            File.new(path_json, "w")

            File.open(path_json, "w") do |json|
                sushi.each do |product|
                    temp_hash = {
                        "Id" => product.id,
                        "Name" => product.name,
                        "Price" => product.price,
                        "Amount" => product.amount, 
                        "Weight" => product.weight, 
                        "Description" => product.description
                    }

                    json.write(JSON.pretty_generate(temp_hash))
                end
            end
        end


            puts "Successfully writen in the json file"
        rescue StandardError => e
            puts e.message
            puts "Can not open the json file for writing"
        end
    end
end