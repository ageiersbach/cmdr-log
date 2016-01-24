require 'rails_helper'

describe CargoItem do
  it { is_expected.to belong_to :cmdr }
  it { is_expected.to belong_to :commodity }
  it { is_expected.to validate_presence_of(:cmdr) }
  it { is_expected.to validate_presence_of(:commodity) }
end
