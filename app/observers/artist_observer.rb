class ArtistObserver < ActiveRecord::Observer
  def after_save(record)
    QC.enqueue("Track.new_track_for_artist", record.id)
  end
end
