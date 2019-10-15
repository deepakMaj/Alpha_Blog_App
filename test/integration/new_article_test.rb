require 'test_helper'

class NewArticleTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(username: "john", email: "john123@gmail.com", password: "1234", admin: true)
    @article = Article.new(title: "rails", description: "It is amazing")
  end

  test "creating new article" do
    sign_in_as(@user, "1234")
    get new_article_path
    assert_template 'articles/new'
    post articles_path, params: { article: {title: @article.title, description: @article.description} }
    follow_redirect!
    assert_template 'articles/show'
    assert_response :success
  end

end
