## usersテーブル
| Column    | Type    | Options     |
| --------- | ------- | ----------- |
| nickname  | string  | null: false |
| age_id    | integer | null: false |(ActiveHash - Age)
| gender_id | integer | null: false |(ActiveHash - Gender)
| height    | integer | null: false |
| weight    | integer | null: false |
### Association
has_many :posts
has_many :favorites
has_many :favorite_posts, through: :favorites, source: :post 
## Userは多数のfavorite_postsを持つ。これはfavoritesを経由している

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
belongs_to :user
has_many :favorites
has_many :favorited_by, through: :favorites, source: :user

## favoritesテーブル
| Column | Type       | Options     |
| ------ | ---------- | ----------- |
| user   | references | null: false, foreign_key: true |
| post   | references | null: false, foreign_key: true |
### Association
belongs_to :user
belongs_to :post