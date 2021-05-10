class RemoveTypeFromArts < ActiveRecord::Migration[6.1]
  def change
    remove_column :arts, :type, :string
  end
end
