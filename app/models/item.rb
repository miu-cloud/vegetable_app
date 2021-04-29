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

validate :date_before_start

  def date_before_start
    return if promise_at.blank?
    errors.add(:promise_at, "は現在の時刻以降のものを選択してください") if promise_at < DateTime.today
  end 
end
