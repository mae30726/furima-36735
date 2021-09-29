require 'rails_helper'

RSpec.describe PurchaseDestination, type: :model do
  before do
    item = FactoryBot.create(:item)
    @purchase_destination = FactoryBot.build(:purchase_destination, user_id: item.user.id, item_id: item.id)
  end

  describe "商品決済機能" do
    context "商品決済ができる場合" do
      it "全ての項目が正しく入力されていれば登録できる" do
        expect(@purchase_destination).to be_valid
      end
      it "建物名は空でも登録できる" do
        @purchase_destination.building = ""
        expect(@purchase_destination).to be_valid
      end
    end

    context "商品決済ができない場合" do
      # it "クレジットカード情報が空だと登録できない" do
      #   @purchase_destination.token = nil
      #   @purchase_destination.valid?
      #   expect(@purchase_destination.errors.full_messages).to include("Token can't be blank")
      # end
      it "郵便番号が空だと登録できない" do
        @purchase_destination.postcode = ""
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Postcode can't be blank")
      end
      it "郵便番号が全角だと登録できない" do
        @purchase_destination.postcode = "１２３４５６７"
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)")
      end
      it "郵便番号にハイフン(-)が含まれていないと登録できない" do
        @purchase_destination.postcode = "1234567"
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)")
      end
      it "都道府県が初期値のままだと登録できない" do
        @purchase_destination.prefecture_id = "0"
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "市区町村が空だと登録できない" do
        @purchase_destination.city = ""
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("City can't be blank")
      end
      it "番地が空だと登録できない" do
        @purchase_destination.block = ""
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Block can't be blank")
      end
      it "電話番号が空だと登録できない" do
        @purchase_destination.phone_number = ""
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number can't be blank")
      end
      it "電話番号が9桁以下だと登録できない" do
        @purchase_destination.phone_number = "090123456"
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number is invalid")
      end
      it "電話番号が12桁以上だと登録できない" do
        @purchase_destination.phone_number = "090123456789"
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number is invalid")
      end
      it "電話番号はハイフンが含まれていると登録できない" do
        @purchase_destination.phone_number = "090-123-556"
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number is invalid")
      end
      it "userが紐付いていないとと登録できない" do
        @purchase_destination.user_id = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("User can't be blank")
      end
      it "itemが紐付いていないとと登録できない" do
        @purchase_destination.item_id = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
