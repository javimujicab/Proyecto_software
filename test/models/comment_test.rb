require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @comment = Comment.new(content: 'Me gustó mucho la clase')
  end

  test "No debería publicar un comentario vacío" do
    @comment.content = nil
    assert @comment.invalid?
  end
end
