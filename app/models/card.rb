# app/models/card.rb
class Card < ApplicationRecord
  belongs_to :column, touch: true
  scope :ordered, -> { order(:position) }
  before_create :set_position
  validates :title, presence: true

  private

  def set_position
    self.position = column.cards.count
  end
end