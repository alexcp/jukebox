module ConcertsHelper
  def display_price price
    number_to_currency price.to_f / 100
  end

  def display_concert_image concert
    artwork_url = concert.artists.select{|x| x.artwork_url}.first.try(:artwork_url) || "noimage.png"
    image_tag(artwork_url).html_safe
  end

  def cache_key_for_concert concert
    concert.id
    track_ids = concert.artists.map{ |x| x.track.try(:id) }
    "concerts/#{concert.id}-#{track_ids}"
  end

  def cache_key_for_concerts
    count          = Concert.count
    track_count    = Track.count
    max_updated_at = Concert.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "concerts/all-#{count}-#{max_updated_at}-#{track_count}"
  end
end
