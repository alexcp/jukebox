require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "should only display upcoming concerts" do
      allow(Date).to receive(:today).and_return(Date.parse("2015-04-20"))
      get :index
      expect(assigns(:concerts)["April"]).to have_at_most(2).concerts
    end
  end

end
