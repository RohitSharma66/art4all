class AddArtistToArts < ActiveRecord::Migration[6.1]
  def change
    add_column :arts, :artist, :string
  end
end
