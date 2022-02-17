# frozen_string_literal: true

class User < ApplicationRecord
  enum role: { basic: 0, admin: 1 }, _suffix: :role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders, dependent: :destroy
  # has_one_attached :avatar
  attr_accessor :avatar

  mount_uploader :avatar, AvatarUploader

  def guest?
    false
  end

  def name_or_email
    fname = first_name.strip
    lname = last_name.strip
    email = self.email.strip

    if fname.empty? || lname.empty?
      email[0, email.index('@')]
    else
      "#{fname} #{lname}".strip
    end
  end
end
