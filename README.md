# テーブル設計

## users テーブル

| Column                  | Type    | Options     |
| ----------------------- | ------- | ----------- |
| nickname                | string  | null: false |
| email                   | string  | null: false |
| password                | string  | null: false |
| password_confirmation   | string  | null: false |
| family_name             | string  | null: false |
| first_name              | string  | null: false |
| family_name_kana        | string  | null: false |
| first_name_kana         | string  | null: false |
| birthday_year           | integer | null: false |
| birthday_month          | integer | null: false |
| birthday                | integer | null: false |

### Association

- has_many :items
- has_one :buy
 

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | -------------------------------|
| item_image      | string     | null: false                    |
| item_name       | string     | null: false                    |
| category        | string     | null: false                    |
| item_status     | string     | null: false                    |
| burden_amount   | string     | null: false                    |
| shipment_source | string     | null: false                    |
| price           | string     | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :buy


## buys テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefecture     | integer    | null: false                    |
| city           | string     | null: false                    |
| house_number   | string     | null: false                    |
| building_name  | string     | null: false                    |
| price          | string     | null: false                    |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
