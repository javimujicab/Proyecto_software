class ChangeAceptadoTypeInSolicits < ActiveRecord::Migration[7.0]
  def change
    change_column :solicits, :aceptado, :string
  end
end
