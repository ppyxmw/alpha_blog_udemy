require 'test_helper'

class CreateArticlesTest < ActionDispatch::IntegrationTest
  
  def setup
  @user = User.create(username: "Mike", email: "mike@email.com", password: "password")
  end
  
  test "get new category form and create category" do
    sign_in_as(@user, "password")
    get new_article_path
    assert_template 'articles/new'
    assert_difference 'Article.count', 1 do
      post_via_redirect articles_path, article: {title: "Kicks From Hell", description: "This is a story about flighting."}
    end
    assert_template 'articles/show'
    assert_match "Kicks From Hell", response.body
  end
  
  test "invalid article submission results in failure" do
    sign_in_as(@user, "password")
    get new_article_path
    assert_template 'articles/new'
    assert_no_difference 'Article.count' do
      post articles_path, article: {title: " ", description: " "}
    end
    assert_template 'articles/new'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end
end