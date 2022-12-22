require_relative 'MyApplicationTeam.rb'

module ItemContainer
    include MyApplicationTeam
    
    module ClassMethods
    end
    
    module InstanceMethods
    end

    self.included(class_instance)
    
end
