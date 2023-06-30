require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test 'get to index' do 
    get posts_index_url
  assert_response :success
  end
  test "should get new" do
    get new_post_url
    assert_response :success
  end
  test "should get create" do
    get posts_create_url
    assert_response :success
  end
end
