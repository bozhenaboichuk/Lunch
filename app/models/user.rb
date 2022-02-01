class User < ApplicationRecord
  enum role: { basic: 0, admin: 1 }, _suffix: :role
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders
  has_one_attached :avatar

  def avatar_thumbnail
    if avatar.attached?
      avatar.variant(resize_to_fill: [150, nil]).processed
    else
      "/default.jpg"
    end
  end

  def guest?
    false
  end
end
