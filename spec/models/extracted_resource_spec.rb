require 'rails_helper'

describe ExtractedResource do
  it { is_expected.to belong_to :mining_entry }
  it { is_expected.to belong_to :commodity }
  it { is_expected.to validate_presence_of :mining_entry }
  it { is_expected.to validate_presence_of :commodity }

  it "validates the commodity is a mineral or metal" do
    resource = build(:extracted_resource)
    resource.commodity = build(:commodity, category: "chemicals")
    expect(resource).to_not be_valid
    expect(resource.errors[:commodity]).to include("can only extract minerals and metals")
  end

  describe "#commodity_category" do
    let(:commodity) { build(:commodity, category: "minerals") }
    let(:resource)  { build(:extracted_resource, commodity: commodity) }

    it { expect(resource.commodity_category).to eq("minerals") }
  end
end
