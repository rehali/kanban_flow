# app/controllers/boards_controller.rb
class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]
  before_action :authorize_view!,   only: [:show]
  before_action :authorize_edit!,   only: [:edit, :update]
  before_action :authorize_delete!, only: [:destroy]

  def index
    render Views::Boards::Index.new(boards: current_user.boards)
  end

  def show
    render Views::Boards::Show.new(board: @board,
                                   policy: policy_for(@board))
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
    render Views::Boards::Edit.new(board: @board)
  end

  def update
    if @board.update(board_params)
      redirect_to board_path(@board), status: :see_other
    else
      render Views::Boards::Edit.new(board: @board),
             status: :unprocessable_entity
    end
  end

  def destroy
    @board.destroy
    redirect_to boards_path, status: :see_other
  end

  private

  def set_board
    @board = Board.find(params[:id])
  end

  def authorize_view!   = authorize! :view?,        @board
  def authorize_edit!   = authorize! :edit_board?,  @board
  def authorize_delete! = authorize! :delete_board?, @board

  def board_params
    params.expect(board: Views::Boards::Form.permitted)
  end
end