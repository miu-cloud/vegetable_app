class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, presence: true
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  mount_uploader :icon, ImageUploader

  has_many :items, dependent: :destroy
  has_many :messages, dependent: :destroy

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト"
    end
  end
end
