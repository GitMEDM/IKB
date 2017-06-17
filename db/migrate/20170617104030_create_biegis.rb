class CreateBiegis < ActiveRecord::Migration[5.1]
  def up
    create_table :biegis do |t|
      t.datetime "data"
      t.string "nazwa"
      t.string "miejscowosc"
      t.integer "dystans"
      t.timestamps
    end
  end

  def down
  	drop_table :biegis  	
  end
end
