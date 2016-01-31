require 'rails_helper'

describe StoringCommodities::Fields do
  subject(:fields) { StoringCommodities::Fields.new(params) }
  shared_context "valid params" do
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

  shared_context "invalid params" do
    let!(:params) do
      {
        commodity_id: '',
        amount: '-1',
        ship_id: '',
        sell_price: '-500',
        sell_as: 'bogus'
      }
    end
  end


  describe "#new" do
    include_context "valid params"

    it { expect(fields.instance_variable_get('@params')).to eq(params) }
  end

  describe "fields" do
    context "with valid params" do
      include_context "valid params"

      it { expect(fields.commodity_id).to eq(commodity.id) }
      it { expect(fields.ship_id).to eq(ship.id) }
      it { expect(fields.amount).to eq(2) }
      it { expect(fields.sell_price).to eq(2000) }
      it { expect(fields.sell_as).to eq(:per_unit) }
    end

    context "with invalid params" do
      include_context "invalid params"

      it { expect(fields.commodity_id).to be_nil }
      it { expect(fields.ship_id).to be_nil }
      it { expect(fields.amount).to eq(-1) }
      it { expect(fields.sell_price).to eq(-500) }
      it { expect(fields.sell_as).to be_nil }
    end
  end

  describe "#errors" do
    context "when valid?" do
      include_context "valid params"
      it { expect(fields).to be_valid }
      it { expect(fields.errors[:amount]).to be_empty }
      it { expect(fields.errors[:commodity_id]).to be_empty }
      it { expect(fields.errors[:sell_as]).to be_empty }
      it { expect(fields.errors[:sell_price]).to be_empty }
      it { expect(fields.errors[:ship_id]).to be_empty }
    end

    context "before calling valid?" do
      include_context "valid params"

      it { expect(fields.errors[:commodity_id]).to eq([]) }
      it { expect(fields.errors[:ship_id]).to eq([]) }
      it { expect(fields.errors[:amount]).to eq([]) }
      it { expect(fields.errors[:sell_price]).to eq([]) }
      it { expect(fields.errors[:sell_as]).to eq([]) }
    end
  end

  context "after valid? called" do
    include_context "valid params"

    context "when commodity_id is nil" do
      before do
        params[:commodity_id] = ''
        fields.valid?
      end

      it { expect(fields).to_not be_valid }
      it { expect(fields.errors[:commodity_id]).to include('cannot be blank') }
    end

    context "when ship_id is nil" do
      before do
        params[:ship_id] = ''
        fields.valid?
      end

      it { expect(fields).to_not be_valid }
      it { expect(fields.errors[:ship_id]).to include('cannot be blank') }
    end

    context "when sell_as is nil" do
      before do
        params[:sell_as] = ''
        fields.valid?
      end

      it { expect(fields).to_not be_valid }
      it { expect(fields.errors[:sell_as]).to include('cannot be blank') }
    end

    context "when amount is less than 1" do
      before do
        params[:amount] = '-1'
        fields.valid?
      end

      it { expect(fields).to_not be_valid }
      it { expect(fields.errors[:amount]).to include('must be greater than 0') }
    end

    context "when sell_price is less than 1" do
      before do
        params[:sell_price] = '0'
        fields.valid?
      end

      it { expect(fields).to_not be_valid }
      it { expect(fields.errors[:sell_price]).to include('must be greater than 0') }
    end
  end
end


