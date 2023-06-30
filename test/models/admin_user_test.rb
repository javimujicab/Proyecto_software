require "test_helper"

class AdminUserTest < ActiveSupport::TestCase
  def setup
    @user_admin = AdminUser.new(email: 'prueba@uc.cl')
end

  test "No debería poder crear usuario sin el email" do
    @user_admin.email = nil
    assert @user_admin.invalid?
  end

end
