require 'rails_helper'

describe ExtractedResource do
  it { is_expected.to belong_to :commodity }
  it { is_expected.to belong_to :entry }
  it { is_expected.to validate_presence_of :commodity }
  it { is_expected.to validate_presence_of :entry }

  describe "quantity" do
    it "is 1 on new" do
      expect(ExtractedResource.new.quantity).to eq(1)
    end

    it "does not override existing resources' quantity" do
      resource = create(:extracted_resource, quantity: 3)
      expect(ExtractedResource.find(resource.id).quantity).to eq(3)
    end
  end

  describe "#commodity_name" do
    let!(:painite)  { create(:commodity, category: "minerals", name: "Painite") }
    let!(:resource) { create(:extracted_resource, commodity: painite) }

    it { expect(resource.commodity_name).to eq("Painite") }
  end
end
