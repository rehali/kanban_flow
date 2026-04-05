# app/controllers/cards/positions_controller.rb
# app/controllers/cards/positions_controller.rb
module Cards
  class PositionsController < ApplicationController
    def update
      card      = Card.find(params[:id])
      column_id = params[:column_id] || card.column_id
      position  = params[:position].to_i

      Card.transaction do
        card.update_columns(column_id: column_id)
        cards = Card.where(column_id: column_id)
                    .where.not(id: card.id)
                    .order(:position)
                    .to_a
        cards.insert(position, card)
        cards.each_with_index do |c, i|
          c.update_columns(position: i)
        end
      end

      card.column.board.broadcast_refresh_later
      head :ok
    end
  end
end