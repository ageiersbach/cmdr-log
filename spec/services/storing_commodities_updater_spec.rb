require 'rails_helper'

describe StoringCommodities::Updater do
  subject(:updater) { StoringCommodities::Updater.new(params) }

  describe "#new" do
    include_context "params for stored commodities"
    it "assigns @fields" do
      fields = updater.instance_variable_get('@fields')
      expect(fields).to be_an_instance_of StoringCommodities::Fields
    end
  end

  describe "#valid?" do
    include_context "params for stored commodities"

    context "when valid" do
      include_context "three stored_commodities"
      it { expect(updater).to be_valid }
    end

    context "when fields are invalid" do
      before { params[:ship_id] = '' }

      it { expect(updater).to_not be_valid }
    end

    context "when amount is greater than the number of stored_commodities" do
      include_context "three stored_commodities"
      before do
        params[:amount] = '4'
        updater.valid?
      end

      it { expect(updater).to_not be_valid }
      it { expect(updater.errors[:amount]).to include("must be between 1 and 3") }
    end
  end

  describe "#total_profit" do
    include_context "params for stored commodities"
    include_context "three stored_commodities"

    context "when :per_unit" do
      before { params[:sell_as] = 'per_unit' }

      it { expect(updater.total_profit).to eq(4000) }
    end

    context "when :total" do
      before { params[:sell_as] = 'total' }

      it { expect(updater.total_profit).to eq(2000) }
    end

    context "when invalid" do
      before { params[:sell_as] = 'bogus' }

      it { expect(updater.total_profit).to eq(0) }
    end
  end

  describe "#update" do
    include_context "params for stored commodities"
    include_context "three stored_commodities"

    context "the first extracted_resource" do
      let(:id) { extracted_resources[0].id }

      it_should_behave_like "an update based on :sell_as"
    end

    context "the second extracted resource" do
      let(:id) { extracted_resources[1].id }
      it_should_behave_like "an update based on :sell_as"
    end

    context "the third extracted resource" do
      let(:id) { extracted_resources[2].id }

      it_should_behave_like "unupdated"
    end
  end
end
