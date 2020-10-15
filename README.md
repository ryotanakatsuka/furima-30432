 # テーブル設計

  users テーブル

|Colum            |Type         |Options                                 |
|---------------------|-------------|----------------------------------------|
|nickname             |string       |null:false                              |
|email                |string       |null:false                              |
|encrypted_password   |string       |null:false, default: ""                 |
|birth_day            |date         |null:false                              |
|first_name           |string       |null:false                              |
|last_name            |string       |null:false                              |
|first_name_kana      |string       |null:false                              |
|last_name_kana       |string       |null:false                              |

     Association
-  has_many :items
-  has_many :purchases


  items テーブル

|Colum                   |Type         |Options                                 |
|------------------------|-------------|----------------------------------------|
|name                    |string       |null:false                              |
|text                    |text         |null:false                              |
|category_id             |integer      |null:false                              |
|condition_id            |integer      |null:false                              |
|shipping_charges_id     |integer      |null:false                              |
|delivery_source_id      |integer      |null:false                              |
|delivery_date_id        |date         |null:false                              |
|price                   |integer      |null:false                              |
|user_id                 |references   |foreign_key: true                       |

   Association
- belongs_to user
- has_one purchase

 
  purchases テーブル

|Colum                   |Type         |Options                                 |
|------------------------|-------------|----------------------------------------|
|user_id                 |references   |foreign_key: true                       |  
|item_id                 |references   |foreign_key: true                       |

 Association

- belongs_to user
- belongs_to address
- belongs_to item

  addresses テーブル

|Colum                   |Type         |Options                                 |
|------------------------|-------------|----------------------------------------|
|postal_code             |string       |null:false                              |
|prefecture_id           |integer      |null:false                              |
|city                    |string       |null:false                              |
|addresses               |string       |null:false                              |
|building                |string       |                                        |
|phone_number            |string       |null:false                              |
 
  Association

- has_one purchase