require 'rails_helper'

describe System do
  it { is_expected.to validate_presence_of(:name) }

  it "scopes uniqueness of name to x,y,z" do
    create(:system, name: 'Foo', x: 0.0, y: 0.0, z: 0.0)
    duplicate_system = build(:system, name: 'Foo', x: 0.0, y: 0.0, z: 0.0)
    expect(duplicate_system).to_not be_valid
    expect(duplicate_system.errors[:name]).to include("has already been taken")
  end
end
