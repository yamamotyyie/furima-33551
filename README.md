# FURIMAテーブル設計

## userテーブル
|   Column   |  Type  | Options   |
| ---------- | ------ | --------- |
| nickname | string | null: false |
| email | string | null: false |
| encrypted_password | string | null: false |
| full_surname | string | null: false |
| full_name | string | null: false |
| half_surname | string | null: false |
| half_name | string | null: false |
| birthday | date | null: false |

### Association
- has_many :items
- has_many :purchases

## itemsテーブル
|   Column   |  Type  | Options   |
| ---------- | ------ | --------- |
| user | reference | null: false foreign_key: true |
| item_name | string | null:false |
| text | text | null: false |
| category_id | integer active_hash| null: false|
| status_id | integer active_hash| null: false |
| burden_id | integer active_hash| null: false |
| prefecture_id | integer active_hash| null: false |
| ship_day_id | integer active_hash| null: false |
| price | integer | null: false |

### Association
- belong_to :user
- has_one :purchase

## purchasesテーブル
|   Column   |    Type   |   Options   |
| ---------- | --------- | ----------- |
|    user    | reference | null: false foreign_key: true|
|    item   | reference | null: false foreign_key: true|

### Association
- belong_to :user
- belong_to :item
- has_one :address

## addressesテーブル
|   Column   |  Type  | Options   |
| ---------- | ------ | --------- |
| purchase | reference | null: false foreign_key: true |
| postal_code | string | null: false |
| prefecture_id | integer active_hash| null:false|
| city | string | null: false|
| address | string | null: false |
| building | string | |
| number | string | null: false |

### Association
- belong_to :purchase