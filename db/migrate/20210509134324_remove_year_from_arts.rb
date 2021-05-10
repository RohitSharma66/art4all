class RemoveYearFromArts < ActiveRecord::Migration[6.1]
  def change
    remove_column :arts, :year, :string
  end
end
