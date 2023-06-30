require 'test_helper'

class PostTest < ActiveSupport::TestCase

  def setup
    @post = Post.new(titulo: 'Clases Calculo', 
                     sigla_ramo: 'MAT1630', precio: 1000, descripcion: 'muy buenas clases')
  end

  test "No debería publicar un post sin título" do
    @post.titulo = nil
    assert @post.invalid?
  end
  test "No debería publicar un post sin sigla de ramo" do
    @post.sigla_ramo = nil
    assert @post.invalid?
  end
  test "No debería publicar un post sin precio" do
    @post.precio = nil
    assert @post.invalid?
  end
  test "No debería publicar un post sin descripcion" do
    @post.descripcion = nil
    assert @post.invalid?
  end
end




