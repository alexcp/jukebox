class HomeController < ApplicationController
  def index
    @q = Concert.ransack(params[:q])
    @concerts = @q.result.includes(:artists, :venue).all.order(date: :asc).group_by{|x| x.date.strftime("%B")}
  end
end
