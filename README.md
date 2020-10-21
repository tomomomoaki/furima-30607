# README

# テーブル設計


## users テーブル

| Column            | Type    | Options     |
| ----------------- | ------- | ----------- |
| nickname          | string  | null: false |
| email             | string  | null: false |
| encrypted_password| string  | null: false |
| last_name         | string  | null: false |
| first_name        | string  | null: false |
| last_name_key     | string  | null: false |
| first_name_key    | string  | null: false |
| birthday          | date    | null: false |

### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| name               | string     | null: false                   |
| explanation        | text       | null: false                   |
| category_id        | integer    | null: false                   |
| status_id          | integer    | null: false                   |
| shipping_charge_id | integer    | null: false                   |
| prefecture_id      | integer    | null: false                   |
| days_to_ship_id    | integer    | null: false                   |
| price              | integer    | null: false                   |
| user               | references | null: false, foreign_key :true|

### Association

- belongs_to :user
- has_one :buyer

## buyers テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key :true |
| item            | references | null: false, foreign_key :true |


### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## addresses テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| municipality    | string     | null: false                    |
| address         | string     | null: false                    |
| house_number    | string     | -----------                    |
| phone_number    | string     | null: false                    |
| buyer           | references | null: false, foreign_key :true |

### Association

- belongs_to :buyer

