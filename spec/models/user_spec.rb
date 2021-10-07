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
    it '重複したメールアドレスは登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'メールアドレスに@を含まない場合は登録できない' do
      @user.email = 'monimoni'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it 'パスワードが空だと登録できない' do
      @user.password = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'パスワードが6文字未満では登録できない' do
      @user.password = 'mn12'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password","Password is too short (minimum is 6 characters)")
    end
    it '英字のみのパスワードでは登録できない' do
      @user.password = 'monimoni'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '数字のみのパスワードでは登録できない' do
      @user.password = '248368'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '全角文字を含むパスワードでは登録できない' do
      @user.password = "ああiii2"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'パスワードとパスワード（確認用）が不一致だと登録できない' do
      @user.password_confirmation = " "
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
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
# ・重複したメールアドレスは登録できない
# ・メールアドレスに@を含まない場合は登録できない
# パスワードが6文字未満では登録できない
# ・英字のみのパスワードでは登録できない
# ・数字のみのパスワードでは登録できない
# ・全角文字を含むパスワードでは登録できない
# ・パスワードとパスワード（確認用）が不一致だと登録できない
# binding.pry