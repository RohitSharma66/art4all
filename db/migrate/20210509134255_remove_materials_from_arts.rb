class RemoveMaterialsFromArts < ActiveRecord::Migration[6.1]
  def change
    remove_column :arts, :materials, :string
  end
end
