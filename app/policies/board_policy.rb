# app/policies/board_policy.rb
class BoardPolicy
  def initialize(user:, board:)
    @user  = user
    @board = board
  end

  def view?        = member?
  def create_card? = member?
  def edit_card?   = member?
  def delete_card? = member?
  def move_card?   = member?

  def edit_board?      = admin?
  def delete_board?    = admin?
  def manage_columns?  = admin?
  def manage_members?  = admin?

  private

  def membership
    @membership ||= @board.memberships.find_by(user: @user)
  end

  def member? = membership.present?
  def admin?  = membership&.admin?
end