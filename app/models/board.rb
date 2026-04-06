# app/models/board.rb
# app/models/board.rb
class Board < ApplicationRecord
  belongs_to :user
  has_many :memberships, dependent: :destroy
  has_many :members, through: :memberships, source: :user
  has_many :columns, -> { order(:position) }, dependent: :destroy
  broadcasts_refreshes

  after_create :add_owner_as_member

  validates :name, presence: true, length: { maximum: 100 }

  private

  def add_owner_as_member
    memberships.find_or_create_by!(user: user, role: :admin)
  end
end
