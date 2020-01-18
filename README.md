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

## ER図
<img width="1109" alt="メルカリ ER図" src="https://user-images.githubusercontent.com/57035748/72214994-446ef680-3550-11ea-88d7-f96c6443d596.png">


## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique:true|
|password|string|null: false|
|avatar|text||
|introduction|text||

### Association
- has_many: products
- has_many: user-evaluates
- has_many: messages
- has_many: comments
- has_many: likes
- has_many: orders
- has_many: ship_to-addresses
- has_one : profiles 
- has_one: address
- has_one : credit-cards


## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|phone_number|string|null: false, unique:true|
|user_id|references|foreign_key:true|
|birthday|integer|null: false|
### Association
- belongs_to : user


## productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|price|integer|null: false|
|introduction|text|null: false|
|status|integer|null: false| 
|size|string|null: false| 
|postage|string|null: false|
|region|string|null: false|
|delivery_date|string|null: false|
### Association
- belongs_to : user
- has_many : comments
- has_many : messages
- has_many : likes
- has_many : product-images
- has_one: order
- belongs_to : brand
- belongs_to : categories


## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|product_id|references|null: false, foreign_key: true|
### Association
- has_many : products


## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|message|text|null: false|
|user_id|references|null: false, foreign_key: true|
|order_id|references|null: false, foreign_key: true|
### Association
- belongs_to : user
- belongs_to : order


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|
### Association
- belongs_to : user
- belongs_to : product


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|ancestry|string||
### Association
- has_many : products


## ordersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|
|ship_to_address_id|references|null: false, foreign_key: true|
|order_number|integer|null: false|
### Association
- has_many: messages
- belongs_to : user
- belongs_to : product
- has_one : ship-to_address


## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|
### Association
- belongs_to : user
- belongs_to : product 


## product-imagesテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|references|null: false, foreign_key: true|
|product_image|text|null: false|
### Association
- belongs_to : product


## credit-cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|card_company|string|null: false| 
|card_number|string|null: false|
|card_year|integer|null: false| 
|card_month|integer|null: false| 
|card_pass|integer|null: false|
### Association
- belongs_to : user


## user-evaluatesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|evaluate|integer|null: false| 
### Association
- belongs_to : user


## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|postal_code|string|null: false| 
|prefecture|integer|null: false| 
|city|string|null: false| 
|address|string|null: false| 
|apartment|string|| 
### Association
- belongs_to : user 


## ship_to-addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|order_id|references|null: false, foreign_key: true|
|postal_code|string|null: false| 
|prefecture|integer|null: false| 
|city|string|null: false| 
|address|string|null: false| 
|apartment|string|| 
### Association
- belongs_to : order
- belongs_to : user