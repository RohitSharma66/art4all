class RemoveReadyToHangFromArts < ActiveRecord::Migration[6.1]
  def change
    remove_column :arts, :ready_to_hang, :string
  end
end
