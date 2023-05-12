# Bookモデル

class Book < ApplicationRecord
    
    has_one_attached :image
    
    # アソシエーション N:1
    belongs_to :user
    
end
