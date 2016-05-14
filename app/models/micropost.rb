class Micropost < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  
  has_many :like
  has_many :likes_relationships, class_name: "Like",
                                  foreign_key: "likes_id",
                                  dependent: :destroy
  has_many :likes_microposts, through: :likes_relationships , source: :micropost
  
end