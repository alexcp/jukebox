class HomeController < ApplicationController
  def index
    @q = Concert.ransack(params[:q])
    @concerts = @q.result.includes(:artists, :venue).where("date >= ?", Date.today).order(date: :asc).group_by{|x| x.date.strftime("%B")}
  end
end
