# app/controllers/cards_controller.rb
class CardsController < ApplicationController
  def create
    @column = Column.find(params[:column_id])
    @card   = @column.cards.build(card_params)
    @card.save
    redirect_to board_path(@column.board), status: :see_other
  end

  def update
    card.update(card_params)
    redirect_to board_path(card.column.board), status: :see_other
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