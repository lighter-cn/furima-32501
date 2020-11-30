# テーブル設計

## users テーブル

| Column          | Type     | Options     |
| --------------- | -------- | ----------- |
| email           | string   | null: false |
| password        | string   | null: false |
| name            | string   | null: false |
| last_name       | string   | null: false |
| first_name      | string   | null: false |
| last_name_kana  | string   | null: false |
| first_name_kana | string   | null: false |
| birthday        | datetime | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :purchases


## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| explanation     | text       | null: false                    |
| category        | string     | null: false                    |
| condition       | string     | null: false                    |
| shipping_charge | string     | null: false                    |
| shipping_source | string     | null: false                    |
| delivery_date   | string     | null: false                    |
| price           | string     | null: false                    |
| fee             | string     |                                |
| profit          | string     |                                |
| status          | references |                                |
| favorite        | references |                                |
| user_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :comments
- has_one    :purchase


## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user_id   | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item


## purchases テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| card_number   | text       | null: false                    |
| card_limit    | text       | null: false                    |
| security_code | text       | null: false                    |
| post_number   | text       | null: false                    |
| prefecture    | text       | null: false                    |
| city          | text       | null: false                    |
| house_number  | text       | null: false                    |
| building      | text       |                                |
| phone_number  | text       | null: false                    |
| user_id       | references | null: false, foreign_key: true |
| item_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item