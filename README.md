usersテーブル

| Column          |Type     |Options  |
| ----------------|---------|-------- |
| nickname        |string   |null: false         |
| email           |string   |null: false         |
| encrypted_password   |string   |null: false         |
| first_name      |string   |null: false         |
| last_name       |string   |null: false         |
| first_name_kana |string   |null: false         |
| last_name_kana  |string   |null: false         |
| birthday        |date     |null: false         |

### Association
- has_many   :items
- has_many   :orders

itemsテーブル

| Column          |Type               |Options                    |
| ----------------|------------- |------------------------------- |
| name            |string        |null: false                     |
| price           |integer       |null: false                     |
| explanation     |text          |null: false                     |
| category_id     |integer       |null: false                     |
| condition_id    |integer       |null: false                     |
| delivery_from_id|integer       |null: false                     |
| delivery_fee_id |integer       |null: false                     |
| delivery_date_id|integer       |null: false                     |
| user            |references    |null: false, foreign_key: true  |

### Association
- belongs_to :user
- has_one    :order

ordersテーブル

| Column          |Type          |Options                         |
| ----------------|--------------|------------------------------- |
| item            |references    |null: false, foreign_key: true  |
| user            |references    |null: false, foreign_key: true  |

### Association
- belongs_to :item
- belongs_to :user
- has_one    :delivery

deliveriesテーブル

| Column          |Type          |Options                         |
| ----------------|--------------|------------------------------- |
| post_code       |string        |null: false                     |
| prefecture_id   |integer       |null: false                     |
| city            |string        |null: false                     |
| address         |string        |null: false                     |
| building_name   |string        |                                |
| phone_number    |string        |null: false                     |
| order           |references    |null: false, foreign_key: true  |

### Association
- belongs_to :order