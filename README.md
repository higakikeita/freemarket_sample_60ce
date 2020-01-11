# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique:true|
|password|string|null: false|
|avatar|text||
|introduction|text||
### Association
- has_many: products
- has_many: user-evaluates
- has_many: messages
- has_many: comments
- has_many: likes
- has_many: orders
- has_many: ship_to-addresses
- has_one : profiles 
- has_one: address
- has_one : credit-cards
## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|first-name|string|null: false|
|last-name|string|null: false|
|first-name_kana|string|null: false|
|last-name_kana|string|null: false|
|phone-number|string|null: false, unique:true|
|user_id|references|foreign_key:true|
### Association
- belongs_to : user
## productsテーブル
|Column|Type|Options|
|------|----|-------|
|product-name|string|null: false, index: true|
|price|integer|null: false|
|sell_user_id|references|null: false, foreign_key: true|
|buy_user_id|references|null: false, foreign_key: true|
|introduction|text|null: false|
|status|string|null: false| *要検討　Enum型
|size|string|null: false| *要検討　Enum型
|postage|string|null: false|*要検討　Enum型
|region|string|null: false|*要検討　Enum型
|delivery-date|string|null: false|*要検討　Enum型
### Association
- belongs_to : user
- has_many : comments
- has_many : messages
- has_many : likes
- has_many : product-images
- has_one: order
- belongs_to : brand
- belongs_to : high-category
- belongs_to : middle-category
- belongs_to : low-category
## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|brand-name|string|null: false|
|product_id|references|foreign_key: true|
### Association
- has_many : products
## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|message|text||
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|
### Association
- belongs_to : user
- belongs_to : order
## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text||
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|
### Association
- belongs_to : user
- belongs_to : product
## high-categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|high-category_name|string|null: false| *要検討　Enum型
|product_id|references|foreign_key: true|
### Association
- has_many : products
- has_many : middle-categories
## middle-categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|middle-category_name|string|null: false| *Enum
|high-category_id|references|foreign_key:true| 
|product_id|references|foreign_key: true|
### Association
- has_many : products
- has_many : low-categories
- belongs_to :high-category
## low-categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|low-category_name|string|null: false| *Enum
|middle-category_id|references|foreign_key:true| 
|product_id|references|foreign_key: true|
### Association
- has_many : products
- belongs_to :middle-category
## ordersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|
|ship-to_address_id|references|null: false, foreign_key: true|
|order-number|integer|null: false|*仮　使用しない可能性あり
### Association
- has_many: messages
- belongs_to : user
- has_one : product
- has_one : ship-to_address
## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|
### Association
- belongs_to : user
- belongs_to : product 
## product-imagesテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|references|null: false, foreign_key: true|
|product_image|text|null: false|
### Association
- belongs_to : product
## credit-cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|card_company|string|null: false| *要検討　Enum型
|card_number|string|null: false|
|card_year|integer|null: false| *要検討　Enum型
|card_month|integer|null: false| *要検討　Enum型
|card_pass|integer|null: false|
### Association
- belongs_to : user
## user-evaluatesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|evaluate|integer|null: false| *要検討　Enum型
### Association
- belongs_to : user
## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|postal-code|integer|null: false| 
|prefecture|string|null: false| *要検討　Enum型
|city|string|null: false| 
|address|string|null: false| 
|apartment|string|null: false| 
### Association
- belongs_to : user 
## ship_to-addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|order_id|references|null: false, foreign_key: true|
|postal-code|string|null: false| 
|prefecture|string|null: false| *要検討　Enum型
|city|string|null: false| 
|address|string|null: false| 
|apartment|string|null: false| 
### Association
- belongs_to : order
- belongs_to : user