class BuyerAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :house_number, :phone_number, :user_id, :item_id, :buyer_id, :token

  with_options presence: true do
    validates :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :municipality
    validates :address
    validates :phone_number, numericality: { only_interger: true, message: 'は半角数字のみで記入してください' }
  end

  def save(current_user_id)
    buyer = Buyer.create(user_id: current_user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, house_number: house_number, phone_number: phone_number, buyer_id: buyer.id)
  end
end