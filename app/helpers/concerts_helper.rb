module ConcertsHelper
  def display_price price
    number_to_currency price.to_f / 100
  end

  def display_concert_image concert
    artwork_url = concert.artists.select{|x| x.artwork_url}.first.try(:artwork_url)
    image_tag(artwork_url).html_safe
  end
end
