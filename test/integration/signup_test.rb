require 'test_helper'

class SignupTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.new(username: "deepak", email: "deepakmahajan@gmail.com", password: "12345", admin: false)
  end

  test "check for signing up the user" do
    get signup_path
    assert_template 'users/new'
    post users_path, params: { user: {username: @user.username, email: @user.email, password: @user.password} }
    follow_redirect!
    assert_template 'users/show'
    assert_response :success
  end

end
