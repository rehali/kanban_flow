# app/controllers/columns/positions_controller.rb
module Columns
  class PositionsController < ApplicationController
    def update
      column = Column.find(params[:id])
      column.update!(position: params[:position])
      head :ok
    end
  end
end