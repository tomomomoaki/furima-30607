class Item < ApplicationRecord
  validates :image, presence: true
  validates :name, presence: true
  
  validates :price, presence: true
  validates :price, numericality: {only_interger: true, message: 'は数字のみで記入してください' }
  validates  :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message:'は300~9,999,999円で設定してください'}
  

  validates :explanation, presence: true
  validates :category_id, :status_id, :prefecture_id, :shipping_charge_id, :days_to_ship_id, presence: true
  validates :category_id, :status_id, :prefecture_id, :shipping_charge_id, :days_to_ship_id, numericality: { other_than: 1 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :days_to_ship

  belongs_to :user
  has_one_attached :image
end
