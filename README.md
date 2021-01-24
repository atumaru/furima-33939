# テーブル設計

## users テーブル

| Column                   |  Type    | Options                   |
|--------------------------|----------|---------------------------|
| nickname                 | string   | null: false               |
| email                    | string   | null: false, unique: true |
| encrypted_password       | string   | null: false               |
| last_name                | string   | null: false               |
| first_name               | string   | null: false               |
| last_name_kana           | string   | null: false               |
| first_name_kana          | string   | null: false               |
| birth_date               | date     | null: false               |

### Association

-has_many :items
-has_many :orders

## items テーブル

| Column                      |  Type     | Options            |
|---------------------------- |-----------|--------------------|
| item_name                   | string    | null: false        |
| item_info                   | text      | null: false        |
| item_category_id            | integer   | null: false        |
| item_sales_status_id        | integer   | null: false        |
| item_shipping_fee_status_id | integer   | null: false        |
| item_prefecture_id          | integer   | null: false        |
| item_scheduled_delivery_id  | integer   | null: false        |
| item_price                  | integer   | null: false        |
| user                        | references| foreign_key: true  |


### Association

-belongs_to :user
-has_one   :order

## orders テーブル

| Column         |  Type     | Options           |
|----------------|---------- |-------------------|
| user           | references| foreign_key: true |
| item           | references| foreign_key: true |


### Association

-belongs_to :user
-belongs_to :item
-has_one    :delivery

## delivery テーブル

| Column         |  Type       | Options            |
|----------------|-------------|--------------------|
| card_number    | integer     | null: false        |
| card_exp_month | integer     | null: false        |
| card-exp_year  | integer     | null: false        |
| card_exp_cvc   | integer     | null: false        |
| postal_code    | integer     | null: false        |
| prefecture_id  | integer     | null: false        |
| city           | string      | null: false        |
| addresses      | string      | null: false        |
| building       | string      |                    |
| phone_number   | integer     | null:false         |
| order          | references  | foreign_key:  true |

-belongs_to  :order