# README

# テーブル設計


## users テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| last_name       | string  | null: false |
| first_name      | string  | null: false |
| last_name_key   | string  | null: false |
| first_name_key  | string  | null: false |
| birthday_year   | integer | null: false |
| birthday_month  | integer | null: false |
| birthday_date   | integer | null: false |

### Association

- has_many :items
- has_one :card

## items テーブル

| Column          | Type       | Options                       |
| --------------- | ---------- | ----------------------------- |
| image           | active     | -----------                   |
| name            | text       | null: false                   |
| explanation     | text       | null: false                   |
| category        | string     | null: false                   |
| status          | string     | null: false                   |
| shipping_charge | string     | null: false                   |
| shipping_area   | string     | null: false                   |
| days_to_ship    | string     | null: false                   |
| price           | integer    | null: false                   |
| user            | references | null: false, foreign_key :true|

### Association

- belongs_to :user
- has_one :card

## cards テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| number          | integer    | null: false                    |
| limit           | integer    | null: false                    |
| security_code   | integer    | null: false                    |
| user            | references | null: false, foreign_key :true |
| item            | references | null: false, foreign_key :true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## addresses テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | integer    | null: false                    |
| prefecture      | string     | null: false                    |
| municipality    | string     | null: false                    |
| house_number    | string     | -----------                    |
| phone_number    | integer    | null: false                    |
| card            | references | null: false, foreign_key :true |

### Association

- belongs_to :card
