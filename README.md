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
-has_many :purs


## itemsテーブル
| Column | Type       | Options                        | 商品テーブル
| ------ | ---------- | -------------------------------|
| item   | string     | null: false                    | 商品
| exp    | text       | null: false                    | 商品説明文
| cate_id   | integer  | null: false                   | カテゴリー
| status_id | integer  | null: false                   | 商品状態
| del_fee_id | integer | null: false                   | 配送料
| area_id   | integer  | null: false                   | 発送元地域
| del_day_id | integer | null: false                   | 配送日
| price  | integer    | null: false                    | 価格
| user | references | null: false, foreign_key: true |出品者

### Association
-belongs_to :user
-has_one :pur


## pursテーブル
| Column | Type       | Options                        | 購入テーブル
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true | 購入者
| item   | references | null: false, foreign_key: true | 購入履歴

### Association
-belongs_to :user
-belongs_to :item
-has_one :shi_add


## shi_addsテーブル

| Column | Type           | Options                        | 配送先テーブル
| ------ | ---------------| -------------------------------|
| pos_code | string       | null: false                    | 郵便番号
| prefect_id | integer    | null: false                    | 都道府県
| municipal | string      | null: false                    | 市区町村
| add |  string           | null: false                    | 番地
| build | string          |                                | 建物名
| tel_num | string        | null: false,                   | 電話番号

### Association
-belongs_to :pur

<!-- 以下はメモ欄 -------------------------------------------------------------------------------------------------------->

<!-- foreign_key: true -->
<!-- 購入履歴必要か -->
<!-- integer -->
<!-- Shipping address = 配送先 -->
<!-- スペルミスに気づきやすいようにカラムはなるべく短くする -->
<!-- Purchase history=購入履歴 しかし勘違いだったw-->
<!-- references -->