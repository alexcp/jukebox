class ConcertParser
  attr_reader :artist, :date, :time, :venue, :price

  def self.parse data
    @concert_info = data.map do |concert_info|
      new(concert_info)
    end
  end

  def initialize concert_info
    @artist = parse_artist_name concert_info[1]
    @date   = parse_date concert_info[2]
    @time   = parse_time concert_info[3]
    @venue  = parse_venue_name concert_info[4]
    @price  = parse_price concert_info[5]
  end

  private

  def parse_artist_name string
    string.downcase
  end

  def parse_date string
    Date.parse(string)
  end

  def parse_time string
    Time.parse(string)
  end

  def parse_venue_name string
    string.downcase
  end

  def parse_price string
    string.gsub("$","").gsub(".","").to_i
  end
end
