require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
    context '新規登録がうまくいく時' do
      it "nicknameとemailとpasswordとpassword_confirmationとlast_nameとfirst_nameとlast_name_keyとfirst_name_keyとbirthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上で英数字混合なら登録できる" do
        @user.password = "123abc"
        @user.password_confirmation = "123abc"
        expect(@user).to be_valid
      end
      it "last_nameとfirst_nameが全角なら登録できる" do
        @user.last_name = "山田"
        @user.first_name = "剣士"
        expect(@user).to be_valid
      end
      it "last_name_keyとfirst_name_keyが全角カタカナなら登録できる" do
        @user.last_name_key = "ヤマダ"
        @user.first_name_key = "ケンシ"
        expect(@user).to be_valid
      end
    end
    context '新規登録がうまく行かない時' do
      it "nicknameが空だと登録できない" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複するメールアドレスでは登録できない" do
        another_user = FactoryBot.build(:user)
        @user.save
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "メールアドレスには＠がないと登録できない" do
        @user.email = "wwwgmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email には「＠」を含めて設定してください")
      end
      it "passwordが空だと登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下では登録できない" do
        @user.password = "12345"
        @user.password_confirmation = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordは半角英数字混合でなければ登録できない" do
        @user.password = "abcdefg"
        @user.password_confirmation = "abcdefg"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it "passwordとpassword_confirmationの値が一致しないと登録できない" do
        @user.password = "123abc"
        @user.password_confirmation = "111aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "last_nameが空では登録できない" do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name には全角文字を使用してください")
      end
      it "last_nameが半角では登録できない" do
        @user.last_name = "yamada"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name には全角文字を使用してください")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", "First name には全角文字を使用してください")
      end
      it "first_nameが半角では登録できない" do
        @user.first_name = "kenshi"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name には全角文字を使用してください")
      end
      it "last_name_keyが空では登録できない" do
        @user.last_name_key = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name key can't be blank", "Last name key には全角カタカナを使用してください")
      end
      it "last_name_keyが全角カタカナ以外では登録できない" do
        @user.last_name_key = "やまだ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name key には全角カタカナを使用してください")
      end
      it "first_name_keyが空では登録できない" do
        @user.first_name_key = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name key can't be blank", "First name key には全角カタカナを使用してください")
      end
      it "first_name_keyが全角カタカ以外では登録できない" do
        @user.first_name_key = "けんし"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name key には全角カタカナを使用してください")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
