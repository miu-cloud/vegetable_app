class Item < ApplicationRecord
 belongs_to :user
 mount_uploader :image, ImageUploader

 with_options presence: true do
     validates :title, format: { with: /\A[ァ-ヶー－]+\z/, message: :katakana }
     validates :content
     validates :count
     validates :place
     validates :promise_at
     validates :state
     validates :image
 end
 
end
