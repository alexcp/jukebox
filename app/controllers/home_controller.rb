class HomeController < ApplicationController
  def index
    @q = Concert.ransack
    @concerts = Concert.includes(:venue, artists: :track).where("date >= ?", Date.today).order(date: :asc).group_by{|x| x.date.strftime("%B")}
  end

  def search
    @q = Concert.ransack(params[:q])
    @concerts = @q.result.includes(:venue, artists: :track).where("date >= ?", Date.today).order(date: :asc).group_by{|x| x.date.strftime("%B")}
  end
end
