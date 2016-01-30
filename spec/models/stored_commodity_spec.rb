require 'rails_helper'

describe StoredCommodity do
  it { is_expected.to belong_to :commodity }
  it { is_expected.to belong_to :entry }
  it { is_expected.to belong_to :ship }
  it { is_expected.to validate_presence_of :commodity }
  it { is_expected.to validate_presence_of :entry }
end
