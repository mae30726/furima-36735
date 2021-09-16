## users

| Column                     | Type    | Options     |
|----------------------------|---------|-------------|
| nickname                   | string  | null: false |
| email                      | string  | null: false |
| encrypted_password         | string  | null: false |
| encrypted_password_confirm | string  | null: false |
| user_name                  | string  | null: false |
| user_name_kana             | string  | null: false |
| birthday_year              | integer | null: false |
| birthday_month             | integer | null: false |
| birthday_date              | integer | null: false |

### Association
has_many :items
has_many :purchases


## items
| Column                    | Type       | Options     |
|---------------------------|------------|-------------|
| image                     |            |             |
| item_name                 | string     | null: false |
| explanation               | text       | null: false |
| category                  | string     | null: false |
| condition                 | string     | null: false |
| shipping_cost_responsible | string     | null: false |
| shipping_from             | string     | null: false |
| shipping_date             | string     | null: false |
| price                     | integer    | null: false |
| user_id                   | references | foreign_key: true |

### Association
belongs_to :user
belongs_to :purchase


## purchases
| Column  | Type       | Options           |
|---------|------------|-------------------|
| user_id | references | foreign_key: true |
| item_id | references | foreign_key: true |

### Association
has_one :item
has_one :destination
belongs_to :user


## destinations
| Column       | Type       | Options           |
|--------------|------------|-------------------|
| postcode     | string     | null: false       |
| prefecture   | string     | null: false       |
| city         | string     | null: false       |
| block        | string     | null: false       |
| building     | string     |                   |
| phone_number | integer    | null: false       |
| purchase_id  | references | foreign_key: true |

### Association
belongs_to :purchase