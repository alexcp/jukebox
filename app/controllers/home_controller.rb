class HomeController < ApplicationController
  def index
    @concerts = Concert.includes(:artists, :venue).all.order(date: :asc).group_by{|x| x.date.strftime("%B")}
  end
end
