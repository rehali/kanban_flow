# app/controllers/columns_controller.rb
class ColumnsController < ApplicationController
  def new
    @board  = Board.find(params[:board_id])
    @column = @board.columns.build
    render Views::Columns::New.new(column: @column, board: @board)
  end

  def create
    @board  = Board.find(params[:board_id])
    @column = @board.columns.build(column_params)
    if @column.save
      redirect_to board_path(@board), status: :see_other
    else
      render Views::Columns::New.new(column: @column, board: @board),
             status: :unprocessable_entity
    end
  end

  def edit
    render Views::Columns::Edit.new(column: column)
  end

  def update
    if column.update(column_params)
      redirect_to board_path(column.board), status: :see_other
    else
      render Views::Columns::Edit.new(column: column),
             status: :unprocessable_entity
    end
  end

  def destroy
    column.destroy
    redirect_to board_path(column.board), status: :see_other
  end

  private

  def column
    @column ||= Column.find(params[:id])
  end

  def column_params
    params.expect(column: Views::Columns::ColumnForm.permitted)
  end
end