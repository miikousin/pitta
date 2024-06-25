class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :age
  belongs_to :gender

  #postモデルとのアソシエーション
  has_many :posts

  validates :nickname, presence: { message: 'を入力してください' }
  validates :height, presence: { message: 'を入力してください' }, numericality: { message: 'は半角数値で入力してください' }
  validates :weight, presence: { message: 'を入力してください' }, numericality: { message: 'は半角数値で入力してください' }
  validates :age_id, numericality: { other_than: 1 }# id:1以外のときに保存できる
  validates :gender_id, numericality: { other_than: 1 }

end

