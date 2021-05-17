class RemoveRateFromArts < ActiveRecord::Migration[6.1]
  def change
    remove_column :arts, :rate, :boolean
  end
end
