class PostImage < ApplicationRecord

  # userモデルとアソシエーション
  belongs_to :user

   #画像を表示する際には、image_idカラムを参照してね。
  attachment :image

end
