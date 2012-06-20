class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.string :name
      t.references :department
      t.string :address
      t.string :phone_number

      t.timestamps
    end
    add_index :clubs, :department_id
  end
end
