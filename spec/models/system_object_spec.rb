require 'rails_helper'

describe SystemObject do
  it { is_expected.to belong_to :system }
  it { is_expected.to validate_presence_of(:name) }
end
