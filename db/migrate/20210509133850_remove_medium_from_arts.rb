class RemoveMediumFromArts < ActiveRecord::Migration[6.1]
  def change
    remove_column :arts, :medium, :string
  end
end
