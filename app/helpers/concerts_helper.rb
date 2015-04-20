module ConcertsHelper
  def display_price price
    number_to_currency price.to_f / 100
  end
end
