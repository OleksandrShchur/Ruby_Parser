module MyApplicationTeam

    class AppSingleton
        class << self
            @@web_address = 'https://chernivtsi.sushi-master.ua/ua/menu/aktsii'

            @@file_name = 'outputs/list_of_products'
    
            @@validator = -> (pages) { pages >= 5 && pages <= 100 }
    
            @@file_ext = ['rb']
    
            @@parse_item = /<div class="products-list-el">(.*)<\/div>/
        end
    end
    
    module ClassMethods
    end
    
    module InstanceMethods
    end
end
