require 'rails_helper'

describe StoredCommoditiesController do
  let!(:cmdr) { create(:cmdr) }
  let!(:ship) { create(:ship, cmdr: cmdr) }

  before do
    @request.session['current_cmdr_id'] = cmdr.id
  end

  describe "PUT#update" do
    context "updates a extracted_resource with valid params" do
      let!(:resource)     { create(:extracted_resource) }
      let(:valid_params)  { { id: resource.id, sell_price: 1200 } }

      it "returns http success" do
        put :update, valid_params
        expect(response).to redirect_to(cmdr_ship_path(cmdr, ship))
      end
    end
  end
end
