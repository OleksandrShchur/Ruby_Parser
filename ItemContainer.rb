require_relative 'MyApplicationTeam.rb'


module ItemContainer
    include MyApplicationTeam
    
    module ClassMethods
    end
    
    module InstanceMethods
        def add_item(item)
            @items.push(item)
        end

        def remove_item(item)
            @items.pop(item)
        end

        def delete_items(items)
            items.each do |item|
                @items.pop(item)
            end
        end
    end

    def self.included(class_instance)
        class_instance.extend(ClassMethods)
        class_instance.extend(InstanceMethods)
    end
    
end
