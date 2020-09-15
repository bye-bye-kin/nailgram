class Like < ApplicationRecord
  belongs_to :user
  # userモデル側にはhas_many。これでアソシエーションの設定ができる
  belongs_to :post
  validates :user_id,uniqueness:{scope: :post_id}
  #一つの投稿に対して一度だけいいねを押せるようにしたい。
  # uniqueness....オブジェクトが保存される前に、属性の直が重複していないことを検証する。（user_idとpost_id の重複を防ぐ）
end
