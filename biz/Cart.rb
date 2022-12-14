require 'open-uri'
require 'byebug'
require 'nokogiri'
require 'csv'
require 'json'
require 'yaml'
require 'logger'

require_relative 'Item.rb'
require_relative 'MyApplicationTeam.rb'

class Cart
    include MyApplicationTeam

    @@cart_list = []

    def initialize()
        @logger = Logger.new(STDOUT)
    end

    def save_to_csv()
        path_csv = MyApplicationTeam::AppSingleton.singleton_class.class_variable_get(:@@file_name) + '.csv'

        items = Cart.get_cart_list()
        begin  
            File.new(path_csv, "w")
            
            CSV.open(path_csv, "w", headers: ['Id', 'Name', 'Price', 'Amount', 'Weight', 'Description'], write_headers: true) do |csv|
                items.each do |item|
                    csv << item.to_s()
                end
            end

            @logger.info('Successfully writen in the csv file')
        rescue StandardError => e
            @logger.error(e.message)
            @logger.error('Cannot open the csv file for writing')
        end

    def save_to_json()
        path_json = MyApplicationTeam::AppSingleton.singleton_class.class_variable_get(:@@file_name) + '.json'
        items = Cart.get_cart_list()

        begin 
            File.new(path_json, "w")

            File.open(path_json, "w") do |json|
                items.each do |item|
                    json.write(JSON.pretty_generate(item.to_h()))
                end
            end

            @logger.info('Successfully writen in the json file')
        rescue StandardError => e
            @logger.error(e.message)
            @logger.error('Cannot open the json file for writing')
        end
    end

    def save_to_yml()
        path_yml = MyApplicationTeam::AppSingleton.singleton_class.class_variable_get(:@@file_name) + '.yaml'
        items = Cart.get_cart_list()

        begin
            File.new(path_yml, "w")

            File.open(path_yml, "w") do |yaml|
                items.each do |item|
                    yaml.write(item.to_yaml)
                end
            end
        end

        @logger.info('Successfully writen in the yaml file')
        rescue StandardError => e
            @logger.error(e.message)
            @logger.error('Cannot open the yaml file for writing')
        end
    end

    def self.add_to_cart(item)
        @@cart_list.push(item)
    end

    def self.get_cart_list()
        @@cart_list
    end

end
