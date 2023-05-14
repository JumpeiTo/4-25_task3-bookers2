# Bookモデル

class Book < ApplicationRecord
    
    has_one_attached :image
    
    # アソシエーション N:1
    belongs_to :user
    
    # バリデーション
    validates :title, presence: true
    validates :body, presence: true, length: { maximum: 200 }
    
end
