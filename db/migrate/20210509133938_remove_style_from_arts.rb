class RemoveStyleFromArts < ActiveRecord::Migration[6.1]
  def change
    remove_column :arts, :style, :string
  end
end
