require 'rails_helper'

describe ExtractedResource do
  it { is_expected.to belong_to :mining_entry }
  it { is_expected.to belong_to :commodity }
  it { is_expected.to validate_presence_of :mining_entry }
  it { is_expected.to validate_presence_of :commodity } 
end
