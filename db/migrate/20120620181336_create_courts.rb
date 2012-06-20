class CreateCourts < ActiveRecord::Migration
  def change
    create_table :courts do |t|
      t.references :sport
      t.references :club

      t.timestamps
    end
    add_index :courts, :sport_id
    add_index :courts, :club_id
  end
end
