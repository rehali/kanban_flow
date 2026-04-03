# app/models/board.rb
# app/models/board.rb
class Board < ApplicationRecord
  belongs_to :user, optional: true  # wired up properly in Module 11
  has_many :memberships, dependent: :destroy
  has_many :members, through: :memberships, source: :user
  has_many :columns, -> { order(:position) }, dependent: :destroy
  validates :name, presence: true, length: { maximum: 100 }
end
