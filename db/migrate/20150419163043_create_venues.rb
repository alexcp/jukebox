class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name, null: false, unique: true

      t.timestamps null: false
    end
    add_index :venues, :name
  end
end
