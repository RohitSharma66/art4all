class RemovePriceFromArts < ActiveRecord::Migration[6.1]
  def change
    remove_column :arts, :Price, :string
  end
end
