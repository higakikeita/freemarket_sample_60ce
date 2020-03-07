# README

![Image from Gyazo](https://gyazo.com/6a8ea91986422ee494d2b0153749c315.jpg)

# このアプリについて
 - メルカリクローンのフリマサイト
 - TECH::EXPERT 60期夜間メンバー５名にて作成
 - 制作期間:December 21st,2019 ~ March 14th,2020
 - 使用Gemや機能、各担当箇所は以下に記載

# 制作メンバー
## 檜垣 慶太
### 実装内容
<a href="https://github.com/higakikeita"><img src="https://avatars0.githubusercontent.com/u/41051390?s=460&v=4" height="100px;" /></a>

デプロイ担当AWS EC2〜S3導入<br>
Nginx,Unicorn,Capistrano導入<br>
Basic認証 <br>
商品出品機能<br>
商品詳細表示<br>
コメント機能<br>
コメントAjax処理<br>
商品編集機能<br>
商品検索機能<br>
商品画像プレビュー表示<br>
ユーザープロフィール編集ページ<br>
未実装ページCSSコーディング

## fo-ji
<a href="https://github.com/fo-ji"><img src="https://avatars0.githubusercontent.com/u/57491651?s=460&v=4" height="100px;" /></a>

### 実装内容
ER図作成<br>
TOPページ_マークアップ<br>
ユーザー登録_Google認証の実装<br>
ユーザー新規登録/ログインページ_マークアップ<br>
マイページ_本人情報編集の実装<br>
商品カテゴリ機能_マークアップ&サーバーサイド<br>
タイムセール機能（*開発環境のみ）<br>
商品一覧ページ_単体テスト

## ayaszmr
<a href="https://github.com/ayaszmr"><img src="https://avatars0.githubusercontent.com/u/56391010?s=460&v=4" height="100px;" /></a>

### 実装内容
いいね機能実装<br>
マイページ作成<br>
商品削除機能<br>

 
## 大石 夏実
### 実装内容
ユーザー新規登録画面（ビュー）作成<br>
OmniAuthを用いたFacebookでのログイン<br>
パンくず実装<br>
テストコード実装（商品出品、ユーザー新規登録、ログイン）<br>
商品検索画面（ビュー）作成<br>


## Tatsu88-Tokyo
<a href="https://github.com/Tatsu88-Tokyo"><img src="https://avatars1.githubusercontent.com/u/57035748?s=460&v=4" width="100px;" />

### 実装内容
スクラムマスター<br>
ユーザー新規登録（セッションを用いたWizard形式）/ログアウト<br>
クレジットカード登録（Payjp)<br>
クレジットカード情報表示(Payjp)<br>
商品購入機能実装（Payjp)<br>
取り置き機能（オリジナル）<br>
Twitter APIを用いた新規登録＋ログイン(オリジナル）<br>
Twitterへのリンクシェア機能（オリジナル）<br>
README編集


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
 - gem 'kaminari'

# サイトURL（Basic認証キー）
 - ユーザー名:admin
 - パスワード:0322
 - パブリックIP:http://18.176.134.115/

## ER図

![ER図_team_c_メルカリ](https://user-images.githubusercontent.com/57035748/75970856-4e8bf080-5f14-11ea-9c63-d8da68c1b493.jpeg)

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
|brand|references|null: false, foreign_key: true|
|buyer_id|integer||
|reservation_email|string||
|user|references|index: true, foreign_key: true|

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
|comment|text|
|user|references|null: false, foreign_key: true|
|product|references|null: false, foreign_key: true|

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

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|product|references|null: false, foreign_key: true|

### Association
- belongs_to : user
- belongs_to : product 

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|product|references|null: false, foreign_key: true|
|product_image|text|null: false|

### Association
- belongs_to : product

## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
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
|user|references|null: false, foreign_key: true|
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
|user|references|null: false, foreign_key: true|

### Association
- belongs_to : user
