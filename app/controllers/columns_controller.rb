# app/controllers/columns_controller.rb
class ColumnsController < ApplicationController
  before_action :verify_board_access

  def create
    @board  = Board.find(params[:board_id])
    @column = @board.columns.build(column_params)
    @column.save
    redirect_to board_path(@board), status: :see_other
  end

  def update
    column.update(column_params)
    redirect_to board_path(column.board), status: :see_other
  end

  def destroy
    column.destroy
    redirect_to board_path(column.board), status: :see_other
  end

  private

  def verify_board_access
    board = params[:board_id] ? Board.find(params[:board_id]) : column.board
    unless board.user == current_user
      redirect_to boards_path, alert: "Access denied."
    end
  end

  def column
    @column ||= Column.find(params[:id])
  end

  def column_params
    params.expect(column: Views::Columns::ColumnForm.permitted)
  end
end