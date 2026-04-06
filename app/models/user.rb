# app/models/user.rb
class User < ApplicationRecord
  has_secure_password

  generates_token_for :password_reset, expires_in: 15.minutes do
    password_salt.last(10)
  end

  has_many :sessions, dependent: :destroy
  validates :email, presence: true, uniqueness: true
  validates :name,  presence: true

  has_many :owned_boards, class_name: "Board", foreign_key: :user_id, dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :boards, through: :memberships

  # Rails 8 Auth uses email_address so we need to alias it here
  alias_attribute :email_address, :email
end