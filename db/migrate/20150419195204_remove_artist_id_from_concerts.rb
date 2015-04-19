class RemoveArtistIdFromConcerts < ActiveRecord::Migration
  def change
    remove_column :concerts, :artist_id
  end
end
