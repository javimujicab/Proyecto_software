class AddCategoriaToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :categoria, :string
  end
end
