class CreateSolicits < ActiveRecord::Migration[7.0]
  def change
    create_table :solicits do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.boolean :aceptado
      t.date :fecha
      t.text :mensaje

      t.timestamps
    end
  end
end
