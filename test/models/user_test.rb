# test/models/user_test.rb
require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "authenticate_by returns user with correct password" do
    user = User.create!(name: "Cindy", email: "cindy@example.com",
                        password: "password")
    assert_equal user,
                 User.authenticate_by(email_address: "cindy@example.com",
                                      password: "password")
  end

  test "authenticate_by returns nil with wrong password" do
    User.create!(name: "Cindy", email: "cindy@example.com",
                 password: "password")
    assert_nil User.authenticate_by(email_address: "cindy@example.com",
                                    password: "wrong")
  end

  test "email must be unique" do
    User.create!(name: "Cindy", email: "cindy@example.com",
                 password: "password")
    user = User.new(name: "Cindy Again", email: "cindy@example.com",
                    password: "password")
    assert_not user.valid?
  end

  test "generates password reset token" do
    user  = User.create!(name: "Cindy", email: "cindy@example.com",
                         password: "password")
    token = user.generate_token_for(:password_reset)
    assert_not_nil token
    assert_equal user, User.find_by_token_for(:password_reset, token)
  end
end