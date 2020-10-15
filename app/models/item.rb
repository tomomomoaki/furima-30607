class Item < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :price, numericality: { only_interger: true, message: 'は半角数字のみで記入してください' }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'は300~9,999,999円で設定してください' }
    validates :category_id, :status_id, :prefecture_id, :shipping_charge_id, :days_to_ship_id, numericality: { other_than: 1 }
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :days_to_ship

  belongs_to :user
  has_one_attached :image
end
