class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: :true
  validates :birthday, presence: :true

  validates_format_of :email, with: /@/, message: 'には「＠」を含めて設定してください'

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥ー]+\z/, message: 'には全角文字を使用してください' } do
    validates :last_name
    validates :first_name
  end
  with_options presence: true, format: { with: /\A[ァ-ンー]+\z/, message: 'には全角カタカナを使用してください' } do
    validates :last_name_key
    validates :first_name_key
  end

  has_many :items
  has_many :buyers
end
