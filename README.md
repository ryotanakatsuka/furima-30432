 # テーブル設計

  users テーブル

|Colum            |Type         |Options                                 |
|-----------------|-------------|----------------------------------------|
|nickname         |string       |null:false                              |
|email            |string       |null:false                              |
|password         |string       |null:false                              |
|birth_year       |date         |null:false                              |
|birth_month      |date         |null:false                              |
|birth_date       |date         |null:false                              |
|first_name       |string       |null:false                              |
|last_name        |string       |null:false                              |
|first_name_kana  |string       |null:false                              |
|last_name_kana   |string       |null:false                              |

     Association
-  has_many :items
-  has_many :purchases


  items テーブル

|Colum                   |Type         |Options                                 |
|------------------------|-------------|----------------------------------------|
|image(ActiveStorage)    |             |                                        |
|items_name              |string       |null:false                              |
|text                    |text         |null:false                              |
|category                |string       |null:false                              |
|condition               |string       |null:false                              |
|shipping_charges        |string       |null:false                              |
|delivery_source         |string       |null:false                              |
|delivery_date           |date         |null:false                              |
|user_id                 |references   |foreign_key: true                       |

   Association
- belongs_to user
- has_many_purchases

  purchases テーブル

|Colum                   |Type         |Options                                 |
|------------------------|-------------|----------------------------------------|
|card_number             |integer      |null:false                              |
|card_exp_month          |date         |null:false                              |
|card_exp_year           |date         |null:false                              |
|card_cvc                |integer      |null:false                              |
|postal_code             |string       |null:false                              |
|prefecture              |integer      |null:false                              |
|city                    |string       |null:false                              |
|addresses               |string         |null:false                            |
|building                |string         |null:false                            |
|phon_number             |integer         |null:false                           |
|user_id                 |references   |foreign_key: true                       |  
|item_id                 |references   |foreign_key: true                       |
 
  Association

- belongs_to user
- belongs_to item
 