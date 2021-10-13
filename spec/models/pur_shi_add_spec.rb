require 'rails_helper'

RSpec.describe PurShiAdd, type: :model do
  describe '商品購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @pur_shi_add = FactoryBot.build(:pur_shi_add, item_id: item.id, user_id: user.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@pur_shi_add).to be_valid
      end
      it 'buildは空でも保存できること' do
        @pur_shi_add.build = ''
        expect(@pur_shi_add).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'pos_codeが空だと保存できないこと' do
        @pur_shi_add.pos_code = ''
        @pur_shi_add.valid?
        expect(@pur_shi_add.errors.full_messages).to include("Pos code can't be blank")
      end
      it 'pos_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @pur_shi_add.pos_code = '1234567'
        @pur_shi_add.valid?
        expect(@pur_shi_add.errors.full_messages).to include("Pos code is invalid. Include hyphen(-)")
      end
      it 'prefect_idを選択していないと保存できないこと' do
        @pur_shi_add.prefect_id = '1'
        @pur_shi_add.valid?
        expect(@pur_shi_add.errors.full_messages).to include("Prefect can't be blank")
      end
      it 'municipalが空だと保存できないこと' do
        @pur_shi_add.municipal = ' '
        @pur_shi_add.valid?
        expect(@pur_shi_add.errors.full_messages).to include("Municipal can't be blank")
      end
      it 'addが空だと保存できないこと' do
        @pur_shi_add.add = ' '
        @pur_shi_add.valid?
        expect(@pur_shi_add.errors.full_messages).to include("Add can't be blank")
      end
      it 'tel_numが空だと保存できないこと' do
        @pur_shi_add.tel_num = ' '
        @pur_shi_add.valid?
        expect(@pur_shi_add.errors.full_messages).to include("Tel num can't be blank")
      end
      it 'tel_numに半角数字以外があると保存ができない' do
        @pur_shi_add.tel_num = '123-1234-21'
        @pur_shi_add.valid?
        expect(@pur_shi_add.errors.full_messages).to include("Tel num is invalid")
      end
      it 'tel_numが9桁以下では購入できない' do
        @pur_shi_add.tel_num = '123456789'
        @pur_shi_add.valid?
        expect(@pur_shi_add.errors.full_messages).to include("Tel num is invalid")
      end
      it 'tel_numが12桁以上では購入できない' do
        @pur_shi_add.tel_num = '123456789'
        @pur_shi_add.valid?
        expect(@pur_shi_add.errors.full_messages).to include("Tel num is invalid")
      end
      it 'tokenが空では登録できないこと' do
        @pur_shi_add.token = ' '
        @pur_shi_add.valid?
        expect(@pur_shi_add.errors.full_messages).to include("Token can't be blank")
      end

      it 'userが紐付いていなければ出品できない' do
        @pur_shi_add.user_id = nil
        @pur_shi_add.valid?
        expect(@pur_shi_add.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていなければ出品できない' do
        @pur_shi_add.item_id = nil
        @pur_shi_add.valid?
        expect(@pur_shi_add.errors.full_messages).to include("Item can't be blank")
      end



    end
  end
end

# ここの単体テストを実行するコマンド
# bundle exec rspec spec/models/pur_shi_add_spec.rb
