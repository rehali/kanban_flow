# app/controllers/boards_controller.rb
class BoardsController < ApplicationController
  def index
    render Views::Boards::Index.new(boards: current_user.owned_boards)
  end

  def show
    render Views::Boards::Show.new(board: board)
  end

  def new
    render Views::Boards::New.new(board: Board.new)
  end

  def create
    @board = current_user.owned_boards.build(board_params)
    if @board.save
      redirect_to board_path(@board), status: :see_other
    else
      render Views::Boards::New.new(board: @board),
             status: :unprocessable_entity
    end
  end

  def edit
    render Views::Boards::Edit.new(board: board)
  end

  def update
    if board.update(board_params)
      redirect_to board_path(board), status: :see_other
    else
      render Views::Boards::Edit.new(board: board),
             status: :unprocessable_entity
    end
  end

  def destroy
    board.destroy
    redirect_to boards_path, status: :see_other
  end

  private

  def board
    @board ||= Board.find(params[:id])
  end

  def board_params
    params.expect(board: Views::Boards::BoardForm.permitted)
  end
end