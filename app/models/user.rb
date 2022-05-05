class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :favorite

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

has_many :reviews, dependent: :destroy
has_many :likes, dependent: :destroy

validates :nickname, presence: true
validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'Include both letters and numbers' }

validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
validates :favorite_id, numericality: { other_than: 1 , message: "can't be blank"}

end
