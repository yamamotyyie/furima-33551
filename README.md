# FURIMAテーブル設計

## userテーブル
|   Column   |  Type  | Options   |
| ---------- | ------ | --------- |
| nickname | string | null: false |
| email | string | null: false |
| password | string | null: false |
| full-surname | string | null: false |
| full-name | string | null: false |
| half-surname | string | null: false |
| half-name | string | null: false |
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
| category | active_hash | null: false|
| status | active_hash | null: false |
| burden | active_hash | null: false |
| ship_from | active_hash | null: false |
| ship_day | active_hash | null: false |
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
- has_many :addresses

## addressesテーブル
|   Column   |  Type  | Options   |
| ---------- | ------ | --------- |
| purchase | reference | null: false foreign_key: true |
| postal_code | string | null: false |
| prefecture | active_hash | null:false|
| city | string | null: false|
| address | string | null: false |
| building | string | |
| number | string | null: false |

### Association
- belong_to :purchase