class Article < ApplicationRecord
  belongs_to :user
  has_many :favorites

  #existsの使い方
  # Articleモデルにユーザがいいねしているかを判定するメソッド
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
