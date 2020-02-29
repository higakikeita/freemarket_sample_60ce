# README

[![Image from Gyazo](https://i.gyazo.com/3900d76e27a47b7a172637f4f214f99d.jpg)](https://gyazo.com/3900d76e27a47b7a172637f4f214f99d)

# このアプリについて
 - メルカリクローンのフリマサイト
 - TECH:EXPERT 60期夜間メンバー５名にて作成
 - 制作期間:2019.Dec.21~2020.Mar.14
 - 使用Gemや機能、各担当箇所は以下に記載

# 制作メンバー
## 檜垣 慶太
### 実装内容
<a href="https://github.com/higakikeita"><img src="https://avatars0.githubusercontent.com/u/41051390?s=460&v=4" height="60px;" /></a>　

デプロイ担当AWS〜S3導入<br>

Basic認証 <br>
商品出品機能<br>
商品詳細表示<br>
コメント機能<br>
商品検索機能<br>
商品画像プレビュー<br>
ユーザープロフィール編集ページ<br>
## 王子 史也
### 実装内容
カテゴリ実装

## 鈴村 彩
### 実装内容
いいね機能実装
 
## 大石 夏実
### 実装内容
テストコード実装


## 上野 龍彦 
<a href="https://github.com/Tatsu88-Tokyo"><img src="https://avatars1.githubusercontent.com/u/57035748?s=460&v=4" width="100px;" />

### 実装内容
購入機能実装



# Gem/ver
* Ruby:2.5.1

* Rails:5.0.7.2

* System dependencies
 - gem 'mysql2':0.3.18
 - gem 'sass-rails:5.0
 - gem 'jquery-rails'
 - gem 'jbuilder', '~> 2.5'
 - gem 'capistrano'
 - gem 'rspec-rails'
 - gem 'rails-controller-testing'
 - gem 'factory_bot_rails'
 - gem 'pry-rails'
 - gem 'carrierwave'
 - gem 'fog-aws'
 - gem 'unicorn':5.4.1
 - gem 'faker':2.8
 - gem 'mini_magick'
 - gem 'font-awesome-sass'
 - gem 'haml-rails'
 - gem 'owlcarousel-rails'
 - gem 'devise'
 - gem 'active_hash'
 - gem 'ancestry'
 - gem 'omniauth-facebook'
 - gem 'omniauth-google-oauth2'
 - gem "omniauth-rails_csrf_protection"
 - gem 'gretel'
 - gem 'payjp'
 - gem 'ransack' 

# サイトURL（Basic認証キー）
 - ユーザー名:admin
 - パスワード:0322
 - パブリックIP:http://18.176.134.115/

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
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|birthday|date|null: false|

### Association
- has_many: products
- has_many: user-evaluates
- has_many: messages
- has_many: comments
- has_many: likes
- has_many: orders
- has_many: ship_to-addresses
- has_one: address
- has_one : creditcards

## productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string(191)|null: false, index: true|
|price|integer|null: false|
|explain|text|null: false|
|status|integer|null: false|
|prefecture|integer|null: false| 
|size|string|null: false| 
|postage|string|null: false|
|shipping_date|string|null: false|
|brand_id|references|null: false, foreign_key: true|
|buyer_id|integer||
|reservation_email|string||

### Association
- belongs_to : user
- has_many : comments
- has_many : messages
- has_many : likes
- has_many : product-images
- has_one: order
- belongs_to : brand
- belongs_to : categories

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

## likesテーブル(未実装)
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|

### Association
- belongs_to : user
- belongs_to : product 

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|references|null: false, foreign_key: true|
|product_image|text|null: false|

### Association
- belongs_to : product

## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|card_company|string|null: false| 
|card_number|string|null: false|
|card_year|integer|null: false| 
|card_month|integer|null: false| 
|card_pass|integer|null: false|
|cutomer_id|string|null: false|
|card_id|string|null: false|

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

## sns_credentialテーブル
|Column|Type|Options|
|------|----|-------|
|provider|string|null: false|
|uid|string|null: false|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to : user
