# app/controllers/columns/positions_controller.rb
module Columns
  class PositionsController < ApplicationController
    def update
      column   = Column.find(params[:id])
      position = params[:position].to_i

      Column.transaction do
        columns = Column.where(board_id: column.board_id)
                        .where.not(id: column.id)
                        .order(:position)
                        .to_a
        columns.insert(position, column)
        columns.each_with_index do |c, i|
          c.update_columns(position: i)
        end
      end

      column.board.broadcast_refresh_later
      head :ok
    end
  end
end