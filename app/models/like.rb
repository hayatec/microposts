class Like < ActiveRecord::Base
    #belongs_to :user
    #belongs_to :micropost
    belongs_to :likes, class_name: "Micropost"
    belongs_to :liked, class_name: "User"
  
end
