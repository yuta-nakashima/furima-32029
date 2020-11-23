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
- has_many   :deliveries

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
| price           |integer       |null: false                     |
| item            |references    |null: false, foreign_key: true  |
| delivery        |references    |null: false, foreign_key: true  |

### Association
- belongs_to :item
- has_many   :deliveries

deliveriesテーブル

| Column          |Type          |Options                         |
| ----------------|--------------|------------------------------- |
| post_code       |integer       |null: false                     |
| prefecture      |string        |null: false                     |
| city            |string        |null: false                     |
| address         |string        |null: false                     |
| building_name   |string        |null: false                     |
| phone_number    |string        |null: false                     |
| order           |references    |null: false, foreign_key: true  |
| user            |references    |null: false, foreign_key: true  |

### Association
- belongs_to :order
- belongs_to :users