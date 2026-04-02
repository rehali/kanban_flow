# app/controllers/boards_controller.rb
class BoardsController < ApplicationController
  def index
    render Views::Boards::Index.new(boards: Board.all)
  end

  def show
    render Views::Boards::Show.new(board: board)
  end

  private

  def board
    @board ||= Board.find(params[:id])
  end
end
