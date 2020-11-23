usersテーブル

| Column          |Type     |Options  |
| ----------------|---------|-------- |
| nickname        |string   |         |
| email           |string   |         |
| password        |string   |         |
| first_name      |string   |         |
| last_name       |string   |         |
| first_name_kana |string   |         |
| last_name_kana  |string   |         |
| birth_year      |integer  |         |
| birth_month     |integer  |         |
| birth_day       |integer  |         |

itemsテーブル

| Column          |Type               |Options                    |
| ----------------|------------- |------------------------------- |
| name            |string        |null: false                     |
| price           |integer       |null: false                     |
| explanation     |text          |null: false                     |
| category        |text          |null: false                     |
| condition       |text          |null: false                     |
| delivery_from   |string        |null: false                     |
| delivery_fee    |string        |null: false                     |
| delivery_date   |string        |null: false                     |
| user            |references    |null: false, foreign_key: true  |

ordersテーブル

| Column          |Type          |Options                         |
| ----------------|--------------|------------------------------- |
| price           |integer       |null: false                     |
| post_code       |integer       |null: false                     |
| prefecture      |string        |null: false                     |
| city            |string        |null: false                     |
| address         |string        |null: false                     |
| building_name   |string        |null: false                     |
| phone_number    |string        |null: false                     |
| items           |references    |null: false, foreign_key: true  |
| users           |references    |null: false, foreign_key: true  |