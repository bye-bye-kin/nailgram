class Photo < ApplicationRecord
  belongs_to :post
  validate　:image, presence: true
  mount_uploader:image,imageUploader
end
