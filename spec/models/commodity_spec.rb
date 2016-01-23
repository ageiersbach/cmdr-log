require 'rails_helper'

describe Commodity do
  it { is_expected.to validate_presence_of(:name) }
end
