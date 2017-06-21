class CreateBiegis < ActiveRecord::Migration[5.1]
  def up
    create_table :biegis do |t|
      t.date "data"
      t.string "nazwa"
      t.string "miejscowosc"
      t.float "dystans"
      t.string "jednostkaMiary", :limit=>2
      t.timestamps
    end
  end

  def down
  	drop_table :biegis  	
  end
end
