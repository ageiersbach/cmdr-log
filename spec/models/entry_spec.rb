require 'rails_helper'

describe Entry do
  it { is_expected.to belong_to :activity }
  it { is_expected.to belong_to :cmdr }
  it { is_expected.to belong_to :system_object }
  it { is_expected.to belong_to :note }
  it { is_expected.to have_many :extracted_resources }
  it { is_expected.to validate_presence_of  :cmdr }
  it { is_expected.to validate_presence_of  :activity }
  it { is_expected.to validate_presence_of :system_object }

  describe "#activity_template" do
    let(:entry) { build(:entry, activity: Activity.first) }
    it "delegates to the activity" do
      expect(entry.activity_template).to eq(Activity.first.template)
    end
  end

  describe "#as_presenter" do
    let(:entry) { build(:entry, activity: Activity.first) }

    it "initializes the entry as its presenter object" do
      expect(entry.as_presenter).to be_an_instance_of(MiningEntryPresenter)
    end
  end

  describe "scopes" do
    let!(:entries) { create_list(:entry, 4) }
    subject(:reverse_cron) { Entry.reverse_cron }

    it { expect(reverse_cron).to eq(entries.reverse) }
  end
end
