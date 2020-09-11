class Post < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy

  accepts_nested_attributes_for :photos
  # postモデルはphotoモデルの親なので以上の記述が必要
end
