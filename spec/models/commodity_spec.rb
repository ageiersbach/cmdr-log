require 'rails_helper'

describe Commodity do
  it { is_expected.to validate_presence_of(:name) }

  describe "scopes" do
    let!(:mineral) { create(:commodity, name: "Painite", category: "minerals")        }
    let!(:metal)   { create(:commodity, name: "Platinum", category: "metals")         }
    let!(:weapon)  { create(:commodity, name: "Reactive Armor", category: "weapons") }

    describe ".mineable" do
      it "gets minerals and metals" do
        expect(Commodity.mineable).to contain_exactly(mineral, metal)
      end

      it "ignores the rest" do
        expect(Commodity.mineable).to_not include(weapon)
      end
    end
  end
end
