class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      t.integer :artist_id, null: false
      t.date :date, null: false
      t.time :time, null: false
      t.integer :price
      t.integer :venue_id, null: false

      t.timestamps null: false
    end
    add_index :concerts, :artist_id
    add_index :concerts, :venue_id
    add_index :concerts, :date
  end
end
