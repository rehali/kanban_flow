# app/models/card.rb
class Card < ApplicationRecord
  belongs_to :column

  scope :ordered, -> { order(:position) }
end