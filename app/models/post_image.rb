class PostImage < ApplicationRecord

  #アソシエーション
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # favoritesにログインユーザが存在する？
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

   #画像を表示する際には、image_idカラムを参照してね。
  attachment :image

end
