class AddNameToArts < ActiveRecord::Migration[6.1]
  def change
    add_column :arts, :name, :string
  end
end
