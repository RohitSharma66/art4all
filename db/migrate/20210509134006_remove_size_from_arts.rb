class RemoveSizeFromArts < ActiveRecord::Migration[6.1]
  def change
    remove_column :arts, :size, :string
  end
end
