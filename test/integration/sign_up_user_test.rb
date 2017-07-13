require 'test_helper'

class SignUpUserTest < ActionDispatch::IntegrationTest
  
  test "get new user form and create a user" do
    get signup_path
    assert_template 'users/new'
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: {username: "MikeyBoi", email: "email@email.com", password: "password"}
    end
    assert_template 'users/show'
    assert_match "MikeyBoi's", response.body
  end
  
  test "invalid user submission results in failure" do
    get signup_path
    assert_template 'users/new'
    assert_no_difference 'User.count'do
      post users_path, user: {username: "", email: "email@email.com", password: "password"}
    end
    assert_template 'users/new'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end

end