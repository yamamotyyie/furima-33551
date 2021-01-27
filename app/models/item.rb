class Item < ApplicationRecord
  with_options presence: true do
    validates :item_name
    validates :text
    validates :price
    validates :image
  end

  validates :category_id,:status_id,:burden_id,:prefecture_id,:ship_day_id, numericality: { other_than: 1 } 

  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :burden,:category,:prefecture,:ship_day,:status
  
end
