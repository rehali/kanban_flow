# test/policies/board_policy_test.rb
require "test_helper"

class BoardPolicyTest < ActiveSupport::TestCase
  def setup
    @board = boards(:one)
    @admin  = users(:one)   # Alice — admin
    @member = users(:two)   # Bob — member
    @guest  = User.new      # not a member
  end

  test "admin can view" do
    assert BoardPolicy.new(user: @admin, board: @board).view?
  end

  test "member can view" do
    assert BoardPolicy.new(user: @member, board: @board).view?
  end

  test "guest cannot view" do
    refute BoardPolicy.new(user: @guest, board: @board).view?
  end

  test "admin can manage columns" do
    assert BoardPolicy.new(user: @admin, board: @board).manage_columns?
  end

  test "member cannot manage columns" do
    refute BoardPolicy.new(user: @member, board: @board).manage_columns?
  end
end