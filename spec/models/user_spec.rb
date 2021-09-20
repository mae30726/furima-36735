require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "ユーザー登録ができる場合" do
      it "全ての項目が正しく入力されていれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context " ユーザー登録ができない場合" do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailには＠が含まれていないと登録できない" do
        @user.email = "aaaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "emailが既に登録されているものだと登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが英字のみでは登録できない" do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが数字のみでは登録できない" do
        @user.password = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが全角では登録できない" do
        @user.password = "ｔｅｓｔ１２"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが英数混合でも、5文字以下だと登録できない" do
        @user.password = "test1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "password_confirmationが空だと登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "password_confirmationがpasswordと一致していないと登録できない" do
        @user.password_confirmation = "test11"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "user_last_nameが空だと登録できない" do
        @user.user_last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("User last name can't be blank")
      end
      it "user_last_nameがひらがな・カタカナ・漢字以外だと登録できない" do
        @user.user_last_name = "aaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("User last name is invalid")
      end
      it "user_first_nameが空だと登録できない" do
        @user.user_first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("User first name can't be blank")
      end
      it "user_first_nameがひらがな・カタカナ・漢字以外だと登録できない" do
        @user.user_first_name = "aaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("User first name is invalid")
      end
      it "user_last_name_kanaが空だと登録できない" do
        @user.user_last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("User last name kana can't be blank")
      end
      it "user_last_name_kanaがカタカナでないと登録できない" do
        @user.user_last_name_kana = "みょうじ"
        @user.valid?
        expect(@user.errors.full_messages).to include("User last name kana is invalid")
      end
      it "user_first_name_kanaが空だと登録できない" do
        @user.user_first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("User first name kana can't be blank")
      end
      it "user_first_name_kanaがカタカナでないと登録できない" do
        @user.user_first_name_kana = "なまえ"
        @user.valid?
        expect(@user.errors.full_messages).to include("User first name kana is invalid")
      end
      it "birthdayが空だと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
