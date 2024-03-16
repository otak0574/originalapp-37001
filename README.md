## Customersテーブル

| column          | Type   | Options                        |
|-----------------|--------|--------------------------------|
| nickname        | string | null: false                    |
| email           | string | null: false, unique: true      |
| encrypted_password| string | null: false                    |
| phone_number    | integer| null: false                    |
| birth_date      | date   | null: false                    |
| gender_id       | integer| null: false                    |
| first_name      | string | null: false                    |
| last_name       | string | null: false                    |
| first_name_kana | string | null: false                    |
| last_name_kana  | string | null: false                    |

### Associations
- has_many :chats
- has_many :deli_statuses
- has_many :orders
- has_many :deli_adds

## Storesテーブル

| column          | Type   | Options     |
|-----------------|--------|-------------|
| name            | string | null: false |
| business_hours  | string | null: false |
| category_id     | string | null: false |
| address         | string | null: false |
| details         | text   |             |
| delivery_time   | string | null: false |

<!-- | loyalty_card_id | string |             | -->
### Associations
- has_many :carts
- has_many :store_items
- has_many :items, through: :store_items

## Itemsテーブル

| column       | Type    | Options     |
|--------------|---------|-------------|
| name         | string  | null: false |
| details      | text    | null: false |
| price        | integer | null: false |
| image        | string  | null: false |
| sale_price   | integer |             |
| category     | string  | null: false |
| tag          | string  |             |
| status       | string  | null: false |
| shelf_number | integer | null: false |

### Associations
- has_many :store_items
- has_many :order_items
- has_many :stores, through: :store_items
- has_many :orders, through: :order_items
- has_many :cart_items
- has_many :carts, through: :cart_items

## Store_itemsテーブル

| column   | Type       | Options                        |
|----------|------------|--------------------------------|
| item_id  | references | null: false, foreign_key: true |
| store_id | references | null: false, foreign_key: true |

### Associations
- belongs_to :store
- belongs_to :item

## Cartsテーブル

| column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| item_id       | references | null: false, foreign_key: true |
| store_id      | references | null: false, foreign_key: true |
| gift_wrapping | boolean    |                                |

### Associations
- belongs_to :store
- has_many :cart_items
- has_many :items, through: :cart_items
- has_one :order

## Carts_itemsテーブル
| column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| item_id       | references | null: false, foreign_key: true |
| cart_id       | references | null: false, foreign_key: true |
| sum           | boolean    |                                |

## Associations
- belongs_to :cart
- belongs_to :item

## Ordersテーブル

| column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| deli_add_id | references | null: false, foreign_key: true |
| cart_id     | references | null: false, foreign_key: true |
| customer_id | references | null: false, foreign_key: true |
| cart_id     | references | null: false, foreign_key: true |


### Associations
- belongs_to :customer
- belongs_to :cart
- has_many :order_items
- has_many :items, through: :order_items
- has_one :deli_status

## Order_itemsテーブル

| column     | Type       | Options                        |
|------------|------------|--------------------------------|
| order_id   | references | null: false, foreign_key: true |
| item_id    | references | null: false, foreign_key: true |
| item_count | integer    | null: false                    |

### Associations
- belongs_to :order
- belongs_to :item

## Deli_agentsテーブル

| column          | Type   | Options                        |
|-----------------|--------|--------------------------------|
| name            | string | null: false                    |
| email           | string | null: false, unique: true      |
| pass            | string | null: false                    |
| phone_number    | string | null: false                    |
| birth_date       | date   | null: false                    |
| license         | string |                                |
| car_number      | string |                                |
| first_name      | string | null: false                    |
| last_name       | string | null: false                    |
| first_name_kana | string | null: false                    |
| last_name_kana  | string | null: false                    |

### Associations
- has_many :chats
- has_many :deli_statuses

## Deli_statusesテーブル

| column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| deli_time     | string     | null: false                    |
| deli_agent_id | references | null: false, foreign_key: true |
| customer_id   | references | null: false, foreign_key: true |
| deli_add_id   | references | null: false, foreign_key: true |
| order_id      | references | null: false, foreign_key: true |


### Associations
- belongs_to :orders
- belongs_to :customer
- belongs_to :deli_agent
- belongs_to :deli_add

## Deli_addテーブル

| column       | Type   | Options     |
|--------------|--------|-------------|
| post_number  | string | null: false |
| pref_id      | string | null: false |
| city         | string | null: false |
| street       | string | null: false |
| building     | string |             |
| phone_number | string | null: false |
| customer_id  | string | null: false |

### Associations
- has_many :orders
- has_many :deli_statuses
- belongs_to :customer

## Chatsテーブル

| column       | Type       | Options                        |
|--------------|------------|--------------------------------|
| content      | text       | null: false                    |
| customer_id  | references | null: false, foreign_key: true |
| deli_agent_id| references | null: false, foreign_key: true |
| image        | string     |                                |

### Associations
- belongs_to :customer
- belongs_to :deli_agent
