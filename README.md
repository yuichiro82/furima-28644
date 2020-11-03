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
- has_one :buy
- has_one :address
 

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | -------------------------------|
| name            | string     | null: false                    |
| text            | text       | null: false                    |
| category        | integer    | null: false                    |
| item_status     | integer    | null: false                    |
| burden_amount   | integer    | null: false                    |
| shipment_source | integer    | null: false                    |
| days_to_ship    | integer    | null: false                    |
| price           | string     | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :address
- has_one    :buy

## address テーブル

| Column         | Type       | Options                                     |
| -------------- | ---------- | ------------------------------------------- |
| postal_code    | string     | default: "", null: false                    |
| prefecture_id  | integer    |              null: false                    |
| city           | string     | default: "", null: false                    |
| house_number   | string     | default: "", null: false                    |
| building_name  | string     | default: ""                                 |
| phone_number   | string     | default: "", null: false                    |
| user           | references |              null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one    :buy

## buys テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |
| address        | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- belongs_to :address
