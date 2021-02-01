class Item < ApplicationRecord
  with_options presence: true do
    validates :item_name
    validates :text
    validates :image
  end
  validates :price,presence: true,
  format:{with: /\A[0-9]+\z/},
  numericality: {
      greater_than_or_equal_to: 300,
      less_than: 9999999
    }


  validates :category_id,:status_id,:burden_id,:prefecture_id,:ship_day_id, numericality: { other_than: 1 } 

  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :burden
  belongs_to :category
  belongs_to :prefecture
  belongs_to :ship_day
  belongs_to :status
end
