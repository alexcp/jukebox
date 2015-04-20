class MusicProvider
  include Singleton

  def client
    @client ||= Soundcloud.new(client_id: 'af5c93f7d9225e62d65bc3f15cdc380b')
  end

  def get_tracks_from_artist artist_name
    client.get('/tracks', q: artist_name).map{|x| x["permalink_url"]}
  end
end
