## usersテーブル
| Column | Type       | Options                         | ユーザーテーブル
| ------ | ---------- | ------------------------------  |
| nickname  | string | null: false                      | ニックネーム
| email | string | null: false, unique: true            | メルアド
| encrypted_password | string | null: false             | パスワード
| name_ue   | string | null: false                      | 名前（姓)
| name_st   | string | null: false                      | 名前（名）
| kana_ue   | string | null: false                      | 名前（姓）カナ
| kana_st   | string | null: false                      | 名前（名）カナ
| birthday  | date   | null: false                      | 生年月日

### Association
-has_many :items
-has_many :pur


## itemsテーブル
| Column | Type       | Options                        | 商品テーブル
| ------ | ---------- | -------------------------------|
| item   | string     | null: false, foreign_key: true | 商品
| exp    | text       | null: false, foreign_key: true | 商品説明文
| cate   | string     | null: false, foreign_key: true | カテゴリー
| status | string     | null: false, foreign_key: true | 商品状態
| del_fee | string    | null: false, foreign_key: true | 配送料
| area   | string     | null: false, foreign_key: true | 発送元地域
| del_day | string    | null: false, foreign_key: true | 配送日
| price  | integer    | null: false, foreign_key: true | 価格

### Association
-belongs_to :user
-has_one :pur


## purテーブル
| Column | Type       | Options                        | 購入テーブル
| ------ | ---------- | ------------------------------ |
| seller |  string    | null: false, foreign_key: true | 出品者
| buyer  |  string    | null: false, foreign_key: true | 購入者

### Association
-belongs_to :item
-has_one :shi_add


## shi_addテーブル

| Column | Type           | Options                        | 配送先テーブル
| ------ | ---------------| -------------------------------|
| pos_code | string       | null: false, foreign_key: true | 郵便番号
| prefect_id | string     | null: false, foreign_key: true | 都道府県
| municipal_id | string   | null: false, foreign_key: true | 市区町村
| add |  string           | null: false, foreign_key: true | 番地
| build | string          | foreign_key: true              | 建物名
| tel_num | string        | null: false, foreign_key: true | 電話番号

### Association
-belongs_to :item
-belongs_to :pur

<!-- 以下はメモ欄 -------------------------------------------------------------------------------------------------------->

<!-- foreign_key: true -->
<!-- 購入履歴必要か -->
<!-- integer -->
<!-- Shipping address = 配送先 -->
<!-- スペルミスに気づきやすいようにカラムはなるべく短くする -->