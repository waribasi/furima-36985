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
      end
    end
    
  end
end


# 以下はメモ欄ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
# pending "add some examples to (or delete) #{__FILE__}"
# テストコード
# bundle exec rspec spec/models/item_spec.rb