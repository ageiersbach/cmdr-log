require 'rails_helper'

describe Entry do
  it { is_expected.to belong_to :cmdr }
  it { is_expected.to belong_to :system_object }
  it { is_expected.to have_many :extracted_resources }
  it { is_expected.to validate_presence_of  :cmdr }
  it { is_expected.to validate_presence_of  :activity }
  it { is_expected.to validate_presence_of :system_object }

  describe "scopes" do
    let!(:entries) { create_list(:entry, 4) }
    subject(:reverse_cron) { Entry.reverse_cron }

    it { expect(reverse_cron).to eq(entries.reverse) }
  end
end
