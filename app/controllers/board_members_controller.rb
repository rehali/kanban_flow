# app/controllers/board_members_controller.rb
class BoardMembersController < ApplicationController
  before_action :set_board
  before_action :authorize_manage_members!

  def index
    render Views::BoardMembers::Index.new(
      board:       @board,
      memberships: @board.memberships.includes(:user).order(:created_at),
      policy:      policy_for(@board)
    )
  end

  def create
    email = params[:email].to_s.strip.downcase
    user  = User.find_by(email: email)

    if user.nil?
      redirect_to board_members_path(@board),
                  alert: "No user found with that email address."
    elsif @board.memberships.exists?(user: user)
      redirect_to board_members_path(@board),
                  alert: "#{user.name} is already a member."
    else
      @board.memberships.create!(user: user, role: :member)
      redirect_to board_members_path(@board),
                  notice: "#{user.name} added as a member."
    end
  end

  def destroy
    membership = @board.memberships.find(params[:id])

    if membership.admin?
      redirect_to board_members_path(@board),
                  alert: "Cannot remove the board owner."
    else
      membership.destroy
      redirect_to board_members_path(@board),
                  notice: "Member removed."
    end
  end

  private

  def set_board
    @board = Board.find(params[:board_id])
  end

  def authorize_manage_members!
    authorize! :manage_members?, @board
  end
end