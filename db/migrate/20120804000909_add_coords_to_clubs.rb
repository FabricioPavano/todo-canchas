class AddCoordsToClubs < ActiveRecord::Migration
  def change
    add_column :clubs, :coords, :string
  end
end
