require 'rails_helper'

describe System do
  it { is_expected.to validate_presence_of(:name) }
end
