require 'test_helper'

class SolicitTest < ActiveSupport::TestCase
  def setup
    @solicit = Solicit.new(fecha: '20-03-2023', mensaje: 'Quiero clases de calculo')
  end

  test "No debería hacer una solicitud sin la fecha" do
    @solicit.fecha = nil
    assert @solicit.invalid?
  end
  test "No debería hacer una solicitud sin el mensaje" do
    @solicit.mensaje = nil
    assert @solicit.invalid?
  end

end

