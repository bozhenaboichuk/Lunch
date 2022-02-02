class Restaurant < ApplicationRecord
  has_many :dishes, dependent: :destroy
  has_one_attached :avatar

  validates :name, length: {minimum: 2}
  validates :address, length: {minimum: 3}, allow_blank: true
  validates :description, length: {minimum: 6}, allow_blank: true
  validates :phone_number, format: {without: /[a-zA-Z]+/, message: 'does not allow letters'},
    length: {minimum: 5}
end
