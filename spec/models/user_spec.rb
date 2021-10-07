require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it '必要事項が間違いなく記入されえたら登録できる' do
      expect(@user).to be_valid
    end
    it 'nicknameが空では登録できない' do
      @user.nickname = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'パスワードが空だと登録できない' do
      @user.password = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'name_ueが無いとできない' do
      @user.name_ue = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("Name ue can't be blank")
    end
    it 'name_ueが半角で入力された時は失敗' do
      @user.name_ue = 'monimoni'
      @user.valid?
      expect(@user.errors.full_messages).to include("Name ue is invalid")
    end
    it 'name_stが無いとできない' do
      @user.name_st = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("Name st can't be blank")
    end
    it 'name_stが半角で入力された時は失敗' do
      @user.name_st = 'monimoni'
      @user.valid?
      expect(@user.errors.full_messages).to include("Name st is invalid")
    end
    it 'kana_ueが無いとできない' do
      @user.kana_ue = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana ue can't be blank")
    end
    it 'kana_ueが全角カナ以外で入力されたら失敗' do
      @user.kana_ue = 'もにか可愛い'
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana ue is invalid")
    end
    it 'kana_stが無いとできない' do
      @user.kana_st = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana st can't be blank")
    end
    it 'kana_stが全角カナ以外で入力されたら失敗' do
      @user.kana_st = 'もにか可愛い'
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana st is invalid")
    end
    it '生年月日が無いとできない' do
      @user.birthday  = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end

# 以下はメモ欄ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
# it '' do
# end
# Nickname can't be blank
# Name ue can't be blank
# Name st can't be blank
# Kana ue can't be blank
# Kana st can't be blank
# Birthday can't be blank
# Email can't be blank
# Password can't be blank
# カラム名 is invalid = 文字制限をしたときのエラー文