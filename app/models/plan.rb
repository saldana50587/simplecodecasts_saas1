class Plan < ActiveRecord::Base
    
has_many :users     #The plan can hold many users
    
end
