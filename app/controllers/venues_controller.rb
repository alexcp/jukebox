class VenuesController < ApplicationController
  def show
    @venue = Venue.includes(concerts: :artists).find(params[:id])
    @concerts = @venue.concerts
    @past_concerts = @concerts.where("date < ?", Date.today)
    @concerts = @concerts.where("date >= ?", Date.today)
  end
end
