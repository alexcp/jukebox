class ConcertParser
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
    @concert_info = concert_info
  end

  def additionnal_info
    return additionnal_info_column unless additionnal_info_column.blank?
    if special_characters = artists_column_special_characters
      special_characters.to_s.gsub("*","")
    end
  end

  def artists
    string = artists_column
    if artists_column_special_characters
      string = string.gsub(/\*(.+)\*/,"")
    end
    string.downcase.split(/\+|\,/).map(&:strip)
  end

  def date
    Date.parse(date_column)
  end

  def time
    time_column
  end

  def venue
    venue_column.downcase
  end

  def price
    price_column.gsub("$","").gsub(".","").to_i
  end

  def save
    artist_names = artists.map{|name| Artist.find_or_create_by(name: name)}
    venue_name = Venue.find_or_create_by(name: venue)
    Concert.create(date: date, time: time, price: price, artists: artist_names, venue: venue_name, additionnal_info: additionnal_info)
  end

  private

  def artists_column_special_characters
    artists_column.match(/\*(.+)\*/)
  end

  def additionnal_info_column
    @concert_info[0]
  end

  def artists_column
    @concert_info[1]
  end

  def date_column
    @concert_info[2]
  end

  def time_column
    @concert_info[3]
  end

  def venue_column
    @concert_info[4]
  end

  def price_column
    @concert_info[5]
  end
end
