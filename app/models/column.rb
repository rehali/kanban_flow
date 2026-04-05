# app/models/column.rb
class Column < ApplicationRecord
  belongs_to :board, touch: true
  has_many :cards, -> { order(:position) }, dependent: :destroy

  scope :ordered, -> { order(:position) }

  before_create :set_position

  private

  def set_position
    self.position = board.columns.count
  end
end