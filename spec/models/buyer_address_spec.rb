require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
  describe '商品購入' do
    before do
      @buyer_address = FactoryBot.build(:buyer_address)
    end

    context '商品購入がうまくいく時' do
      it '全てのフォームに値が存在すれば登録できる' do
        expect(@buyer_address).to be_valid
      end
      it 'house_numberは空でも保存できる' do
        @buyer_address.house_number = nil
        expect(@buyer_address).to be_valid
      end
    end
    context '商品購入がうまくいかない時' do
      it 'tokenが空だと保存できないこと' do
        @buyer_address.token = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと保存できないこと' do
        @buyer_address.postal_code = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Postal code can't be blank", 'Postal code is invalid. Include hyphen(-)')
      end
      it 'postal_codeにハイフン(-)がないと保存できないこと' do
        @buyer_address.postal_code = '1234567'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefecture_idが1だと保存できないこと' do
        @buyer_address.prefecture_id = 1
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'prefecture_idが空だと保存できないこと' do
        @buyer_address.prefecture_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalityが空だと保存できないこと' do
        @buyer_address.municipality = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @buyer_address.address = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @buyer_address.phone_number = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Phone number can't be blank", 'Phone number は半角数字のみで記入してください')
      end
      it 'phone_numberに半角数字以外が含まれていると保存できないこと' do
        @buyer_address.phone_number = '111-1111-1111'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Phone number は半角数字のみで記入してください')
      end
    end
  end
end
