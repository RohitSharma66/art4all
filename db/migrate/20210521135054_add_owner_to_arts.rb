class AddOwnerToArts < ActiveRecord::Migration[6.1]
  def change
    add_column :arts, :owner, :string
  end
end
