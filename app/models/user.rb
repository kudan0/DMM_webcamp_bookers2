class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 画像アップ用のメゾット
  attachment :profile_image

  has_many :books, dependent: :destroy
   
  validates :name,
    presence: true, uniqueness: true, length: { in: 2..20 }
  
  validates :introduction,
    length: { maximum: 50 }

end
