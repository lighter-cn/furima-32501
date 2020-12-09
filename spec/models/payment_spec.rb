require 'rails_helper'

RSpec.describe Payment, type: :model do
  describe '購入機能' do
    before do
      @payment = FactoryBot.build(:payment)
    end
    context "正常時" do
      it 'すべての入力項目が問題ない場合購入できる' do
        expect(@payment).to be_valid
      end

      it '建物名(必須ではない項目)の入力項目がない場合でも購入できる' do
        @payment.building = nil
        expect(@payment).to be_valid
      end
    end

    context "エラー発生時" do
      it 'user_idが空だと保存できないこと' do
        @payment.user_id = nil
        @payment.valid?
        expect(@payment.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空だと保存できないこと' do
        @payment.item_id = nil
        @payment.valid?
        expect(@payment.errors.full_messages).to include("Item can't be blank")
      end

      it 'トークンが空だと保存できないこと' do
        @payment.token = nil
        @payment.valid?
        expect(@payment.errors.full_messages).to include("Token can't be blank")
      end
  
      it '郵便番号が空だと保存できないこと' do
        @payment.post_number = nil
        @payment.valid?
        expect(@payment.errors.full_messages).to include("Post number can't be blank")
      end
  
      it '郵便番号にハイフンが無いと保存できないこと' do
        @payment.post_number = '1234567'
        @payment.valid?
        expect(@payment.errors.full_messages).to include('Post number is invalid. Include hyphen(-)')
      end
  
      it '都道府県が空だと保存できないこと' do
        @payment.prefecture_id = nil
        @payment.valid?
        expect(@payment.errors.full_messages).to include("Prefecture can't be blank")
      end
  
      it '都道府県が未選択だと保存できないこと' do
        @payment.prefecture_id = 1
        @payment.valid?
        expect(@payment.errors.full_messages).to include('Prefecture must be other than 1')
      end
  
      it '市区町村が空だと保存できないこと' do
        @payment.city = nil
        @payment.valid?
        expect(@payment.errors.full_messages).to include("City can't be blank")
      end
  
      it '番地が空だと保存できないこと' do
        @payment.house_number = nil
        @payment.valid?
        expect(@payment.errors.full_messages).to include("House number can't be blank")
      end
  
      it '電話番号が空だと保存できないこと' do
        @payment.phone_number = nil
        @payment.valid?
        expect(@payment.errors.full_messages).to include("Phone number can't be blank")
      end
  
      it '電話番号が英数混合だと保存できないこと' do
        @payment.phone_number = "090abcd-123"
        @payment.valid?
        expect(@payment.errors.full_messages).to include("Phone number is not a number")
      end
  
      it '電話番号が12桁以上だと保存できないこと' do
        @payment.phone_number = '090123456789'
        @payment.valid?
        expect(@payment.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end
    end
  end
end
