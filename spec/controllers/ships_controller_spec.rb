require 'rails_helper'

describe ShipsController do
  let!(:cmdr) { create(:cmdr) }

  before do
    @request.session['current_cmdr_id'] = cmdr.id
  end

  describe "GET #show" do
    let!(:ship) { create(:ship, cmdr: cmdr) }
    it "returns http success" do
      get :show, id: ship.id, cmdr_id: cmdr.id
      expect(response).to have_http_status(:success)
    end

    it "assigns the ship" do
      get :show, id: ship.id, cmdr_id: cmdr.id
      expect(assigns(:ship)).to eq(ship)
    end

    it "assigns @cargo_items" do
      get :show, id: ship.id, cmdr_id: cmdr.id
      expect(assigns(:cargo_items)).to be_an_instance_of CargoItemsPresenter
    end
  end
end
