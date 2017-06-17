class CreateOplataStartowas < ActiveRecord::Migration[5.1]
  def up
    create_table :oplata_startowas do |t|
      t.integer "biegi_id"
      t.datetime "data"
      t.string "nazwa"
      t.integer "cena"
      t.string "waluta", :default=>"PLN"
      t.timestamps
    end
  end

  def down
  	drop_table :oplata_startowas 
  end
end
