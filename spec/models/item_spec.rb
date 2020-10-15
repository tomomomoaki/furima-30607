require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '新規商品登録' do
    before do
      @item = FactoryBot.build(:item)
    end
    context '新規商品登録がうまくいく時' do
      it "全てのフォームに値が存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end
    context '新規商品登録がうまくいかない時' do
      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが空だと登録できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "explanationが空だと登録できない" do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it "category_idが空だと登録できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
      end
      it "status_idが空だと登録できない" do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank", "Status is not a number")
      end
      it "shipping_charge_idが空だと登録できない" do
        @item.shipping_charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank", "Shipping charge is not a number")
      end
      it "prefecture_idが空だと登録できない" do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
      end
      it "days_to_ship_idが空だと登録できない" do
        @item.days_to_ship_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank", "Days to ship is not a number")
      end
      it "priceが空だと登録できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが300より小さいと登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price は300~9,999,999円で設定してください")
      end
      it "priceが9999999より大きいと登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price は300~9,999,999円で設定してください")
      end
      it "priceが半角数字以外だと登録できない" do
        @item.price = "５５５"
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price は半角数字のみで記入してください")
      end
    end
  end
end
