# テーブル設計

## users テーブル ＊passwordはDeviseで設定

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false, unique: true |
| encrypted_password    | string | null: false |
| last_name             | string | null: false |
| first_name            | string | null: false |
| last_name_kana        | string | null: false |
| first_name_kana       | string | null: false |
| birthday              | date   | null: false |

### Association

- has_many :items
- has_many :orders

### Validation

- email
  - 「@」を含む形式であること
- password
  - 6文字以上、半角英数混合
- last_name
  - 全角、漢字、ひらがな、カタカナ
- first_name
  - 全角、漢字、ひらがな、カタカナ
- last_name_kana
  - 全角、カタカナ
- first_name_kana
  - 全角、カタカナ


## items テーブル *画像はActive Storage で持つ

| Column                 | Type       | Options     |
| ---------------------- | ---------- | ----------- |
| user                   | references | null: false, foreign-key: true |
| name                   | string     | null: false |
| info                   | text       | null: false |
| category_id            | integer    | null: false |
| status_id              | integer    | null: false |
| shipping_fee_status_id | integer    | null: false |
| prefecture_id          | integer    | null: false |
| delivery_schedule_id   | integer    | null: false |
| price                  | integer    | null: false |

### Association

- belongs_to :user
- has_one :order

### Validation

- price
  - 300から9,999,999の半角数字のみ


## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true unique: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| order         | references | null: false, foreign_key: true |
| postal_code   | string     | null: false |
| prefecture_id | integer    | null: false |
| city          | string     | null: false |
| address_line  | string     | null: false |
| building      | string     | null: true  |
| phone_number  | string     | null: false |

### Association

- belongs_to :order

### Validation

- postal_code
  - 「3桁ハイフン4桁」の半角文字列のみ
- phone_number
  - 10桁以上11桁以内の半角数値のみ
