# app/controllers/boards_controller.rb
class BoardsController < ApplicationController
  def index
    render Views::Boards::Index.new(boards: Board.all)
  end

  def show
    render Views::Boards::Show.new(board: board)
  end

  def new
    render Views::Boards::New.new(board: Board.new)
  end

  def create
    @board = Board.new(board_params)
    @board.user = User.first
    if @board.save
      redirect_to boards_path, notice: "Board created."
    else
      render Views::Boards::New.new(board: @board), status: :unprocessable_entity
    end
  end

  private

  def board_params
    params.require(:board).permit(:name)
  end

  def board
    @board ||= Board.find(params[:id])
  end
end
