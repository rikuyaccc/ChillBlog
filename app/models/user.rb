class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles
  has_many :favorites
  # Userがファボした記事
  has_many :favorite_articles, through: :favorites, source: :article

  validates :username, uniqueness: true, presence: true
end
