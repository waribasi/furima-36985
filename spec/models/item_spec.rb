require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品登録' do

    context '商品が登録できる時' do
      it '必要事項が全て記入されたら登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品が登録できない時' do
      it '画像が選択してない時' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名をない時' do
        @item.item = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("Item can't be blank")
      end
      it '説明文が無い時' do
        @item.exp = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("Exp can't be blank")
      end
      it 'カテゴリー選択してないとだめ' do
        @item.cate_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Cate can't be blank")
      end
      it '状態選択してないとき' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it '送料が選択してない時' do
        @item.del_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Del fee can't be blank")
      end
      it '都道府県を選択してない時' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it '日数が選択してない時' do
        @item.del_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Del day can't be blank")
      end
      it '価格がない時' do
        @item.price = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '299円以下の時' do
        @item.price = 123
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '9999999円以上の時' do
        @item.price = 12345678903333333333333333
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it '価格に半角数字で入力された時' do
        @item.price = 12,000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end

    end
    
  end
end


# 以下はメモ欄ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
# pending "add some examples to (or delete) #{__FILE__}"
# テストコード
# bundle exec rspec spec/models/item_spec.rb
# it '' do
# end
# @item.text = ' '
# @item.valid?
# expect(@item.errors.full_messages).to include("Text can't be blank")
# binding.pry