class Photo < ApplicationRecord
  belongs_to :post
  validate　:image, presence: true
end
