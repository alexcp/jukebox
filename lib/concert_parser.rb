class ConcertParser
  attr_reader :artists, :date, :time, :venue, :price

  def self.parse data
    @concert_info = data.map do |concert_info|
      new(concert_info)
    end
  end

  def self.save_all data
    ActiveRecord::Base.transaction do
      parse(data).each(&:save)
    end
  end

  def initialize concert_info
    @artists = parse_artist_name concert_info[1]
    @date   = parse_date concert_info[2]
    @time   = parse_time concert_info[3]
    @venue  = parse_venue_name concert_info[4]
    @price  = parse_price concert_info[5]
  end

  def save
    artists = @artists.map{|name| Artist.find_or_create_by(name: name)}
    venue = Venue.find_or_create_by(name: @venue)
    Concert.new(date: @date, time: @time, price: @price, artists: artists, venue: venue).save
  end

  private

  def parse_artist_name string
    string.downcase.split(/\+|\,/).map(&:strip)
  end

  def parse_date string
    Date.parse(string)
  end

  def parse_time string
    string
  end

  def parse_venue_name string
    string.downcase
  end

  def parse_price string
    string.gsub("$","").gsub(".","").to_i
  end
end
