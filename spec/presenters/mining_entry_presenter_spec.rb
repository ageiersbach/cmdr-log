require 'rails_helper'

describe MiningEntryPresenter do
  let!(:entry)     { create(:entry, system_object: create(:system_object, name: "Guathiti 6")) }
  let!(:painite)   { create(:commodity, name: "Painite", galactic_average: 33000) }
  let!(:palladium) { create(:commodity, name: "Palladium", galactic_average: 18000) }
  let!(:indium)    { create(:commodity, name: "Indium", galactic_average: 6000) }

  before do
    create_list(:extracted_resource, 2, commodity: painite, entry: entry)
    create_list(:extracted_resource, 3, commodity: palladium, entry: entry)
    create_list(:extracted_resource, 5, commodity: indium, entry: entry)
  end

  subject(:presenter) { MiningEntryPresenter.new(entry) }

  describe "#descriptive_heading" do
    subject(:heading) { presenter.descriptive_heading }

    context "when the mining entry is closed" do
      before { entry.is_closed = true }
      it { expect(heading).to eq("Mined @ Guathiti 6") }
    end

    context "when the mining entry is open" do
      it { expect(heading).to eq("Mining @ Guathiti 6") }
    end
  end

  describe "#extracted_resources" do
    subject(:extracted_resources) { presenter.extracted_resources }

    it "groups the extracted resources by commodity" do
      expect(extracted_resources.to_a.size).to eq(3) #to_a or it doesn't load here :P
      expect(extracted_resources.map(&:name)).to match_array(['Painite', 'Palladium', 'Indium'])
      expect(extracted_resources.map(&:amount_extracted)).to match_array([2, 3, 5])
    end
  end

  describe "#estimated_value" do
    # from above factoried commodities
    # painite g.a. 33,000 x 2
    # palladium g.a. 18000 x 3
    # indium g.a. 6000 x 5
    let(:expected_value)      {  ( 33000 * 2) + (18000 * 3) + (6000 * 5) }
    subject(:estimated_value) { presenter.estimated_value }

    it "sums each commodity's galactic average" do
      expect(estimated_value).to eq(expected_value)
    end
  end
end
