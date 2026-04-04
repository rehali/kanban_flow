# app/controllers/cards_controller.rb
class CardsController < ApplicationController
  def new
    @column = Column.find(params[:column_id])
    @card   = @column.cards.build
    render Views::Cards::New.new(card: @card, column: @column)
  end

  def create
    @column = Column.find(params[:column_id])
    @card   = @column.cards.build(card_params)
    if @card.save
      redirect_to board_path(@column.board), status: :see_other
    else
      render Views::Cards::New.new(card: @card, column: @column),
             status: :unprocessable_entity
    end
  end

  def edit
    render Views::Cards::Edit.new(card: card)
  end

  def update
    if card.update(card_params)
      redirect_to board_path(card.column.board), status: :see_other
    else
      render Views::Cards::Edit.new(card: card),
             status: :unprocessable_entity
    end
  end

  def destroy
    card.destroy
    redirect_to board_path(card.column.board), status: :see_other
  end

  private

  def card
    @card ||= Card.find(params[:id])
  end

  def card_params
    params.expect(card: Views::Cards::CardForm.permitted)
  end
end