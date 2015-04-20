require 'rails_helper'

RSpec.describe VenuesController, type: :controller do

  describe "GET #show" do
    it "returns http success" do
      get :show, id: 1
      expect(assigns(:venue)).to eq(venues(:metropolis))
    end
  end

end
