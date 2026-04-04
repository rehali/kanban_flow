# app/models/column.rb
class Column < ApplicationRecord
  belongs_to :board
  has_many :cards, -> { order(:position) }, dependent: :destroy

  scope :ordered, -> { order(:position) }
end