require 'rails_helper'

describe StoredCommoditiesUpdater do
  # it accepts params in the following format:
  # { commodity_id: 1, amount: 2, sell_price: 2000, sell_as: 'per_unit/total' }
  # it fetches the cargo_items with the matching commodity_id (taking the given amount)
  # it calculates the sell_price for each of the cargo_items
  # it updates the stored_commodities:
  # stored_commodities.update_all(sell_price: sell_price, ship_id: nil)
  let!(:commodity) { create(:commodity) }
  let!(:ship)      { create(:ship) }

  shared_context "valid params" do
    let(:params) do
      {
        commodity_id: commodity.id,
        amount: '2',
        ship_id: ship.id,
        sell_price: '2000',
        sell_as: 'per_unit'
      }
    end
  end

  shared_context "invalid params" do
    let(:params) do
      {
        commodity_id: commodity.id,
        amount: '4',
        admin: 'true',
        bogus: 'foo',
        ship_id: ship.id,
        sell_price: '21000',
        sell_as: 'admin'
      }
    end
  end

  shared_context "with 3 extracted_resources" do
    let!(:resources) do
      create_list(:extracted_resource, 3,
        commodity: commodity,
        ship: ship
      )
    end
  end

  subject(:updater) { StoredCommoditiesUpdater.new(params) }

  describe "#new" do
    context "given valid params" do
      include_context "valid params"

      it "assigns @params as a struct" do
        updater_params = updater.instance_variable_get('@params')
        expect(updater_params).to be_a_kind_of Struct
        expect(updater_params).to be_an_instance_of StoredCommoditiesUpdater::Params
      end

      it "sets the values of acceptable params" do
        updater_params = updater.instance_variable_get('@params')
        expect(updater_params.amount).to eq(2)
        expect(updater_params.commodity_id).to eq(commodity.id)
        expect(updater_params.sell_price).to eq(2000)
        expect(updater_params.sell_as).to eq(:per_unit)
        expect(updater_params.ship_id).to eq(ship.id)
      end

      it "assigns @errors as StoredCommoditiesUpdater::Errors" do
        expect(updater.instance_variable_get('@errors')).to be_an_instance_of StoredCommoditiesUpdater::Errors
      end
    end

    context "given invalid params" do
      include_context "invalid params"

      it "assigns @params as a struct" do
        updater_params = updater.instance_variable_get('@params')
        expect(updater_params).to be_a_kind_of Struct
        expect(updater_params).to be_an_instance_of StoredCommoditiesUpdater::Params
      end

      it "sets the values of acceptable params" do
        updater_params = updater.instance_variable_get('@params')
        expect(updater_params.amount).to eq(4)
        expect(updater_params.commodity_id).to eq(commodity.id)
        expect(updater_params.sell_price).to eq(21000)
        expect(updater_params.sell_as).to be_nil
      end
    end
  end

  describe "#update" do
    include_context "with 3 extracted_resources"

    context "with 2 extracted resources" do
      include_context "valid params"

      it "sets the ship_id to nil" do
        expect {
          updater.update
        }.to change{
          StoredCommodity.find(resources[1].id).ship_id
        }.from(ship.id).to(nil)
      end

      context "when sell_as is 'per_unit'" do
        it "sets the sell_price for each to the given @sell_price" do
          expect {
            updater.update
          }.to change{
            StoredCommodity.find(resources[0].id).sell_price
          }.from(nil).to(2000)
        end
      end

      context "when sell_as is 'total'" do
        before { params[:sell_as] = 'total' }
        it "sets the sell_price to the given @sell_price / @quantity" do
          expect {
            updater.update
          }.to change{
            StoredCommodity.find(resources[0].id).sell_price
          }.from(nil).to(1000)
        end
      end
    end
  end

  describe "#valid?" do
    context "validates params" do
      include_context "valid params"

      [:ship_id, :commodity_id, :amount, :sell_price, :sell_as].each do |req_param|
        context "validates presence of #{req_param}" do
          before { params[req_param] = "" ; updater.valid? }

          it { expect(updater).to_not be_valid }
          it { expect(updater.errors[req_param]).to include("cannot be blank") }
        end
      end
    end

    context "validates amount" do
      include_context "valid params"
      include_context "with 3 extracted_resources"

      context "when amount is < 0" do
        before { params[:amount] = "-2" ; updater.valid? }

        it { expect(updater).to_not be_valid }
        it { expect(updater.errors[:amount]).to include("must be between 0 and 3") }
      end

      context "when amount is > 3" do
        before { params[:amount] = "4" ; updater.valid? }

        it { expect(updater).to_not be_valid }
        it { expect(updater.errors[:amount]).to include("must be between 0 and 3") }
      end
    end
  end

  describe "#total_profit" do
    context "when not valid?" do
      include_context "invalid params"

      it { expect(updater.total_profit).to eq(0) }
    end

    context "when sell_as is 'total'" do
      include_context "valid params"
      include_context "with 3 extracted_resources"

      before { params[:sell_as] = 'total' }

      it "is the @sell_price" do
        expect(updater.total_profit).to eq(2000)
      end
    end

    context "when sell_as is 'per_unit'" do
      include_context "valid params"
      include_context "with 3 extracted_resources"

      it "is the @sell_price * @quantity" do
        expect(updater.total_profit).to eq(4000)
      end
    end
  end
end
