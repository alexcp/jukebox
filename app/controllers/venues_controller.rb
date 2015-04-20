class VenuesController < ApplicationController
  def show
    @venue = Venue.includes(concerts: :artists).find(params[:id])
  end
end
