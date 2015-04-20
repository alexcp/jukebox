class ArtistsController < ApplicationController
  def show
    @artist = Artist.includes(:track, concerts: :venue).find(params[:id])
  end
end
