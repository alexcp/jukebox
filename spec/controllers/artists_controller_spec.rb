require 'rails_helper'

RSpec.describe ArtistsController, type: :controller do

  describe "GET #show" do
    it "returns http success" do
      get :show, id: 1
      expect(assigns(:artist)).to eq( artists(:mfdoom) )
    end
  end

end
