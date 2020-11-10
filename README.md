# README

# テーブル設計

## users テーブル

| Column                  | Type    | Options     |
| ----------------------- | ------- | ----------- |
| nickname                | string  | null: false |
| email                   | string  | null: false |
| encrypted_password      | string  | null: false |
| family_name             | string  | null: false |
| first_name              | string  | null: false |
| family_name_kana        | string  | null: false |
| first_name_kana         | string  | null: false |
| birthday                | date    | null: false |

### Association

- has_many :items
- has_many :orders
 

## items テーブル

| Column                | Type       | Options                        |
| ----------------------| ---------- | -------------------------------|
| name                  | string     | null: false                    |
| text                  | text       | null: false                    |
| category_id           | integer    | null: false                    |
| item_status_id        | integer    | null: false                    |
| burden_amount_id      | integer    | null: false                    |
| shipment_source_id    | integer    | null: false                    |
| delivery_schedule_id  | integer    | null: false                    |
| price                 | string     | null: false                    |
| user                  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :order


## address テーブル

| Column         | Type       | Options                                     |
| -------------- | ---------- | ------------------------------------------- |
| postal_code    | string     | default: "", null: false                    |
| prefecture_id  | integer    |              null: false                    |
| city           | string     | default: "", null: false                    |
| house_number   | string     | default: "", null: false                    |
| building_name  | string     | default: ""                                 |
| phone_number   | string     | default: "", null: false                    |

### Association

- belongs_to  :order

## orders テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |
| address        | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

