# app/models/user.rb

# app/models/user.rb
class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :name,  presence: true

  has_many :owned_boards, class_name: "Board", foreign_key: :user_id, dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :boards, through: :memberships
end