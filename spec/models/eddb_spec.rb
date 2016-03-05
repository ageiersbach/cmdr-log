require 'rails_helper'

describe Eddb do
  describe ".systems" do
    before do
      # The test should not actually call the api ;)
      allow(Eddb).to receive(:get).with("/archive/v4/systems.json").and_return(json)
    end

    let(:json) do
      [{
        "id":17,
        "name":"10 Ursae Majoris",
        "x":0.03125,
        "y":34.90625,
        "z":-39.09375,
        "faction":"NoneNone",
        "population":0,
        "government":"None",
        "allegiance":"None",
        "state":"None",
        "security":"Low",
        "primary_economy":"None",
        "power":"None",
        "needs_permit":0,
        "simbad_ref":"10 Ursae Majoris"},
        {"id":18, "name":"101 Tauri",
        "x":12.0625,
        "y":-35.375,
        "z":-127.78125,
        "faction":"101 Tauri Labour"}]
    end

    let(:systems) { Eddb.systems }

    it { expect(systems).to be_an Array }
  end
end
