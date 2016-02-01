require 'rails_helper'

describe CargoItemsPresenter do
  let!(:ship)      { create(:ship) }
  let!(:painite)   { create(:commodity, name: "Painite", galactic_average: 33000) }
  let!(:palladium) { create(:commodity, name: "Palladium", galactic_average: 18000) }
  let!(:indium)    { create(:commodity, name: "Indium", galactic_average: 6000) }

  let!(:painite_items)   { create_list(:extracted_resource, 2, commodity: painite, ship: ship) }
  let!(:palladium_items) { create_list(:extracted_resource, 3, commodity: palladium, ship: ship) }
  let!(:indium_items)    { create_list(:extracted_resource, 5, commodity: indium, ship: ship) }

  subject(:presenter) { CargoItemsPresenter.new(ship) }

  describe "#new" do
    it "assigns @ship" do
      expect(presenter.instance_variable_get('@ship')).to eq(ship)
    end
  end

  describe "estimated_value" do
    let(:expected_value)      {  ( 33000 * 2) + (18000 * 3) + (6000 * 5) }
    subject(:estimated_value) { presenter.estimated_value }

    it "sums each commodity's galactic average" do
      expect(estimated_value).to eq(expected_value)
    end
  end

  describe "cargo_items" do
    subject(:items) { presenter.cargo_items }

    it { expect(items.to_a.size).to          eq(3)                                                                }
    it { expect(items.map(&:name)).to        match_array(['Painite', 'Palladium', 'Indium'])                      }
    it { expect(items.map(&:amount)).to      eq([2, 3, 5])                                                        }
    it { expect(items.map(&:id)).to          eq([painite_items[0].id, palladium_items[0].id, indium_items[0].id]) }
    it { expect(items.first.ship_id).to      eq(ship.id)                                                          }
    it { expect(items.first.commodity_id).to eq(painite.id)                                                       }
  end
end
