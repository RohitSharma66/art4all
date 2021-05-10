class RemoveFrameFromArts < ActiveRecord::Migration[6.1]
  def change
    remove_column :arts, :frame, :string
  end
end
