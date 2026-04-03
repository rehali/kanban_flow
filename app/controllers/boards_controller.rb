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
      render Views::Boards::New.new(board: @board)
    end
  end

  def edit
    render Views::Boards::Edit.new(board: board)
  end

  def update
    if board.update(board_params)
      redirect_to boards_path, notice: "Board updated."
    else
      render Views::Boards::Edit.new(board: board)
    end
  end

  def destroy
    board.destroy
    redirect_to boards_path, notice: "Board deleted."
  end

  private

  def board
    @board ||= Board.find(params[:id])
  end

  def board_params
    params.expect(board: Views::Boards::BoardForm.permitted)
  end
end
