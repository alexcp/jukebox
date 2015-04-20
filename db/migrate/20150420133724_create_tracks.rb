class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :artist_id, index: true, foreign_key: true
      t.string :url, null: false
      t.text :embed_code

      t.timestamps null: false
    end
  end
end
