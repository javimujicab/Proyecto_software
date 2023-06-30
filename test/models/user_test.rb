require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(email: 'prueba@uc.cl', name: 'Prueba')
  end

  test "No debería poder crear usuario sin el email" do
    @user.email = nil
    assert @user.invalid?
  end
  test "No debería poder crear usuario sin el nombre" do
    @user.name = nil
    assert @user.invalid?
  end
end
