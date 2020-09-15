class Post < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :likes, ->{order(created_at: :desc)},dependent: :destroy
  has_many :comments, dependent: :destroy
  # dependent: :destroy...オブジェクトが削除される時、関連付けられたオブジェクトのdestroyメソッドが実行される。投稿が削除されれば、その投稿のいいねも消える。
  accepts_nested_attributes_for :photos
  # postモデルはphotoモデルの親なので以上の記述が必要
def liked_by(current_user)
  Like.find_by(user_id: current_user.id, post_id:id)
end
# user_idとpost_idが一致するlikeを探し、なければnilを返します。

end
