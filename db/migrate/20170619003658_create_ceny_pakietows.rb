class CreateCenyPakietows < ActiveRecord::Migration[5.1]
  def up
    create_table :ceny_pakietows do |t|
      t.integer "biegi_id"
      t.date "data"
      t.float "cena"
      t.string "waluta", :limit=>4
      t.timestamps
    end
    add_index("ceny_pakietows", "biegi_id")
  end
  def down
  	drop_table :ceny_pakietows  	
  end
end
