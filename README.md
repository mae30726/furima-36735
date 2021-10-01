## users

| Column                     | Type   | Options                   |
|----------------------------|--------|------- -------------------|
| nickname                   | string | null: false               |
| email                      | string | null: false, unique: true |
| encrypted_password         | string | null: false               |
| user_last_name             | string | null: false               |
| user_first_name            | string | null: false               |
| user_last_name_kana        | string | null: false               |
| user_first_name_kana       | string | null: false               |
| birthday                   | date   | null: false               |

### Association
has_many :items
has_many :purchases


## items
| Column                       | Type       | Options           |
|------------------------------|------------|-------------------|
| item_name                    | string     | null: false       |
| explanation                  | text       | null: false       |
| category_id                  | integer    | null: false       |
| condition_id                 | integer    | null: false       |
| shipping_cost_responsible_id | integer    | null: false       |
| shipping_from_id             | integer    | null: false       |
| shipping_date_id             | integer    | null: false       |
| price                        | integer    | null: false       |
| user                         | references | foreign_key: true |

### Association
belongs_to :user
has_one :purchase


## purchases
| Column | Type       | Options           |
|--------|------------|-------------------|
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

### Association
belongs_to :item
has_one :destination
belongs_to :user


## destinations
| Column       | Type       | Options           |
|--------------|------------|-------------------|
| postcode     | string     | null: false       |
| prefecture   | integer    | null: false       |
| city         | string     | null: false       |
| block        | string     | null: false       |
| building     | string     |                   |
| phone_number | string     | null: false       |
| purchase     | references | foreign_key: true |

### Association
belongs_to :purchase