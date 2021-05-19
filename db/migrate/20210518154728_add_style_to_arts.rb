class AddStyleToArts < ActiveRecord::Migration[6.1]
  def change
    add_column :arts, :style, :string
  end
end
