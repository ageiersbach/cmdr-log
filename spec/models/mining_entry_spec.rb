require 'rails_helper'

describe MiningEntry do
  it { is_expected.to belong_to :cmdr }
  it { is_expected.to belong_to :system_object }
  it { is_expected.to validate_presence_of  :cmdr }
  it { is_expected.to validate_presence_of :system_object }
end
