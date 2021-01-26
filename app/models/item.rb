class Item < ApplicationRecord

  belong_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belong_to :burden,:category,:prefecture,:ship_day,:status
  has_one_attached :image
end
