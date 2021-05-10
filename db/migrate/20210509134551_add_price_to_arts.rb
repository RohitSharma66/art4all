class AddPriceToArts < ActiveRecord::Migration[6.1]
  def change
    add_column :arts, :price, :string
  end
end
