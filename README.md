## usersテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------  |
| nickname  | storing | null: false                      |
| email | storing | null: false, ユニーク制約              |
| password    | storing | null: false, 6字以上半角英数字混  |
| name    | storing | null: false, 全角                   |
| name_kana | storing | null: false, 全角カナ              |
| birthday        | storing | null: false                |

### Association
-has_many :items
-has_many :purchases

## itemsテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| image  | storing  | null: false                      |
| item   | storing  | null: false                      |
| explanation | text     | null: false                 |
| category | storing  | null: false                    |
| status | storing  | null: false                      |
| delivery_fee | storing   | null: false               |
| area | storing  | null: false                        |
| deliver_day | storing  | null: false                 |
| price | storing   | null: false, 半角数字              |

### Association
-belongs_to :users
-has_one :purchases


## purchasesテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| postal_code | storing    | null: false, 3桁-4桁       |
| prefectures | storing    | null: false                |
| municipalities | storing | null: false                 |
| address |  storing       | null: false                  |
| building |  storing      |                               |
| telephone_number | storing | null: false,10桁以上11桁以内    |


### Association
-has_one :items
-belongs_to :users





<!-- 以下はメモ欄 -------------------------------------------------------------------------------------------------------->
<!-- | password(確認) | storing | null: false                | -->