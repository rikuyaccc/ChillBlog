class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles
  has_many :favorites
  # Userがファボした記事
  has_many :favorite_articles, through: :favorites, source: :article

  #=====================自分がフォローしているユーザとの関連=======================
  has_many :active_relationships, class_name: 'Relationship', foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower
  #=======================================================================

  #====================自分がフォローされるユーザとの関連=========================
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following
  #=======================================================================

  validates :username, uniqueness: true, presence: true

  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end
end
