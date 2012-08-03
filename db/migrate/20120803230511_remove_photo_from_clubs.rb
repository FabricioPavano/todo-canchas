class RemovePhotoFromClubs < ActiveRecord::Migration
  def up
    remove_column :clubs, :photo
  end

  def down
    add_column :clubs, :photo, :string
  end
end
