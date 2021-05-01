class CreateArts < ActiveRecord::Migration[6.1]
  def change
    create_table :arts do |t|
      t.string :type
      t.string :medium
      t.string :style
      t.integer :year
      t.float :size
      t.string :ready_to_hang
      t.string :frame
      t.string :materials
      t.string :shipping
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
