# アプリケーション名
pitta

# アプリケーション概要
子供服に特化した、ブランドによる大きさの違いを共有できる。

# URL

# テスト用アカウント

# 利用方法
１．トップページのヘッダーから新規登録を行う
２．投稿画面のフォームをすべて入力して投稿する

# アプリケーションを作成した背景
周囲の子育て世帯からヒアリングをし、「子供の服がブランドによってサイズ感が違く、ちょうどよいサイズを見つけづらいので、結局同じブランドばかりになってしまう」という悩みを抱えていることを知った。
サイズの表記の基準がブランドによって差があることが原因だと仮説を立てた。
そこで５歳までの子供服に絞って服のフィット感を共有することに特化したアプリ開発をすることにした。

## 洗い出した要件
https://docs.google.com/spreadsheets/d/1OdLULxcdf9HYA0uer1tAYz8CYPh7cTTE2X2OQkLipRg/edit?usp=sharing

## 実装した機能についての画像やGIFおよびその説明
## 実装予定の機能
## データベース設計
![ER図](pitta/app/assets/images/pitta.png")
## 画面遷移図
![画面遷移図](pitta/app/assets/images/pitta.drawio.png")
## 開発環境
## ローカルでの動作方法
## 工夫したポイント

## usersテーブル
| Column    | Type    | Options     |
| --------- | ------- | ----------- |
| nickname  | string  | null: false |
| age_id    | integer | null: false |(ActiveHash - Age)
| gender_id | integer | null: false |(ActiveHash - Gender)
| height    | integer | null: false |
| weight    | integer | null: false |
### Association
- has_many :posts
- has_many :favorites
- has_many :favorite_posts, through: :favorites, source: :post <!-- Userは多数のfavorite_postsを持つ。これはfavoritesを経由している-->

## postsテーブル
| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| user       | references | null: false, foreign_key: true |
| clothes_id | integer    | null: false |(ActiveHash - Clothes)
| season_id  | integer    | null: false |(ActiveHash - Season)
| brand_id   | integer    | null: false |(ActiveHash - Brand)
| fit_id     | integer    | null: false |(ActiveHash - Fit)
| comment    | text       | null: false |
### Association
- belongs_to :user
- has_many :favorites
- has_many :favorited_by, through: :favorites, source: :user

## favoritesテーブル
| Column | Type       | Options     |
| ------ | ---------- | ----------- |
| user   | references | null: false, foreign_key: true |
| post   | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- belongs_to :post