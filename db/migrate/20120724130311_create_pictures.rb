class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :picture
      t.references :club

      t.timestamps
    end
    add_index :pictures, :club_id
  end
end
