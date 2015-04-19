class CreateArtistsConcerts < ActiveRecord::Migration
  def change
    create_table :artists_concerts do |t|
      t.integer :artist_id, null: false
      t.integer :concert_id, null: false

      t.timestamps null: false
    end
    add_index :artists_concerts, :artist_id
    add_index :artists_concerts, :concert_id
  end
end
