# app/models/membership.rb
class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :board

  enum :role, { member: 0, admin: 1 }, default: :member
end