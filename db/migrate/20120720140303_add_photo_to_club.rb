class AddPhotoToClub < ActiveRecord::Migration
  def change
    add_column :clubs, :photo, :string
  end
end
