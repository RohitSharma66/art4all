class AddCoordinatesToArts < ActiveRecord::Migration[6.1]
  def change
    add_column :arts, :latitude, :float
    add_column :arts, :longitude, :float
  end
end
