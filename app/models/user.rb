# app/models/user.rb

# app/models/user.rb
class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :name,  presence: true

  has_many :memberships, dependent: :destroy
  has_many :boards, through: :memberships
end