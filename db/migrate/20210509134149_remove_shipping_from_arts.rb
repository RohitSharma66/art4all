class RemoveShippingFromArts < ActiveRecord::Migration[6.1]
  def change
    remove_column :arts, :shipping, :string
  end
end
