class Item < ApplicationRecord
  with_options presence: true do
    validates :item_name
    validates :text
    validates :price
  end

  validates :category_id,:status_id,:burden_id,:prefecture_id,:ship_day_id, numericality: { other_than: 1 } 

  belong_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belong_to :burden,:category,:prefecture,:ship_day,:status
  has_one_attached :image
end
