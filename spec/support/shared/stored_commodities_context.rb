shared_context "params for stored commodities" do
  let!(:commodity) { create(:commodity) }
  let!(:ship)      { create(:ship) }
  let!(:params) do
    {
      commodity_id: commodity.id,
      amount: '2',
      ship_id: ship.id,
      sell_price: '2000',
      sell_as: 'per_unit'
    }
  end
end

shared_context "three stored_commodities" do
  let!(:other_resource) { create(:extracted_resource, ship: ship) }
  let!(:extracted_resources) do
    create_list(:extracted_resource, 3,
      commodity: commodity,
      ship: ship
    )
  end
  let!(:updated_resource_ids) do
    [extracted_resources[0].id, extracted_resources[1].id]
  end
end

shared_examples "unupdated" do
  it "does not change the ship_id" do
    expect {
      updater.update
    }.to_not change{ ExtractedResource.find(id).ship_id }
  end

  it "does not change sell_price" do
    expect {
      updater.update
    }.to_not change{ ExtractedResource.find(id).sell_price }
  end
end

shared_examples "an update based on :sell_as" do
  it "updates the ship_id to nil" do
    expect {
      updater.update
    }.to change { ExtractedResource.find(id).ship_id }.from(ship.id).to(nil)
  end

  context "when per_unit?" do
    before { params[:sell_as] = 'per_unit' }

    it "updates the right resource" do
      expect {
        updater.update
      }.to change { ExtractedResource.find(id).sell_price }.from(nil).to(2000)
    end
  end

  context "when total?" do
    before { params[:sell_as] = 'total' }

    it "updates the right resource" do
      expect {
        updater.update
      }.to change { ExtractedResource.find(id).sell_price }.from(nil).to(1000)
    end
  end
end


