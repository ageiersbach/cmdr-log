require 'rails_helper'

describe Ship do
  it { is_expected.to belong_to :cmdr }
  it { is_expected.to validate_presence_of(:model) }
end
