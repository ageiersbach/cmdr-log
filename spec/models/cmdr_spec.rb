require 'rails_helper'

describe Cmdr do
  it { is_expected.to validate_presence_of(:name) }
end
