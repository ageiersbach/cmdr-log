require 'rails_helper'

describe CmdrsController do
  describe "#index" do
    let(:cmdrs) do
      [
        create(:cmdr, name: 'Gendibal'),
        create(:cmdr, name: 'Fuwwaz')
      ]
    end

    it "is successful" do
      get :index
      expect(response).to be_success
    end

    it "gets the cmdrs" do
      get :index
      expect(assigns(:cmdrs)).to eq(cmdrs)
    end
  end
end
