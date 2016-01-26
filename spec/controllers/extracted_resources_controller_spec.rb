require 'rails_helper'

describe ExtractedResourcesController do
  let!(:cmdr) { create(:cmdr) }
  let!(:ship) { create(:ship, cmdr: cmdr) }

  before do
    @request.session['current_cmdr_id'] = cmdr.id
  end

  describe "POST #create" do
  let!(:entry)     { create(:entry) }
  let!(:commodity) { create(:commodity, category: "minerals") }
    context "with valid params" do
      let(:valid_params) do
        { extracted_resource: { entry_id: entry.id, commodity_id: commodity.id } }
      end

      context "when no extracted_resource exists for the commodity-entry pair" do
        it "creates a new extracted resource" do
          expect {
            post :create, valid_params
          }.to change{ ExtractedResource.count}.from(0).to(1)
        end
      end
    end
  end

  describe "GET #destroy" do
  end

end
