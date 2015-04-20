module ArtistsHelper
  def display_artists_link artists
    artists.map do |artist|
      link_to artist.name.titleize, artist
    end.join(", ").html_safe
  end

  def display_embed_code artist
    artist.track.embed_code.html_safe if artist.track
  end
end
