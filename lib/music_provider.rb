class MusicProvider
  include Singleton

  def self.track_for_artist artist_name
    if track = instance.tracks_from_artist(artist_name).first
      if code = instance.embed_code(track)
        {url: track, embed_code: code}
      end
    end
  end

  def tracks_from_artist artist_name
    client.get('/tracks', q: artist_name).select{|x| x["title"].downcase.include? artist_name }.map{|x| x["permalink_url"]}
  end

  def embed_code track_url
    client.get('/oembed', url: track_url)["html"]
  end

  private

  def client
    @client ||= Soundcloud.new(client_id: 'af5c93f7d9225e62d65bc3f15cdc380b')
  end
end
