class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code,:prefecture_id,:city,:address,:building,:number,:item_id,:user_id,:purchase_id

  with_options presence: true do
    validates :postal_code,format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :city
    validates :address
    validates :number,format:{with: /\A\d{10}\z|\A\d{11}\z/}
  end

  validates :prefecture_id,numericality: {other_than:1}

  def save
    purchase = Purchase.create(user_id:user_id,item_id:item_id)
    Address.create(postal_code: postal_code,  prefecture_id: prefecture_id, city: city, address: address, building: building, number: number, purchase_id: purchase.id)
  end
end