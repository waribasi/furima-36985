class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :nickname, presence: true
  validates :name_ue, presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/}
  validates :name_st, presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/}
  validates :kana_ue, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
  validates :kana_st, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
  validates :birthday, presence: true
  validates :password, format: { with:/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        #  has_many :items
        #  has_many :purs
end

# format: { with:}
# /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i