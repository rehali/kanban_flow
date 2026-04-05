# app/controllers/cards/positions_controller.rb
module Cards
  class PositionsController < ApplicationController
    def update
      card = Card.find(params[:id])
      card.update!(
        position:  params[:position],
        column_id: params[:column_id] || card.column_id
      )
      head :ok
    end
  end
end