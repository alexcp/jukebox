class MusicProvider
  include Singleton

  def self.track_for_artist artist
    if track = instance.track_from_artist(artist)
      if embed_code = instance.embed_code(track)
        track.embed_code = embed_code
        track
      end
    end
  end

  def track_from_artist artist
    track_info = client.get('/tracks', q: artist.name).select{|x| x["title"].downcase.match(/^#{artist.name} -/i) && x["embeddable_by"] == "all"}.first
    if track_info
      Track.new(url: track_info["permalink_url"], artist: artist, artwork_url: track_info["artwork_url"])
    end
  end

  def embed_code track
    client.get('/oembed', url: track[:url])["html"]
  end

  private

  def client
    @client ||= Soundcloud.new(client_id: ENV["SOUNDCLOUD_CLIENT_ID"])
  end
end
