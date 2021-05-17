class AddRateToArts < ActiveRecord::Migration[6.1]
  def change
    add_column :arts, :rate, :integer
  end
end
